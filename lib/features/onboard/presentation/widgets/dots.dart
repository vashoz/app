import '../../../../core/shared/shared.dart';

class OnboardIndicatorWidget extends StatelessWidget {
  final int index;
  final int currentPage;
  const OnboardIndicatorWidget({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AnimatedContainer(
      curve: Curves.easeInOutSine,
      duration: Durations.medium4,
      height: Dimension.radius.four,
      transformAlignment: index < currentPage ? Alignment.centerLeft : Alignment.centerRight,
      width: currentPage == index ? Dimension.padding.horizontal.max : Dimension.radius.four,
      margin: EdgeInsets.only(right: Dimension.padding.horizontal.small),
      decoration: BoxDecoration(
        color: currentPage == index ? theme.primary : theme.textSecondary.withAlpha(50),
        borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
      ),
    );
  }
}
