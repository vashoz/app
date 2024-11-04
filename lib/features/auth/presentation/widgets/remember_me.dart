import '../../../../core/shared/shared.dart';
import '../../../forgot_password/forgot_password.dart';

class RememberMeWidget extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const RememberMeWidget({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadUserEmailPassword();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      leading: CupertinoSwitch(
        value: _isChecked,
        onChanged: (value) {
          handleRememberMe(value);
        },
      ),
      title: Text(
        "Remember me",
        style: context.textStyle15Regular(
          color: context.theme.textLight,
        ),
      ),
      trailing: InkWell(
        onTap: () {
          context.pushNamed(ForgotPasswordPage.name);
        },
        child: Text(
          "Forgot Password",
          style: context.textStyle15Regular(color: const Color(0xFF407EC7)),
        ),
      ),
    );
  }

  void handleRememberMe(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', widget.usernameController.text);
        prefs.setString('password', widget.passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email") ?? "";
      var password = prefs.getString("password") ?? "";
      var rememberMe = prefs.getBool("remember_me") ?? false;

      if (rememberMe) {
        setState(() {
          _isChecked = true;
        });
        widget.usernameController.text = email;
        widget.passwordController.text = password;
        rememberMe = _isChecked;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
