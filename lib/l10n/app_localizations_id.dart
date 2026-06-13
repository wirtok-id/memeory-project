// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Memeory';

  @override
  String get tagline => 'Hidupkan kembali memori terlucu dari internet.';

  @override
  String get home => 'Beranda';

  @override
  String get search => 'Cari';

  @override
  String get timeline => 'Linimasa';

  @override
  String get trending => 'Trending';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Pengaturan';

  @override
  String get homeIntro =>
      'Jelajahi sejarah meme, tren terbaru, dan konteks budaya berbasis AI dalam satu tempat.';

  @override
  String get searchMemes => 'Cari meme';

  @override
  String get searchIntro =>
      'Temukan meme berdasarkan judul, tahun, kategori, tag, dan status trending.';

  @override
  String get timelineTitle => 'Hari ini dalam sejarah meme';

  @override
  String get timelineIntro =>
      'Lihat apa yang lucu tepat 1, 2, dan 3 tahun lalu.';

  @override
  String get trendingTitle => 'Meme trending';

  @override
  String get trendingIntro =>
      'Pantau tren meme hampir real-time dari Reddit, TikTok, YouTube, dan sumber kurasi.';

  @override
  String get profileIntro =>
      'Bookmark, preferensi, dan detail akunmu akan tersedia di sini.';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Bahasa';

  @override
  String get system => 'Sistem';

  @override
  String get dark => 'Gelap';

  @override
  String get light => 'Terang';

  @override
  String get loginTitle => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Kata Sandi';

  @override
  String get loginButton => 'Masuk';

  @override
  String get loadingText => 'Memuat...';

  @override
  String loginFailed(String error) {
    return 'Login gagal: $error';
  }

  @override
  String get localeIndonesian => 'Bahasa Indonesia';

  @override
  String get localeEnglish => 'Bahasa Inggris';
}
