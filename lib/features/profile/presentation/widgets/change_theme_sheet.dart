import '../../../../../core/shared/shared.dart';

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        final mode = state.mode;
        return Container(
          margin: const EdgeInsets.all(16).copyWith(
            bottom: 48,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Change theme",
                    style: TextStyles.title(
                        context: context, color: theme.textPrimary),
                  ),
                ),
                SizedBox(height: Dimension.padding.vertical.small),
                const Divider(),
                SizedBox(height: Dimension.padding.vertical.small),
                ListTile(
                  leading: Icon(
                    mode == ThemeMode.light
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded,
                    color: mode == ThemeMode.light
                        ? theme.positive
                        : theme.textPrimary,
                  ),
                  trailing: Icon(
                    Icons.light_mode_rounded,
                    color: mode == ThemeMode.dark
                        ? theme.textLight
                        : theme.positive,
                  ),
                  title: Text(
                    "Light",
                    style: TextStyles.caption(
                      context: context,
                      color: mode == ThemeMode.light
                          ? theme.positive
                          : theme.textPrimary,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<ThemeBloc>().add(const ToggleTheme());
                    context.pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    mode == ThemeMode.dark
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded,
                    color: mode == ThemeMode.dark
                        ? theme.warning
                        : theme.textPrimary,
                  ),
                  trailing: Icon(
                    Icons.dark_mode_sharp,
                    color: mode == ThemeMode.dark
                        ? theme.warning
                        : theme.textLight,
                  ),
                  title: Text(
                    "Dark",
                    style: TextStyles.caption(
                      context: context,
                      color: mode == ThemeMode.dark
                          ? theme.warning
                          : theme.textPrimary,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<ThemeBloc>().add(const ToggleTheme());
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
