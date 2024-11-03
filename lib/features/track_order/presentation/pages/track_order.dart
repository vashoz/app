import '../../../../core/shared/shared.dart';

class TrackOrderPage extends StatelessWidget {
  static const String path = '/track-order';
  static const String name = 'TrackOrderPage';
  const TrackOrderPage({super.key});

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
