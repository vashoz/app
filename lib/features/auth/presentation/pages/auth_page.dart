import 'package:vashoz/core/shared/shared.dart';
import 'package:vashoz/features/auth/presentation/widgets/remember_me.dart';
import 'package:vashoz/features/dashboard/dashboard.dart';

class AuthPage extends StatefulWidget {
  static const name = 'Auth-page';
  static const path = '/auth-page';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isObscured = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundPrimary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              'https://i.imgur.com/EpPxd5L.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
                vertical: Dimension.padding.vertical.max,
              ),
              decoration: BoxDecoration(
                color: context.theme.backgroundSecondary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(Dimension.radius.twentyFour)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back !',
                    style: context.textStyle25Bold(color: context.theme.textPrimary).copyWith(letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimension.padding.vertical.medium),
                  Text(
                    'Sign in to your account',
                    style: context.textStyle15Regular(color: context.theme.textLight).copyWith(height: 1.5, letterSpacing: .5),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: Dimension.padding.vertical.max),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.padding.horizontal.max,
                      vertical: Dimension.padding.vertical.small,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius.eight),
                      color: context.theme.white,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: context.theme.textLight,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max,
                          vertical: Dimension.padding.vertical.max,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: context.textStyle15Regular(color: context.theme.textLight),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: Dimension.size.vertical.eight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.padding.horizontal.max,
                      vertical: Dimension.padding.vertical.small,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius.eight),
                      color: context.theme.white,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: context.textStyle15Regular(color: context.theme.textPrimary),
                      obscureText: isObscured,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: context.theme.textLight,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            isObscured ? Icons.visibility : Icons.visibility_off,
                            color: context.theme.textLight,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                        ),
                        hintStyle: context.textStyle15SemiBold(color: context.theme.textLight),
                      ),
                      onSaved: (phone) {
                        // Save it
                      },
                    ),
                  ),
                  SizedBox(height: Dimension.size.vertical.eight),
                  RememberMeWidget(
                    usernameController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: Dimension.size.vertical.eight),
                  CustomButton(
                      text: "Login",
                      onTap: () {
                        context.pushNamed(DashboardPage.name);
                      }),
                  SizedBox(height: Dimension.size.vertical.sixteen),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Don\'t have an account? ',
                              style: context.textStyle13Regular(color: context.theme.textLight)),
                          TextSpan(
                            text: 'Sign Up',
                            style: context
                                .textStyle15Regular(color: context.theme.textPrimary)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
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
                onTap: () {
                  context.pop();
                },
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
