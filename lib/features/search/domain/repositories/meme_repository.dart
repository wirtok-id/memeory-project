import 'package:memeory/core/models/meme.dart';
import 'package:memeory/core/models/meme_search_result.dart';
import 'package:memeory/core/models/paginated_response.dart';

abstract interface class MemeRepository {
  Future<PaginatedResponse<MemeSearchResult>> searchMemes({
    required String query,
    int? categoryId,
    int? year,
    int? yearFrom,
    int? yearTo,
    List<String>? tags,
    String? sort,
    String? cursor,
    required int limit,
  });

  Future<PaginatedResponse<MemeSearchResult>> getTrendingMemes({
    String? platform,
    int? categoryId,
    String? cursor,
    required int limit,
  });

  Future<PaginatedResponse<MemeSearchResult>> getTimelineMemes({
    required int yearsAgo,
    required int limit,
    String? cursor,
  });

  Future<Meme?> getMemeById(String id);

  Future<PaginatedResponse<MemeSearchResult>> getMemesByCategory({
    required int categoryId,
    String? cursor,
    required int limit,
  });

  Future<PaginatedResponse<MemeSearchResult>> getMemesByYear({
    required int year,
    String? cursor,
    required int limit,
  });
}