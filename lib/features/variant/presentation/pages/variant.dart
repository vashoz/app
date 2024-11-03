import '../../../../core/shared/shared.dart';

class VariantPage extends StatelessWidget {
  static const String path = '/variant';
  static const String name = 'VariantPage';
  const VariantPage({super.key});

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
