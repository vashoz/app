import '../../../../core/shared/shared.dart';

class FavoritePage extends StatelessWidget {
  static const String path = '/favorite';
  static const String name = 'FavoritePage';
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: const Placeholder(),
        );
      },
    );
  }
}
