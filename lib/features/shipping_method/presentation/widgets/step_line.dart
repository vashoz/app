import '../../../../core/shared/shared.dart';

class StepLine extends StatelessWidget {
  final bool isActive;
  const StepLine({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: EdgeInsets.zero,
          height: 2,
          color: isActive ? theme.positive : theme.textLight.withOpacity(.3),
        );
      },
    );
  }
}
