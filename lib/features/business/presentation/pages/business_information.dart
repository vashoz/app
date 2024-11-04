import '../../../../core/shared/shared.dart';

class BusinessInformationPage extends StatelessWidget {
  static const String path = '/business-information';
  static const String name = 'BusinessInformationPage';
  const BusinessInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: Placeholder(),
        );
      },
    );
  }
}
