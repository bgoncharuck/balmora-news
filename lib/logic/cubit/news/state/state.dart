import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'feed_item.dart';

part 'state.g.dart';

enum NewsErrorType {
  none,
  emptyList,
  firstLoad,
  firstLoadException,
  exception,
}

@JsonSerializable(explicitToJson: true)
class NewsState extends Equatable {
  const NewsState({
    required this.newItems,
    required this.initialItems,
    required this.errorType,
    required this.errorMessage,
    required this.page,
    required this.hasReachedMax,
    this.initialTime,
    this.oldestTime,
  });

  NewsState.initial()
    : this(
        newItems: const [],
        initialItems: const [],
        errorType: NewsErrorType.emptyList,
        errorMessage: '',
        hasReachedMax: false,
        initialTime: DateTime.now(),
        oldestTime: DateTime.now().subtract(const Duration(days: 14)),
        page: 0,
      );

  factory NewsState.fromJson(Map<String, dynamic> json) =>
      _$NewsStateFromJson(json);

  Map<String, dynamic> toJson() => _$NewsStateToJson(this);

  NewsState copyWith({
    List<NewsFeedItem>? newItems,
    List<NewsFeedItem>? initialItems,
    NewsErrorType? errorType,
    String? errorMessage,
    int? page,
    bool? hasReachedMax,
    DateTime? initialTime,
    DateTime? oldestTime,
  }) {
    return NewsState(
      newItems: newItems ?? this.newItems,
      initialItems: initialItems ?? this.initialItems,
      errorType: errorType ?? this.errorType,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      initialTime: initialTime ?? this.initialTime,
      oldestTime: oldestTime ?? this.oldestTime,
    );
  }

  NewsState firstLoad() {
    return copyWith(
      errorType: NewsErrorType.firstLoad,
      errorMessage: 'Loading...',
    );
  }

  NewsState firstLoadException(String message) {
    return copyWith(
      errorType: NewsErrorType.firstLoadException,
      errorMessage: message,
    );
  }

  /// if newItems > pageSize, recreate initialItems
  final List<NewsFeedItem> newItems;
  final List<NewsFeedItem> initialItems;
  final NewsErrorType errorType;
  final String errorMessage;
  final DateTime? initialTime;
  final DateTime? oldestTime;
  final int page;

  /// To stop fetching if the API returns fewer items than requested
  final bool hasReachedMax;

  bool get hasError =>
      errorType != NewsErrorType.none && errorType != NewsErrorType.firstLoad;

  @override
  List<Object?> get props => [
    newItems,
    initialItems,
    errorType,
    errorMessage,
    hasReachedMax,
    initialTime,
    oldestTime,
    page,
  ];
}
