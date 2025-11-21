import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/data/entity/news_api/news_api_request.dart';
import 'package:balmoranews/data/entity/news_api/news_article.dart';
import 'package:dio/dio.dart';

class NewsApi {
  const NewsApi({
    required Dio dio,
    required String apiKey,
  }) : _dio = dio,
       _apiKey = apiKey;

  final Dio _dio;
  final String _apiKey;

  Future<List<NewsArticle>> fetchArticles({
    required NewsApiRequest request,
  }) async {
    final queryParameters = {
      'q': request.newsKeyWord,
      'sortBy': 'publishedAt',
      'apiKey': _apiKey,
      'language': request.language,
      'from': request.fromTime.toIso8601String(),
      'to': request.toTime.toIso8601String(),
      'pageSize': request.pageSize,
      'page': request.page,
    };

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/everything',
        queryParameters: queryParameters,
      );

      if (response.statusCode != 200) {
        final message = 'News API returned ${response.statusCode}';
        await logger.message(message);
        throw Exception(message);
      }

      final data = response.data!;
      final articlesJson = data['articles'] as List<dynamic>;
      return articlesJson
          .map((json) => NewsArticle.fromJson(json as Map<String, dynamic>))
          .toList();

      //
    } on DioException catch (e, t) {
      if (e.response != null) {
        await logger.message(
          'Dio Error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        await logger.exception(e, t);
      }

      rethrow;
    }
  }
}
