import '../../../../core/shared/shared.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onSeeMore;
  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.onSeeMore,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: theme.textSecondary,
                ),
                SizedBox(width: Dimension.padding.horizontal.medium),
                Text(
                  title,
                  style: context.textStyle13Regular(color: theme.textSecondary).copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            InkWell(
              onTap: onSeeMore,
              borderRadius: BorderRadius.circular(Dimension.radius.twelve),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "See more",
                    style: context.textStyle10Regular(color: theme.link).copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: Dimension.padding.horizontal.small),
                  Icon(Icons.arrow_forward_rounded, color: theme.link, size: Dimension.radius.twelve),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
