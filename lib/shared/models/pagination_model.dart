/// Metadata pagination dari API response.
///
/// Kompatibel dengan format:
/// ```json
/// {
///   "has_more": true,
///   "next_cursor": "uuid-of-last-item",
///   "total_count": 1432,
///   "limit": 20
/// }
/// ```
class PaginationMeta {
  const PaginationMeta({
    required this.hasMore,
    this.nextCursor,
    required this.totalCount,
    required this.limit,
  });

  /// Parse dari JSON response Supabase.
  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      hasMore: json['has_more'] as bool? ?? false,
      nextCursor: json['next_cursor'] as String?,
      totalCount: json['total_count'] as int? ?? 0,
      limit: json['limit'] as int? ?? 20,
    );
  }

  /// State awal (belum load data).
  const PaginationMeta.empty()
      : hasMore = false,
        nextCursor = null,
        totalCount = 0,
        limit = 20;

  final bool hasMore;
  final String? nextCursor;
  final int totalCount;
  final int limit;

  /// Apakah masih ada data yang bisa dimuat?
  bool get canLoadMore => hasMore && nextCursor != null;

  PaginationMeta copyWith({
    bool? hasMore,
    String? nextCursor,
    int? totalCount,
    int? limit,
  }) {
    return PaginationMeta(
      hasMore: hasMore ?? this.hasMore,
      nextCursor: nextCursor ?? this.nextCursor,
      totalCount: totalCount ?? this.totalCount,
      limit: limit ?? this.limit,
    );
  }
}

/// Response paginated dari Supabase API.
///
/// [T] adalah tipe item data (MemeModel, SearchResult, dll).
class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.data,
    required this.pagination,
  });

  /// Parse dari JSON response.
  ///
  /// [itemParser] convert setiap item JSON ke type T.
  /// [dataKey] key untuk list data (default: 'data').
  /// [paginationKey] key untuk pagination object (default: 'pagination').
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) itemParser, {
    String dataKey = 'data',
    String paginationKey = 'pagination',
  }) {
    final rawData = json[dataKey] as List<dynamic>? ?? [];
    final items = rawData
        .map((item) => itemParser(item as Map<String, dynamic>))
        .toList();

    final paginationJson = json[paginationKey] as Map<String, dynamic>?;
    final pagination = paginationJson != null
        ? PaginationMeta.fromJson(paginationJson)
        : const PaginationMeta.empty();

    return PaginatedResponse<T>(
      data: items,
      pagination: pagination,
    );
  }

  /// State awal.
  const PaginatedResponse.empty()
      : data = const [],
        pagination = const PaginationMeta.empty();

  final List<T> data;
  final PaginationMeta pagination;

  /// Gabungkan dengan page berikutnya.
  ///
  /// Mengembalikan [PaginatedResponse] baru dengan:
  /// - data = data saat ini + data page berikutnya
  /// - pagination = pagination dari page terakhir
  PaginatedResponse<T> merge(PaginatedResponse<T> nextPage) {
    return PaginatedResponse<T>(
      data: [...data, ...nextPage.data],
      pagination: nextPage.pagination,
    );
  }
}
