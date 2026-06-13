import 'package:flutter_test/flutter_test.dart';
import 'package:memeory/shared/models/pagination_model.dart';

void main() {
  group('PaginationMeta', () {
    test('parses from JSON correctly', () {
      final json = <String, dynamic>{
        'has_more': true,
        'next_cursor': '550e8400-e29b-41d4-a716-446655440001',
        'total_count': 1432,
        'limit': 20,
      };

      final meta = PaginationMeta.fromJson(json);

      expect(meta.hasMore, isTrue);
      expect(meta.nextCursor, '550e8400-e29b-41d4-a716-446655440001');
      expect(meta.totalCount, 1432);
      expect(meta.limit, 20);
    });

    test('handles null next_cursor', () {
      final json = <String, dynamic>{
        'has_more': false,
        'next_cursor': null,
        'total_count': 50,
        'limit': 20,
      };

      final meta = PaginationMeta.fromJson(json);

      expect(meta.hasMore, isFalse);
      expect(meta.nextCursor, isNull);
      expect(meta.totalCount, 50);
      expect(meta.limit, 20);
    });

    test('handles missing fields with defaults', () {
      final json = <String, dynamic>{};

      final meta = PaginationMeta.fromJson(json);

      expect(meta.hasMore, isFalse);
      expect(meta.nextCursor, isNull);
      expect(meta.totalCount, 0);
      expect(meta.limit, 20);
    });

    test('empty returns correct defaults', () {
      const meta = PaginationMeta.empty();

      expect(meta.hasMore, isFalse);
      expect(meta.nextCursor, isNull);
      expect(meta.totalCount, 0);
      expect(meta.limit, 20);
    });

    test('canLoadMore is true when has_more and next_cursor exist', () {
      const meta = PaginationMeta(
        hasMore: true,
        nextCursor: 'some-uuid',
        totalCount: 100,
        limit: 20,
      );

      expect(meta.canLoadMore, isTrue);
    });

    test('canLoadMore is false when has_more is false', () {
      const meta = PaginationMeta(
        hasMore: false,
        nextCursor: 'some-uuid',
        totalCount: 100,
        limit: 20,
      );

      expect(meta.canLoadMore, isFalse);
    });

    test('canLoadMore is false when next_cursor is null', () {
      const meta = PaginationMeta(
        hasMore: true,
        nextCursor: null,
        totalCount: 100,
        limit: 20,
      );

      expect(meta.canLoadMore, isFalse);
    });

    test('copyWith creates new instance with updated fields', () {
      const meta = PaginationMeta(
        hasMore: true,
        nextCursor: 'uuid-1',
        totalCount: 100,
        limit: 20,
      );

      final updated = meta.copyWith(
        nextCursor: 'uuid-2',
        totalCount: 200,
      );

      expect(updated.hasMore, isTrue);
      expect(updated.nextCursor, 'uuid-2');
      expect(updated.totalCount, 200);
      expect(updated.limit, 20);
    });

    test('copyWith preserves unchanged fields', () {
      const meta = PaginationMeta(
        hasMore: true,
        nextCursor: 'uuid-1',
        totalCount: 100,
        limit: 10,
      );

      final updated = meta.copyWith(hasMore: false);

      expect(updated.hasMore, isFalse);
      expect(updated.nextCursor, 'uuid-1');
      expect(updated.totalCount, 100);
      expect(updated.limit, 10);
    });
  });

  group('PaginatedResponse', () {
    test('parses from JSON with item parser', () {
      final json = <String, dynamic>{
        'data': [
          {'id': '1', 'name': 'Item 1'},
          {'id': '2', 'name': 'Item 2'},
        ],
        'pagination': {
          'has_more': true,
          'next_cursor': '2',
          'total_count': 50,
          'limit': 20,
        },
      };

      final response = PaginatedResponse<Map<String, dynamic>>.fromJson(
        json,
        (item) => item,
      );

      expect(response.data.length, 2);
      expect(response.data[0]['id'], '1');
      expect(response.data[1]['id'], '2');
      expect(response.pagination.hasMore, isTrue);
      expect(response.pagination.nextCursor, '2');
      expect(response.pagination.totalCount, 50);
    });

    test('handles empty data array', () {
      final json = <String, dynamic>{
        'data': <Map<String, dynamic>>[],
        'pagination': {
          'has_more': false,
          'next_cursor': null,
          'total_count': 0,
          'limit': 20,
        },
      };

      final response = PaginatedResponse<Map<String, dynamic>>.fromJson(
        json,
        (item) => item,
      );

      expect(response.data, isEmpty);
      expect(response.pagination.hasMore, isFalse);
    });

    test('handles missing data key', () {
      final json = <String, dynamic>{
        'pagination': {
          'has_more': false,
          'next_cursor': null,
          'total_count': 0,
          'limit': 20,
        },
      };

      final response = PaginatedResponse<Map<String, dynamic>>.fromJson(
        json,
        (item) => item,
      );

      expect(response.data, isEmpty);
    });

    test('handles missing pagination key', () {
      final json = <String, dynamic>{
        'data': [
          {'id': '1'},
        ],
      };

      final response = PaginatedResponse<Map<String, dynamic>>.fromJson(
        json,
        (item) => item,
      );

      expect(response.data.length, 1);
      expect(response.pagination, const PaginationMeta.empty());
    });

    test('empty returns correct defaults', () {
      const response = PaginatedResponse<Map<String, dynamic>>.empty();

      expect(response.data, isEmpty);
      expect(response.pagination, const PaginationMeta.empty());
    });

    test('merge combines two responses', () {
      const page1 = PaginatedResponse<Map<String, dynamic>>(
        data: [
          {'id': '1'},
          {'id': '2'},
        ],
        pagination: PaginationMeta(
          hasMore: true,
          nextCursor: '2',
          totalCount: 4,
          limit: 2,
        ),
      );

      const page2 = PaginatedResponse<Map<String, dynamic>>(
        data: [
          {'id': '3'},
          {'id': '4'},
        ],
        pagination: PaginationMeta(
          hasMore: false,
          nextCursor: null,
          totalCount: 4,
          limit: 2,
        ),
      );

      final merged = page1.merge(page2);

      expect(merged.data.length, 4);
      expect(merged.data[0]['id'], '1');
      expect(merged.data[1]['id'], '2');
      expect(merged.data[2]['id'], '3');
      expect(merged.data[3]['id'], '4');
      expect(merged.pagination.hasMore, isFalse);
      expect(merged.pagination.nextCursor, isNull);
      expect(merged.pagination.totalCount, 4);
    });

    test('merge preserves page2 pagination', () {
      const page1 = PaginatedResponse<Map<String, dynamic>>(
        data: [
          {'id': '1'},
        ],
        pagination: PaginationMeta(
          hasMore: true,
          nextCursor: '1',
          totalCount: 100,
          limit: 20,
        ),
      );

      const page2 = PaginatedResponse<Map<String, dynamic>>(
        data: [
          {'id': '2'},
        ],
        pagination: PaginationMeta(
          hasMore: true,
          nextCursor: '2',
          totalCount: 100,
          limit: 20,
        ),
      );

      final merged = page1.merge(page2);

      expect(merged.pagination.nextCursor, '2');
      expect(merged.data.length, 2);
    });

    test('custom data and pagination keys', () {
      final json = <String, dynamic>{
        'items': [
          {'id': '1'},
        ],
        'meta': {
          'has_more': false,
          'next_cursor': null,
          'total_count': 1,
          'limit': 20,
        },
      };

      final response = PaginatedResponse<Map<String, dynamic>>.fromJson(
        json,
        (item) => item,
        dataKey: 'items',
        paginationKey: 'meta',
      );

      expect(response.data.length, 1);
      expect(response.pagination.hasMore, isFalse);
    });
  });
}
