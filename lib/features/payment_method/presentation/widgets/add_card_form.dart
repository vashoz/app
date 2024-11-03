import '../../../../core/shared/shared.dart';

class AddCardForm extends StatelessWidget {
  const AddCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Column(
          children: [
            TextField(
              style: context.textStyle12Regular(color: theme.textPrimary),
              decoration: InputDecoration(
                labelText: 'Name on the card',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: theme.textLight,
                ),
                labelStyle: context.textStyle10Regular(color: theme.textLight),
                filled: true,
                fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              style: context.textStyle12Regular(color: theme.textPrimary),
              decoration: InputDecoration(
                labelText: 'Card number',
                prefixIcon: Icon(
                  Icons.credit_card,
                  color: theme.textLight,
                ),
                labelStyle: context.textStyle10Regular(color: theme.textLight),
                filled: true,
                fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    style: context.textStyle12Regular(color: theme.textPrimary),
                    decoration: InputDecoration(
                      labelText: 'Month/Year',
                      prefixIcon: Icon(
                        Icons.calendar_month_sharp,
                        color: theme.textLight,
                      ),
                      labelStyle: context.textStyle10Regular(color: theme.textLight),
                      filled: true,
                      fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                    style: context.textStyle12Regular(color: theme.textPrimary),
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: theme.textLight,
                      ),
                      labelStyle: context.textStyle10Regular(color: theme.textLight),
                      filled: true,
                      fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
