import 'package:balmoranews/core/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Don't forget to update notifier
/// if adding new fields
class NewsRequestConfig extends Equatable {
  const NewsRequestConfig({
    required this.language,
    required this.pageSize,
    required this.newsKeyWord,
  });

  NewsRequestConfig copyWith({
    String? language,
    int? pageSize,
    String? newsKeyWord,
  }) {
    return NewsRequestConfig(
      language: language ?? this.language,
      pageSize: pageSize ?? this.pageSize,
      newsKeyWord: newsKeyWord ?? this.newsKeyWord,
    );
  }

  static NewsRequestConfig initial() {
    return NewsRequestConfig(
      language: newsConfigStorage.lang,
      pageSize: newsConfigStorage.pageSize,
      newsKeyWord: newsConfigStorage.search,
    );
  }

  final String language;
  final int pageSize;
  final String newsKeyWord;

  String get asKey => '$language-$pageSize-$newsKeyWord';

  @override
  List<Object?> get props => [language, pageSize, newsKeyWord];
}

class NewsConfigNotifier extends ChangeNotifier {
  NewsConfigNotifier(NewsRequestConfig initial) : _config = initial;

  NewsRequestConfig _config;
  NewsRequestConfig get config => _config;

  void setConfig(NewsRequestConfig newConfig) {
    final prev = _config;
    _config = newConfig;
    if (!_areEqual(prev, newConfig)) notifyListeners();
  }

  void _update({
    String? language,
    int? pageSize,
    String? newsKeyWord,
  }) {
    setConfig(
      _config.copyWith(
        language: language,
        pageSize: pageSize,
        newsKeyWord: newsKeyWord,
      ),
    );
  }

  Future<void> updateLanguage(String language) async {
    await newsConfigStorage.setLang(language);
    _update(language: language);
  }

  Future<void> updatePageSize(int pageSize) async {
    await newsConfigStorage.setPageSize(pageSize);
    _update(pageSize: pageSize);
  }

  Future<void> updateNewsKeyWord(String newsKeyWord) async {
    await newsConfigStorage.setSearch(newsKeyWord);
    _update(newsKeyWord: newsKeyWord);
  }

  bool _areEqual(NewsRequestConfig a, NewsRequestConfig b) {
    return a.language == b.language &&
        a.pageSize == b.pageSize &&
        a.newsKeyWord == b.newsKeyWord;
  }
}
