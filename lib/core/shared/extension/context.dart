import '../shared.dart';

extension BuildContextExtension on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  double get topInset => MediaQuery.paddingOf(this).top;

  double get bottomInset => MediaQuery.paddingOf(this).bottom;

  double get smallestSide => MediaQuery.sizeOf(this).shortestSide;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  ThemeBloc get themeBloc => this.read<ThemeBloc>();

  ThemeScheme get theme => themeBloc.state.scheme;

  TextStyle textStyle25Bold({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: color,
            height: 1.5,
            letterSpacing: .03),
      );
  TextStyle textStyle10Regular({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      );

  TextStyle textStyle13Regular({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: color,
          fontWeight: FontWeight.w500,
          letterSpacing: .03,
          height: 1.5,
        ),
      );
  TextStyle textStyle12Regular({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: color,
          fontWeight: FontWeight.w500,
          letterSpacing: .03,
          height: 1.5,
        ),
      );
  TextStyle textStyle15SemiBold({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      );
  TextStyle textStyle15Regular({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: .03,
          height: 1.5,
        ),
      );
  TextStyle textStyle18Regular({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: 1.5,
          letterSpacing: .03,
        ),
      );
  TextStyle textStyle18Bold({required Color color}) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
          color: color,
          height: 1.5,
          letterSpacing: .03,
        ),
      );

  ScaffoldMessengerState successNotification({
    required String message,
  }) {
    final scheme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: scheme.backgroundPrimary),
      ),
      backgroundColor: scheme.positive,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ScaffoldMessengerState errorNotification({
    required String message,
  }) {
    final scheme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: scheme.backgroundPrimary),
      ),
      backgroundColor: scheme.negative,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar)
      ..build(this);
  }

  ScaffoldMessengerState warningNotification({
    required String message,
  }) {
    final scheme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: scheme.backgroundPrimary),
      ),
      backgroundColor: scheme.warning,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
