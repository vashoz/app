import 'package:vashoz/features/auth/presentation/pages/auth_welcome_page.dart';
import 'package:vashoz/features/orders/presentation/bloc/find_all_bloc.dart';
import 'package:vashoz/features/products/presentation/bloc/product_cart_bloc.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/banner/banner.dart';
import '../../features/business_information/presentation/bloc/fetch_information_bloc.dart';
import '../../features/cart/cart.dart';
import '../../features/category/category.dart';
import '../../features/checkout/checkout.dart';
import '../../features/checkout/presentation/order_success.dart';
import '../../features/dashboard/dashboard.dart';
import '../../features/delivery_address/delivery_address.dart';
import '../../features/filter/filter.dart';
import '../../features/forgot_password/forgot_password.dart';
import '../../features/on_board/presentation/pages/onboard.dart';
import '../../features/orders/orders.dart';
import '../../features/payment_method/payment_method.dart';
import '../../features/product_details/product_details.dart';
import '../../features/products/presentation/bloc/find_products_bloc.dart';
import '../../features/products/presentation/pages/popular.dart';
import '../../features/products/presentation/pages/products_by_category.dart';
import '../../features/products/products.dart';
import '../../features/profile/presentation/pages/delete_account_page.dart';
import '../../features/profile/presentation/pages/web_view_page.dart';
import '../../features/reviews/reviews.dart';
import '../../features/search/search.dart';
import '../../features/shipping_method/shipping_method.dart';
import '../config/config.dart';
import 'shared.dart';

final router = GoRouter(
  initialLocation: OnboardingPage.path,
  routes: [
    GoRoute(
      path: OnboardingPage.path,
      name: OnboardingPage.name,
      builder: (_, __) => const OnboardingPage(),
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
            BlocProvider(create: (context) => sl<NewArrivalProductsBloc>()..add(NewArrivalProducts())),
            BlocProvider(create: (context) => sl<FindProductBloc>()..add(FindProduct(slug: slug))),
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
            BlocProvider(create: (context) => sl<PopularProductsBloc>()..add(const FetchPopularProducts())),
            BlocProvider(create: (context) => sl<FindProductBloc>()..add(FindProduct(slug: slug))),
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
      builder: (_, __) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => sl<FindBannersBloc>()..add(const FindBanners())),
        BlocProvider(create: (context) => sl<NewArrivalProductsBloc>()..add(NewArrivalProducts())),
        BlocProvider(create: (context) => sl<PopularProductsBloc>()..add(const FetchPopularProducts())),
        BlocProvider(create: (context) => sl<FindFeaturedCategoriesBloc>()..add(const FindFeaturedCategories())),
        BlocProvider(create: (context) => sl<FetchInformationBloc>()..add(const FetchInformation())),
        BlocProvider(
          create: (context) => sl<FindAllBloc>()
            ..add(
              const FindAll(
                guid: '1',
              ),
            ),
        ),
      ], child: const DashboardPage()),
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
              create: (context) => sl<FindProductBloc>()..add(FindProduct(slug: slug)),
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
          create: (context) => sl<FindAllCategoriesBloc>()
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
              create: (context) => sl<FindProductsBloc>()
                ..add(
                  FindProducts(slug: slug),
                ),
            ),
            BlocProvider(
              create: (context) => sl<FindProductBloc>()..add(FindProduct(slug: slug)),
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
      path: OrderSuccess.path,
      name: OrderSuccess.name,
      builder: (_, __) => const OrderSuccess(),
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
        create: (context) => sl<FindAllBloc>()
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
