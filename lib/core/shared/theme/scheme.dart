import '../shared.dart';

class ThemeScheme {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color white;
  final Color black;
  final Color textLight;
  final Color positive;
  final Color linkColor;
  final Color iconColor;
  final Color borderColor;
  final Color primaryDark;
  final Color primary = const Color(0xFF6CC51D);
  final Color primaryLight;
  final Color negative;
  final Color warning;
  final Color shimmer;
  final Color favoriteColor;
  final Color cardColor;
  final LinearGradient gradient;

  ThemeScheme({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.textSecondary,
    required this.textPrimary,
    required this.textTertiary,
    required this.textLight,
    required this.white,
    required this.black,
    required this.positive,
    required this.primaryLight,
    required this.primaryDark,
    required this.linkColor,
    required this.borderColor,
    required this.negative,
    required this.warning,
    required this.shimmer,
    required this.gradient,
    required this.iconColor,
    required this.cardColor,
    required this.favoriteColor,
  });

  factory ThemeScheme.light() {
    final theme = ThemeScheme(
      backgroundPrimary: const Color(0xFFFFFFFF),
      backgroundSecondary: const Color(0xFFF4F5F9),
      backgroundTertiary: const Color(0xFFF5F5F5),
      textPrimary: const Color(0xFF1c1c1c),
      textLight: const Color(0xFF868889),
      textTertiary: const Color(0xFF868889),
      textSecondary: const Color(0xFF66666e),
      iconColor: const Color(0xFFFFFFFF),
      white: const Color(0xFFFFFFFF),
      black: const Color(0xFF000000),
      positive: const Color(0xFF058c42),
      primaryDark: const Color(0xFF6CC51D),
      primaryLight: const Color(0xFFEBFFD7),
      linkColor: const Color(0xFF1A0DAB),
      borderColor: const Color(0xFFEBEBEB),
      negative: const Color(0xFFe41749),
      warning: const Color(0xFFff8000),
      shimmer: const Color(0xFFf4f4f9),
      favoriteColor: const Color(0xFFFF4848),
      cardColor: const Color(0xFFFFFFFF),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFAEDC81),
          Color(0xFF6CC51D),
        ],
      ),
    );

    return theme;
  }

  factory ThemeScheme.dark() {
    final theme = ThemeScheme(
      backgroundPrimary: const Color(0xFF161622),
      backgroundSecondary: const Color(0xFF171717),
      backgroundTertiary: const Color(0xFF2d2926),
      textSecondary: const Color(0xFFFFFFFF),
      textPrimary: const Color(0xFFFFFFFF),
      textTertiary: const Color(0xFF868889),
      white: const Color(0xFFFFFFFF),
      black: const Color(0xFF000000),
      primaryLight: const Color(0xFFEBFFD7),
      textLight: const Color(0xFF6c757d),
      iconColor: const Color(0xFFFFFFFF),
      positive: const Color(0xFF058c42),
      primaryDark: const Color(0xFF2f3e46),
      linkColor: const Color(0xFF354f52),
      borderColor: const Color(0xFF52796f),
      negative: const Color(0xFFfd0054),
      warning: const Color(0xFFff8000),
      shimmer: const Color(0xFFf4f4f9),
      favoriteColor: const Color(0xFFFF4848),
      cardColor: const Color.fromARGB(255, 52, 52, 52),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFAEDC81),
          Color(0xFF6CC51D),
        ],
      ),
    );

    return theme;
  }
}
