import 'package:memeory/core/models/meme.dart';
import 'package:memeory/core/models/meme_search_result.dart';
import 'package:memeory/core/models/paginated_response.dart';
import 'package:memeory/core/network/api_client.dart';
import 'package:memeory/features/search/domain/repositories/meme_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final memeRepositoryProvider = Provider<MemeRepository>((ref) {
  return MemeRepositoryImpl(ref.read(apiClientProvider));
});

class MemeRepositoryImpl implements MemeRepository {
  final ApiClient _apiClient;

  MemeRepositoryImpl(this._apiClient);

  SupabaseClient get _supabase => _apiClient.supabase;

  @override
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
  }) async {
    final params = <String, dynamic>{
      'p_query': query,
      'p_limit': limit,
    };

    if (categoryId != null) {
      params['p_category_id'] = categoryId;
    }
    if (year != null) {
      params['p_year'] = year;
    }
    if (yearFrom != null) {
      params['p_year_from'] = yearFrom;
    }
    if (yearTo != null) {
      params['p_year_to'] = yearTo;
    }
    if (tags != null && tags.isNotEmpty) {
      params['p_tags'] = tags;
    }
    if (sort != null) {
      params['p_sort'] = sort;
    }
    if (cursor != null) {
      params['p_cursor'] = cursor;
    }

    final response = await _supabase.rpc<List<dynamic>>(
      'search_memes',
      params: params,
    );

    final data = (response as List)
        .map((json) => MemeSearchResult.fromJson(json as Map<String, dynamic>))
        .toList();

    String? nextCursor;
    if (data.length >= limit) {
      nextCursor = data.last.id;
    }

    return PaginatedResponse(
      data: data,
      nextCursor: nextCursor,
      hasMore: nextCursor != null,
      totalCount: data.length,
      limit: limit,
    );
  }

  @override
  Future<PaginatedResponse<MemeSearchResult>> getTrendingMemes({
    String? platform,
    int? categoryId,
    String? cursor,
    required int limit,
  }) async {
    final params = <String, dynamic>{
      'p_limit': limit,
    };

    if (platform != null) {
      params['p_platform'] = platform;
    }
    if (categoryId != null) {
      params['p_category_id'] = categoryId;
    }
    if (cursor != null) {
      params['p_cursor'] = cursor;
    }

    final response = await _supabase.rpc<List<dynamic>>(
      'search_memes',
      params: params,
    );

    final data = (response as List)
        .map((json) => MemeSearchResult.fromJson(json as Map<String, dynamic>))
        .toList();

    String? nextCursor;
    if (data.length >= limit) {
      nextCursor = data.last.id;
    }

    return PaginatedResponse(
      data: data,
      nextCursor: nextCursor,
      hasMore: nextCursor != null,
      totalCount: data.length,
      limit: limit,
    );
  }

  @override
  Future<PaginatedResponse<MemeSearchResult>> getTimelineMemes({
    required int yearsAgo,
    required int limit,
    String? cursor,
  }) async {
    final params = <String, dynamic>{
      'p_years_ago': yearsAgo,
      'p_limit': limit,
    };

    if (cursor != null) {
      params['p_cursor'] = cursor;
    }

    final response = await _supabase.rpc<List<dynamic>>(
      'get_timeline_memes',
      params: params,
    );

    final data = (response as List)
        .map((json) => MemeSearchResult.fromJson(json as Map<String, dynamic>))
        .toList();

    String? nextCursor;
    if (data.length >= limit) {
      nextCursor = data.last.id;
    }

    return PaginatedResponse(
      data: data,
      nextCursor: nextCursor,
      hasMore: nextCursor != null,
      totalCount: data.length,
      limit: limit,
    );
  }

  @override
  Future<Meme?> getMemeById(String id) async {
    final response = await _supabase
        .from('memes')
        .select()
        .eq('id', id)
        .eq('status', 'active')
        .maybeSingle();

    if (response == null) return null;
    return Meme.fromJson(response);
  }

  @override
  Future<PaginatedResponse<MemeSearchResult>> getMemesByCategory({
    required int categoryId,
    String? cursor,
    required int limit,
  }) async {
    final params = <String, dynamic>{
      'p_query': null,
      'p_category_id': categoryId,
      'p_limit': limit,
    };

    if (cursor != null) {
      params['p_cursor'] = cursor;
    }

    final response = await _supabase.rpc<List<dynamic>>(
      'search_memes',
      params: params,
    );

    final data = (response as List)
        .map((json) => MemeSearchResult.fromJson(json as Map<String, dynamic>))
        .toList();

    String? nextCursor;
    if (data.length >= limit) {
      nextCursor = data.last.id;
    }

    return PaginatedResponse(
      data: data,
      nextCursor: nextCursor,
      hasMore: nextCursor != null,
      totalCount: data.length,
      limit: limit,
    );
  }

  @override
  Future<PaginatedResponse<MemeSearchResult>> getMemesByYear({
    required int year,
    String? cursor,
    required int limit,
  }) async {
    final params = <String, dynamic>{
      'p_query': null,
      'p_year': year,
      'p_limit': limit,
    };

    if (cursor != null) {
      params['p_cursor'] = cursor;
    }

    final response = await _supabase.rpc<List<dynamic>>(
      'search_memes',
      params: params,
    );

    final data = (response as List)
        .map((json) => MemeSearchResult.fromJson(json as Map<String, dynamic>))
        .toList();

    String? nextCursor;
    if (data.length >= limit) {
      nextCursor = data.last.id;
    }

    return PaginatedResponse(
      data: data,
      nextCursor: nextCursor,
      hasMore: nextCursor != null,
      totalCount: data.length,
      limit: limit,
    );
  }
}