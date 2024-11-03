import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:vashoz/features/category/category.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../favorite/presentation/favorite_fragment.dart';
import '../../../products/presentation/widgets/products_fragment.dart';
import '../../../profile/presentation/widgets/profile_fragment.dart';
import '../../../track_order/presentation/bloc/track_order_bloc.dart';
import '../../../track_order/presentation/widgets/track_order_fragment.dart';
import '../widgets/dashboard_fragment.dart';

class DashboardPage extends StatefulWidget {
  static const String path = '/dashboard';
  static const String name = 'DashboardPage';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  late final List<Widget> fragments;
  @override
  void initState() {
    super.initState();
    fragments = [
      const DashboardFragment(),
      BlocProvider(
        create: (context) => sl<FindAllCategoriesBloc>()..add(const FindAllCategories()),
        child: const ProductsFragment(),
      ),
      FavoriteFragment(
        onPop: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
      BlocProvider(
        create: (context) => sl<TrackOrderBloc>(),
        child: const TrackOrderFragment(),
      ),
      ProfileFragment(
        onPop: () {
          currentIndex = 0;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: fragments.elementAt(currentIndex),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: StyleProvider(
            style: Style(),
            child: ConvexAppBar(
              initialActiveIndex: currentIndex,
              backgroundColor: theme.positive,
              elevation: 8,
              items: const [
                TabItem(
                  icon: Icons.home,
                ),
                TabItem(
                  icon: Icons.featured_play_list_rounded,
                ),
                TabItem(
                  icon: Icons.favorite,
                ),
                TabItem(
                  icon: Icons.transform_rounded,
                ),
                TabItem(
                  icon: Icons.settings,
                ),
              ],
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 24;

  @override
  double get activeIconMargin => 12;

  @override
  double get iconSize => 24;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
      fontSize: 0.sp,
      fontWeight: FontWeight.bold,
      color: color,
      height: 0,
      letterSpacing: 0,
    );
  }
}
