import '../../../../core/shared/shared.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String path = '/forgot-password';
  static const String name = 'ForgotPasswordPage';
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            centerTitle: true,
            title: Text(
              'Password Recovery',
              style: context.textStyle18Regular(color: context.theme.textPrimary),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.padding.horizontal.max,
              vertical: Dimension.padding.vertical.max,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: context.textStyle25Bold(color: context.theme.textPrimary),
                ),
                SizedBox(height: Dimension.size.vertical.eight),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                  textAlign: TextAlign.center,
                  style: context.textStyle15Regular(color: context.theme.textLight),
                ),
                SizedBox(height: Dimension.size.vertical.sixteen),
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
                SizedBox(height: Dimension.padding.vertical.extraMax),
                CustomButton(text: 'Send Link', onTap: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
