import 'package:vashoz/features/cart/presentation/widgets/items.dart';
import 'package:vashoz/features/cart/presentation/widgets/pricing.dart';

import '../../../../core/shared/shared.dart';
import '../../../shipping_method/shipping_method.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/empty_cart.dart';

class CartPage extends StatelessWidget {
  static const String name = 'Cart';
  static const String path = '/cart';

  const CartPage({super.key});

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
              'Shopping Cart',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: theme.textPrimary,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: BlocProvider.of<CartBloc>(context).state?.items == null
              ? const EmptyCart()
              : Stack(
                  children: [
                    Positioned.fill(
                      bottom: Dimension.size.vertical.sixtyFour,
                      left: Dimension.padding.vertical.max,
                      right: Dimension.padding.vertical.max,
                      child: ListView(
                        children: [
                          const CartItems(),
                          SizedBox(height: MediaQuery.of(context).size.height / 3.2),
                          const Pricing(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: Dimension.padding.vertical.medium,
                      left: 0,
                      right: 0,
                      child: CustomButton(
                        text: "Continue",
                        onTap: () {
                          context.pushNamed(ShippingMethodPage.name);
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
