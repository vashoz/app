import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';
import '../../../favorite/favorite.dart';
import '../../../product/product.dart';
import '../../../profile/profile.dart';
import '../../../track_order/track_order.dart';

class DashboardPage extends StatefulWidget {
  static const String path = '/';
  static const String name = 'DashboardPage';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;
  late final List<Widget> fragments;

  @override
  void initState() {
    super.initState();
    fragments = [
      const DashboardWidget(),
      const ProductsFragment(),
      FavoritesWidget(onPop: returnBack),
      const TrackOrderFragment(),
      ProfileFragment(onPop: returnBack),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return Scaffold(
          body: fragments.elementAt(index),
          backgroundColor: theme.backgroundPrimary,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            currentIndex: index,
            backgroundColor: theme.primary,
            type: BottomNavigationBarType.fixed,            
            selectedItemColor: theme.black,
            unselectedItemColor: theme.black.withAlpha(75),
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Products',
                icon: Icon(Icons.inventory_2_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Track',
                icon: Icon(Icons.qr_code_scanner_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        );
      },
    );
  }

  void returnBack() {
    setState(() {
      index = 0;
    });
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
