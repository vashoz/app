import 'package:dotted_border/dotted_border.dart';

import '../../../../core/shared/shared.dart';
import 'step_line.dart';

class CustomStepper extends StatelessWidget {
  final bool isActive;
  final bool completed;
  final int step;
  final String text;
  const CustomStepper(
      {super.key,
      required this.isActive,
      required this.step,
      required this.text,
      required this.completed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isActive && !completed)
                  CircleAvatar(
                    backgroundColor: theme.positive,
                    radius: 24,
                    child: Text(
                      "$step",
                      style:
                          context.textStyle13Regular(color: theme.textPrimary),
                    ),
                  )
                else if (completed)
                  CircleAvatar(
                    backgroundColor: theme.positive,
                    radius: 24,
                    child: Icon(Icons.check, color: theme.textPrimary),
                  )
                else
                  DottedBorder(
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(24),
                    dashPattern: const [6, 3, 2, 3],
                    padding: const EdgeInsets.all(20),
                    color: isActive ? theme.positive : theme.textLight,
                    child: Text(
                      "$step",
                      style:
                          context.textStyle13Regular(color: theme.textPrimary),
                    ),
                  ),
                if (step < 3)
                  Expanded(
                    child: StepLine(
                      isActive: isActive,
                    ),
                  ),
              ],
            ),
            SizedBox(height: Dimension.padding.vertical.medium),
            Text(
              text,
              style: context.textStyle10Regular(
                color: isActive ? theme.textPrimary : theme.textLight,
              ),
            ),
          ],
        );
      },
    );
  }
}
