import '../../../../core/shared/shared.dart';
import '../../../banner/banner.dart';
import '../../../business_information/presentation/widgets/business_information_widget.dart';
import '../../../category/presentation/widgets/featured.dart';
import 'header.dart';
import 'popular.dart';
import 'new_arrival.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({super.key});

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: const [
                    HomeHeader(),
                    BannersWidget(),
                    FeaturedCategoriesWidget(),
                    PopularProducts(),
                    NewArrivalProducts(),
                    BusinessInformationsWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
