import 'dart:async';
import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/data/entity/news_api/news_api_request.dart';
import 'package:balmoranews/data/service/news_api/config/config.dart';
import 'package:balmoranews/logic/cubit/news/state/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'state/feed_item.dart';

class NewsCubit extends HydratedCubit<NewsState> {
  NewsCubit(this.configNotifier) : super(NewsState.initial()) {
    configNotifier.addListener(_onConfigChanged);
    _init();
  }
  final NewsConfigNotifier configNotifier;
  NewsRequestConfig get config => configNotifier.config;

  @override
  Future<void> close() {
    configNotifier.removeListener(_onConfigChanged);
    return super.close();
  }

  Future<void> _onConfigChanged() async {
    emit(NewsState.initial());
    await onEmptyInitialList();
  }

  void _init() {
    if (state.initialItems.isEmpty) {
      unawaited(onEmptyInitialList());
    }
  }

  /// If there are empty list, we are fetching the first page
  /// On any exception we stop, show the error
  /// and give the user the opportunity to retry
  Future<void> onEmptyInitialList() async {
    emit(state.firstLoad());
    try {
      await initialFetch();
    } catch (e) {
      emit(state.firstLoadException(e.toString()));
    }
  }

  Future<void> initialFetch({NewsState? newState}) async {
    try {
      final articles = await newsApi.fetchArticles(
        request: NewsApiRequest(
          language: config.language,
          pageSize: config.pageSize,
          newsKeyWord: config.newsKeyWord,
          fromTime: state.oldestTime!,
          toTime: state.initialTime!,
          page: 1,
        ),
      );

      final initialItems = articles.map(NewsFeedItem.article).toList();
      final initialTime = _lastFeedItemTime(initialItems);
      emit(
        (newState ?? state).copyWith(
          errorType: NewsErrorType.none,
          hasReachedMax: false,
          initialItems: initialItems,
          initialTime: initialTime,
          page: 1,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// if updated items 3 times the size of the page size
  /// we recreate initial list with new dates
  /// otherwise we add items on top of the initial list
  Future<void> update() async {
    /// if there is no initial list, method can't be executed
    if (state.initialItems.isEmpty) {
      return;
    }

    final maxSize = config.pageSize * 3;
    try {
      await _updateInitialTimeIfNeeded();

      final newItems = await newsApi.fetchArticles(
        request: NewsApiRequest(
          language: config.language,
          newsKeyWord: config.newsKeyWord,
          pageSize: maxSize,
          fromTime: state.initialTime!,
          toTime: DateTime.now(),
          page: 1,
        ),
      );
      if (newItems.isEmpty) {
        return;
      } else if (newItems.length >= maxSize) {
        try {
          await initialFetch(newState: NewsState.initial());
        } catch (e) {
          //
        }
      } else {
        emit(
          state.copyWith(
            newItems: [
              ...newItems.map(NewsFeedItem.article),
              NewsFeedItem.separator(state.initialTime!),
            ],
          ),
        );
      }
    } catch (e) {
      // ignore
    }
  }

  Future<void> nextPage() async {
    if (state.hasReachedMax) {
      return;
    }

    try {
      final nextPageItems = await newsApi.fetchArticles(
        request: NewsApiRequest(
          language: config.language,
          pageSize: config.pageSize,
          newsKeyWord: config.newsKeyWord,
          fromTime: state.oldestTime!,
          toTime: state.initialTime!,
          page: state.page + 1,
        ),
      );

      /// any error during fetching will be
      /// already handled as exception
      /// so if number of new items is smaller
      /// then a page size, it means it's the last page
      final hasReachedMax = nextPageItems.length < config.pageSize;

      emit(
        state.copyWith(
          initialItems: [
            ...state.initialItems,
            ...nextPageItems.map(NewsFeedItem.article),
          ], // Append to bottom
          page: state.page + 1,
          hasReachedMax: hasReachedMax,
          errorType: NewsErrorType.none,
        ),
      );
    } catch (e) {
      // ignore
    }
  }

  /// hydrated
  @override
  NewsState fromJson(Map<String, dynamic> json) => NewsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(NewsState state) => state.toJson();

  /// API time and json_annotation mismatch fix
  static const _extraSecondsAfterNewestItem = 9;
  static const _timeTolerance = Duration(seconds: 5);

  DateTime? _lastFeedItemTime(List<NewsFeedItem> items) {
    try {
      final newestItemTime = DateTime.parse(
        items.first.article!.publishedAt!,
      ).toUtc();
      final extraTimeAfterNewestItem = newestItemTime.add(
        const Duration(seconds: _extraSecondsAfterNewestItem),
      );
      return extraTimeAfterNewestItem;
    } catch (e) {
      return null;
    }
  }

  bool _isSignificantlyDifferent(DateTime? a, DateTime? b) {
    if (a == null && b == null) return false;
    if (a == null || b == null) return true;
    final diff = a.toUtc().difference(b.toUtc()).abs();
    return diff > _timeTolerance;
  }

  Future<void> _updateInitialTimeIfNeeded() async {
    try {
      final newestItemTime = DateTime.parse(
        state.initialItems.first.article!.publishedAt!,
      ).toUtc();
      final correctInitialTime = newestItemTime.add(
        const Duration(seconds: _extraSecondsAfterNewestItem),
      );
      if (_isSignificantlyDifferent(correctInitialTime, state.initialTime)) {
        emit(state.copyWith(initialTime: correctInitialTime));
      }
    } catch (e) {
      // ignore
    }
  }
}
