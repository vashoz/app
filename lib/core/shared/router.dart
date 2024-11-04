import '../../features/track_order/track_order.dart';
import 'shared.dart';
import '../config/config.dart';
import '../../features/auth/auth.dart';
import '../../features/banner/banner.dart';
import '../../features/business_information/business_information.dart';
import '../../features/cart/cart.dart';
import '../../features/category/category.dart';
import '../../features/checkout/checkout.dart';
import '../../features/dashboard/dashboard.dart';
import '../../features/delivery_address/delivery_address.dart';
import '../../features/filter/filter.dart';
import '../../features/forgot_password/forgot_password.dart';
import '../../features/onboard/onboard.dart';
import '../../features/orders/orders.dart';
import '../../features/payment_method/payment_method.dart';
import '../../features/product_details/product_details.dart';
import '../../features/products/products.dart';
import '../../features/profile/profile.dart';
import '../../features/reviews/reviews.dart';
import '../../features/search/search.dart';
import '../../features/shipping_method/shipping_method.dart';

final router = GoRouter(
  initialLocation: OnboardingPage.path,
  routes: [
    GoRoute(
      path: OnboardingPage.path,
      name: OnboardingPage.name,
      builder: (_, __) => const OnboardingPage(),
      redirect: (context, state) => context.onboard.onBoarded ? DashboardPage.path : null,
    ),
    GoRoute(
      path: AuthWelcomePage.path,
      name: AuthWelcomePage.name,
      builder: (_, __) => const AuthWelcomePage(),
    ),
    GoRoute(
      path: SearchPage.path,
      name: SearchPage.name,
      builder: (_, __) => const SearchPage(),
    ),
    GoRoute(
      path: NewArrivalProductsPage.path,
      name: NewArrivalProductsPage.name,
      builder: (context, state) {
        final Map<String, dynamic>? arguments = state.extra as Map<String, dynamic>?;
        final String slug = arguments?['slug'] as String;
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<NewArrivalProductsBloc>()..add(NewArrivalProducts())),
            BlocProvider(create: (_) => sl<FindProductBloc>()..add(FindProduct(slug: slug))),
            BlocProvider(create: (_) => sl<ProductCartBloc>()),
          ],
          child: const NewArrivalProductsPage(),
        );
      },
    ),
    GoRoute(
      path: PopularProductsPage.path,
      name: PopularProductsPage.name,
      builder: (context, state) {
        final Map<String, dynamic>? arguments = state.extra as Map<String, dynamic>?;
        final String slug = arguments?['slug'] as String;
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<PopularProductsBloc>()..add(const FetchPopularProducts())),
            BlocProvider(create: (_) => sl<FindProductBloc>()..add(FindProduct(slug: slug))),
            BlocProvider(create: (_) => sl<ProductCartBloc>()),
          ],
          child: const PopularProductsPage(),
        );
      },
    ),
    GoRoute(
      path: AuthPage.path,
      name: AuthPage.name,
      builder: (_, __) => const AuthPage(),
    ),
    GoRoute(
      path: WebViewPage.path,
      name: WebViewPage.name,
      builder: (context, state) {
        final Map<String, dynamic>? arguments = state.extra as Map<String, dynamic>?;
        final String header = arguments?['header'] as String;
        final String link = arguments?['link'] as String;
        return WebViewPage(
          headerText: header,
          link: link,
        );
      },
    ),
    GoRoute(
      path: ForgotPasswordPage.path,
      name: ForgotPasswordPage.name,
      builder: (_, __) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: DashboardPage.path,
      name: DashboardPage.name,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<FindBannersBloc>()..add(const FindBanners())),
          BlocProvider(create: (_) => sl<FindAllCategoriesBloc>()..add(const FindAllCategories())),
          BlocProvider(create: (_) => sl<NewArrivalProductsBloc>()..add(NewArrivalProducts())),
          BlocProvider(create: (_) => sl<PopularProductsBloc>()..add(const FetchPopularProducts())),
          BlocProvider(create: (_) => sl<FindFeaturedCategoriesBloc>()..add(const FindFeaturedCategories())),
          BlocProvider(create: (_) => sl<FetchInformationBloc>()..add(const FetchInformation())),
          BlocProvider(create: (_) => sl<TrackOrderBloc>()),
          BlocProvider(create: (_) => sl<FindAllBloc>()..add(const FindAll(guid: '1'))),
        ],
        child: const DashboardPage(),
      ),
    ),
    GoRoute(
      path: ProductDetailPage.path,
      name: ProductDetailPage.name,
      builder: (context, state) {
        final Map<String, dynamic>? arguments = state.extra as Map<String, dynamic>?;
        final String slug = arguments?['model'] as String;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<FindProductBloc>()..add(FindProduct(slug: slug)),
            ),
            BlocProvider(create: (_) => sl<ProductCartBloc>()),
          ],
          child: ProductDetailPage(
            slug: slug,
          ),
        );
      },
    ),
    GoRoute(
      path: CategoriesPage.path,
      name: CategoriesPage.name,
      builder: (_, __) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => sl<FindAllCategoriesBloc>()
            ..add(
              const FindAllCategories(),
            ),
        ),
      ], child: const CategoriesPage()),
    ),
    GoRoute(
      path: CartPage.path,
      name: CartPage.name,
      builder: (_, __) => const CartPage(),
    ),
    GoRoute(
      path: ShippingMethodPage.path,
      name: ShippingMethodPage.name,
      builder: (_, __) => const ShippingMethodPage(),
    ),
    GoRoute(
      path: DeliveryAddressPage.path,
      name: DeliveryAddressPage.name,
      builder: (_, __) => const DeliveryAddressPage(),
    ),
    GoRoute(
      path: ProductsByCategoryPage.path,
      name: ProductsByCategoryPage.name,
      builder: (context, state) {
        final Map<String, dynamic>? arguments = state.extra as Map<String, dynamic>?;
        final String categoryName = arguments?['name'] as String;
        final String slug = arguments?['slug'] as String;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<FindProductsBloc>()
                ..add(
                  FindProducts(slug: slug),
                ),
            ),
            BlocProvider(
              create: (_) => sl<FindProductBloc>()..add(FindProduct(slug: slug)),
            ),
            BlocProvider(create: (_) => sl<ProductCartBloc>()),
          ],
          child: ProductsByCategoryPage(
            category: categoryName,
          ),
        );
      },
    ),
    GoRoute(
      path: PaymentMethodPage.path,
      name: PaymentMethodPage.name,
      builder: (_, __) => const PaymentMethodPage(),
    ),
    GoRoute(
      path: CheckoutPage.path,
      name: CheckoutPage.name,
      builder: (_, __) => const CheckoutPage(),
    ),
    GoRoute(
      path: DeleteAccountPage.path,
      name: DeleteAccountPage.name,
      builder: (_, __) => const DeleteAccountPage(),
    ),
    GoRoute(
      path: OrderSuccessPage.path,
      name: OrderSuccessPage.name,
      builder: (_, __) => const OrderSuccessPage(),
    ),
    GoRoute(
      path: FilterPage.path,
      name: FilterPage.name,
      builder: (_, __) => const FilterPage(),
    ),
    GoRoute(
      path: ReviewsPage.path,
      name: ReviewsPage.name,
      builder: (_, __) => ReviewsPage(),
    ),
    GoRoute(
      path: OrdersPage.path,
      name: OrdersPage.name,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<FindAllBloc>()
          ..add(
            const FindAll(
              guid: '1',
            ),
          ),
        child: const OrdersPage(),
      ),
    ),
  ],
);
