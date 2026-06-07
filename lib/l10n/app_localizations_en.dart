// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Memeory';

  @override
  String get tagline => 'Relive the Internet\'s funniest memories.';

  @override
  String get home => 'Home';

  @override
  String get search => 'Search';

  @override
  String get timeline => 'Timeline';

  @override
  String get trending => 'Trending';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get homeIntro =>
      'Explore meme history, current trends, and AI-powered cultural context in one place.';

  @override
  String get searchMemes => 'Search memes';

  @override
  String get searchIntro =>
      'Find memes by title, year, category, tags, and trending status.';

  @override
  String get timelineTitle => 'Today in meme history';

  @override
  String get timelineIntro =>
      'Browse what was funny exactly 1, 2, and 3 years ago today.';

  @override
  String get trendingTitle => 'Trending memes';

  @override
  String get trendingIntro =>
      'Track near-real-time meme trends from Reddit, TikTok, YouTube, and curated sources.';

  @override
  String get profileIntro =>
      'Your bookmarks, preferences, and account details will live here.';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get system => 'System';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';
}
