

import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class AuthWelcomePage extends StatelessWidget {
  static const name = 'Authn-welcome-page';
  static const path = '/authn-welcome-page';
  const AuthWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundPrimary,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -48,
            child: Image.network(
              'https://i.imgur.com/avq70TL.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.theme.backgroundSecondary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(Dimension.radius.twentyFour)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Welcome',
                    style: context.textStyle25Bold(color: context.theme.textPrimary).copyWith(letterSpacing: 2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur\nsadipscing elitr, sed diam nonumy',
                    style: context.textStyle13Regular(color: context.theme.textLight).copyWith(height: 1.5, letterSpacing: 1.5),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimension.padding.horizontal.max,
                        vertical: Dimension.padding.vertical.medium,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius.eight),
                        color: context.theme.cardColor,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Image.asset(AssetImages.google),
                        title: Text(
                          'Continue with Google',
                          textAlign: TextAlign.center,
                          style: context
                              .textStyle13Regular(color: context.theme.textPrimary)
                              .copyWith(height: 1.5, letterSpacing: 2.25),
                        ),
                      )),
                  SizedBox(height: Dimension.size.vertical.sixteen),
                  CustomButton(text: "Create an account", onTap: () {}),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AuthPage.name);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: context
                                  .textStyle13Regular(color: context.theme.textLight)
                                  .copyWith(height: 1.5, letterSpacing: 1.5),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: context
                                  .textStyle13Regular(color: context.theme.textPrimary)
                                  .copyWith(height: 1.5, letterSpacing: 2.25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimension.size.vertical.carousel,
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
                vertical: Dimension.padding.vertical.extraMax,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  context.theme.black.withAlpha(500),
                  context.theme.black.withAlpha(200),
                  context.theme.black.withAlpha(100),
                  context.theme.black.withAlpha(50),
                  context.theme.black.withAlpha(10),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                visualDensity: VisualDensity.compact,
                leading: CircleAvatar(
                  backgroundColor: context.theme.textPrimary.withAlpha(50),
                  child: Icon(
                    Icons.arrow_back,
                    color: context.theme.white,
                  ),
                ),
                title: Center(
                  child: Text(
                    'Welcome',
                    style: context.textStyle25Bold(color: context.theme.textSecondary).copyWith(letterSpacing: 3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
