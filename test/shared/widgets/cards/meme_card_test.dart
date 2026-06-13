import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memeory/shared/widgets/cards/meme_card.dart';

Widget wrapInApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(
        width: 300,
        child: child,
      ),
    ),
  );
}

void main() {
  group('MemeCard', () {
    const testId = 'test-meme-1';
    const testTitle = 'Test Meme Title';
    const testThumbnail = 'https://example.com/meme.jpg';
    const testYear = '2024';
    const testViewCount = 15000;

    testWidgets('renders required fields', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testYear), findsOneWidget);
      expect(find.text('15.0K'), findsOneWidget);
    });

    testWidgets('formats view count under 1000', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: 42,
          ),
        ),
      );

      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('formats view count in millions', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: 2500000,
          ),
        ),
      );

      expect(find.text('2.5M'), findsOneWidget);
    });

    testWidgets('shows year as chip in metadata', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
          ),
        ),
      );

      expect(find.text(testYear), findsOneWidget);
    });

    testWidgets('calls onTap when card tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        wrapInApp(
          MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
            onTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.byType(MemeCard));
      expect(tapped, isTrue);
    });

    testWidgets(
      'shows bookmark icon when onBookmarkToggle provided',
      (tester) async {
        await tester.pumpWidget(
          wrapInApp(
            MemeCard(
              id: testId,
              title: testTitle,
              thumbnailUrl: testThumbnail,
              year: testYear,
              viewCount: testViewCount,
              onBookmarkToggle: (_) {},
            ),
          ),
        );

        expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
      },
    );

    testWidgets(
      'hides bookmark icon when onBookmarkToggle is null',
      (tester) async {
        await tester.pumpWidget(
          wrapInApp(
            const MemeCard(
              id: testId,
              title: testTitle,
              thumbnailUrl: testThumbnail,
              year: testYear,
              viewCount: testViewCount,
            ),
          ),
        );

        expect(find.byIcon(Icons.bookmark_border), findsNothing);
        expect(find.byIcon(Icons.bookmark), findsNothing);
      },
    );

    testWidgets('shows filled bookmark when isBookmarked true', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
            isBookmarked: true,
            onBookmarkToggle: (_) {},
          ),
        ),
      );

      expect(find.byIcon(Icons.bookmark), findsOneWidget);
    });

    testWidgets(
      'calls onBookmarkToggle with meme id when bookmark tapped',
      (tester) async {
        String? receivedId;

        await tester.pumpWidget(
          wrapInApp(
            MemeCard(
              id: testId,
              title: testTitle,
              thumbnailUrl: testThumbnail,
              year: testYear,
              viewCount: testViewCount,
              onBookmarkToggle: (id) => receivedId = id,
            ),
          ),
        );

        await tester.tap(find.byIcon(Icons.bookmark_border));
        expect(receivedId, equals(testId));
      },
    );

    testWidgets('onTap not called when bookmark tapped', (tester) async {
      var cardTapped = false;
      var bookmarkTapped = false;

      await tester.pumpWidget(
        wrapInApp(
          MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
            onTap: () => cardTapped = true,
            onBookmarkToggle: (_) => bookmarkTapped = true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.bookmark_border));
      expect(bookmarkTapped, isTrue);
      expect(cardTapped, isFalse);
    });

    testWidgets('does not render qualityScore by default', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
          ),
        ),
      );

      expect(find.text('87'), findsNothing);
    });

    testWidgets('renders in dark theme without errors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          home: const Scaffold(
            body: SizedBox(
              width: 300,
              child: MemeCard(
                id: testId,
                title: testTitle,
                thumbnailUrl: testThumbnail,
                year: testYear,
                viewCount: testViewCount,
              ),
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('renders in light theme without errors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData.light(),
          home: const Scaffold(
            body: SizedBox(
              width: 300,
              child: MemeCard(
                id: testId,
                title: testTitle,
                thumbnailUrl: testThumbnail,
                year: testYear,
                viewCount: testViewCount,
              ),
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('renders thumbnail with correct aspect ratio', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
          ),
        ),
      );

      final image = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, testThumbnail);
      expect(image.fit, BoxFit.cover);
    });

    testWidgets('shows view count with visibility icon', (tester) async {
      await tester.pumpWidget(
        wrapInApp(
          const MemeCard(
            id: testId,
            title: testTitle,
            thumbnailUrl: testThumbnail,
            year: testYear,
            viewCount: testViewCount,
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
    });
  });
}