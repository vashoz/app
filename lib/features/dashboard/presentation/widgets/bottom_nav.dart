import 'package:collection/collection.dart';
import '../../../../core/shared/shared.dart';

class DashboardBottomNavigation extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const DashboardBottomNavigation({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return SafeArea(
          child: Container(
            margin: EdgeInsets.all(Dimension.padding.horizontal.medium)
                .copyWith(bottom: Dimension.padding.horizontal.medium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius.eight),
              color: theme.backgroundPrimary,
              border: Border.all(
                color: theme.positive,
                width: 2,
              ),
            ),
            child: PhysicalModel(
              elevation: 1,
              color: theme.backgroundPrimary,
              shadowColor: theme.textLight.withOpacity(.2),
              borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<_Item>.from(
                  [
                    const _Item(icon: Icons.home_filled, label: "Home"),
                    const _Item(
                        icon: Icons.featured_play_list_rounded,
                        label: "Orders"),
                    const _Item(icon: Icons.favorite, label: "Favorites"),
                    const _Item(icon: Icons.person, label: "Profile"),
                  ],
                )
                    .mapIndexed<Widget>(
                      (int itemIndex, child) => InkWell(
                        splashColor: theme.positive,
                        splashFactory: InkSparkle.splashFactory,
                        onTap: () async {
                          if (itemIndex == 0) {
                            onTap(itemIndex);
                          } else if (itemIndex == 1) {
                            onTap(itemIndex);
                          } else if (itemIndex == 2) {
                            onTap(itemIndex);
                          } else if (itemIndex == 3) {
                            onTap(itemIndex);
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: Dimension.padding.vertical.small),
                            Container(
                              width: itemIndex == index ? 16 : 0,
                              height: 2.h,
                              decoration: BoxDecoration(
                                color: itemIndex == index
                                    ? theme.positive
                                    : theme.textPrimary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(
                                height: Dimension.padding.vertical.verySmall),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Center(
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    itemIndex == index
                                        ? theme.positive
                                        : theme.textPrimary.withAlpha(150),
                                    BlendMode.srcIn,
                                  ),
                                  child: child.custom ??
                                      Icon(
                                        child.icon!,
                                        size: 18,
                                        weight: 700,
                                        grade: 200,
                                        opticalSize: 48,
                                      ),
                                ),
                              ),
                            ),
                            Text(
                              child.label,
                              style: TextStyles.subTitle(
                                context: context,
                                color: itemIndex == index
                                    ? theme.positive
                                    : theme.textPrimary.withAlpha(150),
                              ).copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                              ),
                            ),
                            SizedBox(height: Dimension.padding.vertical.medium),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Item {
  final String label;
  final IconData? icon;
  final Widget? custom;

  const _Item({
    required this.label,
    this.icon,
    this.custom,
  }) : assert(
          icon != null || custom != null,
          "Either icon or custom must be provided",
        );
}
