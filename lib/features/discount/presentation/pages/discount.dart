import '../../../../core/shared/shared.dart';

class DiscountPage extends StatelessWidget {
  static const String path = '/discount';
  static const String name = 'DiscountPage';
  const DiscountPage({super.key});

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
