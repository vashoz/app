import '../../../../core/shared/shared.dart';
import '../../../dashboard/dashboard.dart';
import '../../onboard.dart';
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
        return BlocListener<OnboardBloc, OnboardState>(
          listener: (context, state) {
            if (state.onBoarded) {
              context.pushReplacementNamed(DashboardPage.name);
            }
          },
          child: Scaffold(
            backgroundColor: theme.backgroundPrimary,
            appBar: AppBar(
              backgroundColor: theme.backgroundPrimary,
              actions: [
                TextButton(
                  onPressed: () {
                    context.onboard.add(const OnBoarded());
                  },
                  child: Text(
                    "Skip".toUpperCase(),
                    style: context.textStyle13Regular(color: theme.textPrimary).copyWith(
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(width: Dimension.padding.horizontal.max),
              ],
            ),
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => OnboardIndicatorWidget(
                      index: index,
                      currentPage: currentPage,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentPage > 0) ...[
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: theme.backgroundTertiary,
                              padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Dimension.radius.twelve),
                              ),
                            ),
                            onPressed: () {
                              _pageController.previousPage(duration: Durations.medium4, curve: Curves.easeInOutSine);
                              setState(() {
                                currentPage--;
                              });
                            },
                            child: Text(
                              "Back".toUpperCase(),
                              style: context.textStyle13Regular(color: theme.textPrimary).copyWith(
                                    height: 1.4,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimension.padding.horizontal.max),
                      ],
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentPage == onboardingData.length - 1) {
                              context.onboard.add(const OnBoarded());
                            } else {
                              _pageController.nextPage(
                                duration: Durations.medium4,
                                curve: Curves.easeInOutSine,
                              );
                            }
                          },
                          child: Text(
                            (currentPage == onboardingData.length - 1 ? "Finish" : "Next").toUpperCase(),
                            style: context.textStyle13Regular(color: theme.black).copyWith(
                                  height: 1.4,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
