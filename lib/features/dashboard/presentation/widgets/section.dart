import '../../../../core/shared/shared.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  const SectionTitle({
    super.key,
    required this.title,
    required this.press,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: theme.positive,
                ),
                SizedBox(width: Dimension.padding.horizontal.medium),
                Text(
                  title,
                  style: context.textStyle15SemiBold(color: theme.textPrimary),
                ),
              ],
            ),
            InkWell(
              onTap: () => press(),
              child: Text(
                "See more",
                style: context.textStyle10Regular(color: theme.positive),
              ),
            ),
          ],
        );
      },
    );
  }
}
