
import '../../../../core/shared/shared.dart';
import '../../../cart/cart.dart';
import '../../dashboard.dart';
import '../../../banner/banner.dart';
import '../../../business/business.dart';
import '../../../category/category.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return KeyboardDismissOnTap(
          child: Scaffold(
            backgroundColor: theme.backgroundSecondary,
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: theme.backgroundSecondary,
              title: const SearchWidget(),
              elevation: 0,
              scrolledUnderElevation: Dimension.radius.four,
              shadowColor: theme.shimmer,
              actions: [
                const CartButton(),
                SizedBox(width: Dimension.padding.horizontal.max),
              ],
            ),
            body: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
                vertical: Dimension.padding.vertical.max,
              ),
              children: const [
                BannersWidget(),
                FeaturedCategoriesWidget(),
                PopularProducts(),
                NewArrivalProducts(),
                BusinessInformationsWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
