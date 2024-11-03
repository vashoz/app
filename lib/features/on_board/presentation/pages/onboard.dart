import '../../../../core/shared/shared.dart';
import '../../../dashboard/dashboard.dart';
import '../../on_board.dart';
import '../widgets/item.dart';

class OnboardingPage extends StatefulWidget {
  static const String name = 'onboard';
  static const String path = '/onboard';
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AssetImages.onboardFirst,
      "title": "Buy Grocery",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    },
    {
      "image": AssetImages.onboardSecond,
      "title": "Fast Delivery",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    },
    {
      "image": AssetImages.onboardThird,
      "title": "Enjoy Quality Food",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    },
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardItem(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => DotIndicator(
                    index: index,
                    currentPage: currentPage,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.textLight,
                        padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                        ),
                      ),
                      onPressed: () {
                        context.pushNamed(DashboardPage.name);
                      },
                      child: Text(
                        "Skip",
                        style: context.textStyle13Regular(color: context.theme.textLight).copyWith(
                              height: 1.4,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryDark,
                        splashFactory: NoSplash.splashFactory,
                        foregroundColor: theme.textPrimary,
                        padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                        ),
                      ),
                      onPressed: () {
                        if (currentPage == onboardingData.length - 1) {
                          context.pushNamed(DashboardPage.name);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        currentPage == onboardingData.length - 1 ? "Finish" : "Next",
                        style: context.textStyle13Regular(color: context.theme.textSecondary).copyWith(
                              height: 1.4,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
