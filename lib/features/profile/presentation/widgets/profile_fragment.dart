import 'package:vashoz/features/profile/presentation/pages/web_view_page.dart';

import '../../../../core/shared/shared.dart';
import '../../../auth/auth.dart';
import '../../../orders/orders.dart';
import '../pages/delete_account_page.dart';
import '../widgets/change_theme_sheet.dart';

class ProfileFragment extends StatelessWidget {
  final VoidCallback onPop;
  const ProfileFragment({super.key, required this.onPop});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            centerTitle: true,
            title: Text(
              'Profile',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: theme.textPrimary,
              ),
              onPressed: onPop,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: Dimension.padding.vertical.max),
            child: Column(
              children: [
                // const ProfilePic(),
                // SizedBox(height: Dimension.size.vertical.twentyFour),
                ProfileMenu(
                  text: "Change Theme",
                  icon: Icons.color_lens_outlined,
                  iconColor: theme.positive,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isScrollControlled: true,
                      backgroundColor: theme.backgroundSecondary,
                      builder: (_) => const ChangeThemeBottomSheet(),
                    );
                  },
                ),
                ProfileMenu(
                  text: "About us",
                  icon: Icons.account_box,
                  iconColor: theme.positive,
                  onTap: () => {
                    context
                        .pushNamed(WebViewPage.name, extra: {'header': 'About us', 'link': 'https://www.vashoz.com/about-us'})
                  },
                ),
                ProfileMenu(
                  text: "My orders",
                  icon: Icons.card_giftcard_outlined,
                  iconColor: theme.positive,
                  onTap: () => {context.pushNamed(OrdersPage.name)},
                ),

                ProfileMenu(
                  text: "Contact us",
                  icon: Icons.contact_emergency,
                  iconColor: theme.positive,
                  onTap: () => {
                    context
                        .pushNamed(WebViewPage.name, extra: {'header': 'Contact us', 'link': 'https://vashoz.com/contact-us/'})
                  },
                ),
                ProfileMenu(
                  text: "Frequently asked questions",
                  icon: Icons.help_center,
                  iconColor: theme.positive,
                  onTap: () => {
                    context.pushNamed(WebViewPage.name,
                        extra: {'header': 'Frequently asked questions', 'link': 'https://vashoz.com/faq/'})
                  },
                ),
                ProfileMenu(
                  text: "Terms and conditions",
                  icon: Icons.safety_check,
                  iconColor: theme.positive,
                  onTap: () => {
                    context.pushNamed(WebViewPage.name,
                        extra: {'header': 'Terms and conditions', 'link': 'https://vashoz.com/term-of-use/'})
                  },
                ),
                ProfileMenu(
                  text: "Refund and Returns Policy",
                  icon: Icons.replay_circle_filled_rounded,
                  iconColor: theme.positive,
                  onTap: () {
                    context.pushNamed(WebViewPage.name, extra: {
                      'header': 'Refund and Returns Policy',
                      'link': 'https://vashoz.com/refund-and-returns-policy/'
                    });
                  },
                ),
                ProfileMenu(
                  text: "Privacy Policy",
                  icon: Icons.health_and_safety_rounded,
                  iconColor: theme.positive,
                  onTap: () {
                    context.pushNamed(WebViewPage.name,
                        extra: {'header': 'Privacy Policy', 'link': 'https://vashoz.com/privacy-policy/'});
                  },
                ),
                ProfileMenu(
                  text: "Cancellation Policy",
                  icon: Icons.notifications_outlined,
                  iconColor: theme.positive,
                  onTap: () {
                    context.pushNamed(WebViewPage.name,
                        extra: {'header': 'Cancellation Policy', 'link': 'https://vashoz.com/cancellation-policy/'});
                  },
                ),

                ProfileMenu(
                  text: "Delete Account",
                  icon: Icons.delete_forever,
                  iconColor: theme.negative,
                  onTap: () {
                    context.pushNamed(DeleteAccountPage.name);
                  },
                ),
                ProfileMenu(
                  text: "Logout",
                  icon: Icons.logout,
                  iconColor: theme.negative,
                  onTap: () {
                    context.pushNamed(AuthWelcomePage.name);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return SizedBox(
          height: Dimension.size.vertical.oneTwentyEight,
          width: Dimension.size.horizontal.oneTwentyEight,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: theme.backgroundTertiary,
                child: CachedNetworkImage(
                    imageUrl:
                        "https://vashoz.com/wp-content/uploads/elementor/thumbs/Untitled-1-qj0fbiy32tfw1a05uohk784fxcjn8gm2qhzz4dl1bc.png"),
              ),
              Positioned(
                right: -11.h,
                bottom: 0,
                child: SizedBox(
                  height: 46.h,
                  width: 46.h,
                  child: IconButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.textSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimension.radius.fortyEight),
                        side: BorderSide(color: theme.textSecondary),
                      ),
                      backgroundColor: theme.positive,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: theme.backgroundPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeBloc>().state.scheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.padding.horizontal.large,
        vertical: Dimension.padding.horizontal.medium,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.padding.horizontal.max,
            vertical: Dimension.padding.vertical.extraMax,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimension.radius.sixteen,
            ),
          ),
          backgroundColor: theme.textLight.withOpacity(.1),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: Dimension.padding.horizontal.extraMax),
            Expanded(
              child: Text(
                text,
                style: context.textStyle13Regular(color: theme.textPrimary),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}
