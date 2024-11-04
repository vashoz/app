import 'package:vashoz/core/config/dependencies/cart.dart';
import 'package:vashoz/features/business_information/presentation/bloc/fetch_information_bloc.dart';
import 'package:vashoz/features/discount/presentation/bloc/fetch_discount_bloc.dart';
import 'package:vashoz/features/orders/presentation/bloc/find_all_bloc.dart';
import 'package:vashoz/features/products/presentation/bloc/find_products_bloc.dart';

import '../../features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../features/track_order/presentation/bloc/track_order_bloc.dart';
import '../shared/shared.dart';
//! mason:linking-imports - DO NOT REMOVE THIS COMMENT --------------------------->
import '../../features/reviews/reviews.dart';
import '../../features/track_order/track_order.dart';
import '../../features/business_information/business_information.dart';
import '../../features/filter/filter.dart';
import '../../features/search/search.dart';
import '../../features/variant/variant.dart';
import '../../features/banner/banner.dart';
import '../../features/favorite/favorite.dart';
import '../../features/checkout/checkout.dart';
import '../../features/payment_method/payment_method.dart';
import '../../features/delivery_address/delivery_address.dart';
import '../../features/shipping_method/shipping_method.dart';
import '../../features/products/products.dart';
import '../../features/orders/orders.dart';
import '../../features/product_details/product_details.dart';
import '../../features/category/category.dart';
import '../../features/discount/discount.dart';
import '../../features/profile/profile.dart';
import '../../features/dashboard/dashboard.dart';
import '../../features/forgot_password/forgot_password.dart';
import '../../features/auth/auth.dart';
import '../../features/onboard/onboard.dart';

part 'dependencies.dart';
part 'network_certificates.dart';
//! mason:linking-dependencies - DO NOT REMOVE THIS COMMENT ---------------------->
part 'dependencies/reviews.dart';
part 'dependencies/track_order.dart';
part 'dependencies/business_information.dart';
part 'dependencies/filter.dart';
part 'dependencies/search.dart';
part 'dependencies/variant.dart';
part 'dependencies/banner.dart';
part 'dependencies/favorite.dart';
part 'dependencies/checkout.dart';
part 'dependencies/payment_method.dart';
part 'dependencies/delivery_address.dart';
part 'dependencies/shipping_method.dart';
part 'dependencies/products.dart';
part 'dependencies/orders.dart';
part 'dependencies/product_details.dart';
part 'dependencies/category.dart';
part 'dependencies/discount.dart';
part 'dependencies/profile.dart';
part 'dependencies/dashboard.dart';
part 'dependencies/forgot_password.dart';
part 'dependencies/auth.dart';
part 'dependencies/on_board.dart';

class AppConfig {
  static FutureOr<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Bypass the SSL certificate verification
    HttpOverrides.global = MyHttpOverrides();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationCacheDirectory(),
    );

    // Initialize the configurations
    await _setupDependencies();
  }

  static ThemeData themeData({
    required BuildContext context,
    required ThemeMode mode,
  }) {
    final ThemeScheme theme = mode == ThemeMode.dark ? ThemeScheme.light() : ThemeScheme.dark();
    return ThemeData(
      brightness: Brightness.dark,
      canvasColor: theme.backgroundPrimary,
      scaffoldBackgroundColor: theme.backgroundSecondary,
      splashFactory: NoSplash.splashFactory,
      primaryColor: theme.primaryDark,
      indicatorColor: theme.primaryDark,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: theme.backgroundSecondary,
        labelStyle: TextStyles.body(context: context, color: theme.textPrimary),
        contentPadding:
            EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
        hintStyle: TextStyles.body(context: context, color: theme.textLight),
        errorStyle: const TextStyle(height: 0),
        helperStyle: const TextStyle(height: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.textLight,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.negative,
            width: .15,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
          borderSide: BorderSide(
            color: theme.negative,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primary,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimension.radius.twelve),
            side: BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.padding.horizontal.ultraMax,
            vertical: Dimension.padding.vertical.medium,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 3,
          splashFactory: NoSplash.splashFactory,
          surfaceTintColor: theme.backgroundSecondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimension.radius.twelve)),
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.padding.horizontal.ultraMax,
            vertical: Dimension.padding.vertical.medium,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: theme.backgroundPrimary),
      iconTheme: IconThemeData(color: theme.textPrimary, size: 20),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerTheme: DividerThemeData(color: theme.backgroundTertiary, thickness: .25),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: theme.textPrimary),
        actionsIconTheme: IconThemeData(color: theme.textPrimary),
        backgroundColor: theme.backgroundPrimary,
        surfaceTintColor: theme.backgroundPrimary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: mode == ThemeMode.dark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: theme.backgroundPrimary,
          systemNavigationBarDividerColor: theme.textPrimary,
          systemNavigationBarIconBrightness: mode == ThemeMode.dark ? Brightness.light : Brightness.dark,
        ),
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: theme.primary,
        primary: theme.primary,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}
