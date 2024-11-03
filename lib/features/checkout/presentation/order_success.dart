import 'package:vashoz/features/dashboard/dashboard.dart';

import '../../../../core/shared/shared.dart';
import '../../cart/cart.dart';

class OrderSuccess extends StatelessWidget {
  static const path = "/order-success";
  static const name = "Order-success";
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                context.read<CartBloc>().add(const ClearCart());
                context.pushReplacementNamed(DashboardPage.name);
              },
              icon: const Icon(Icons.arrow_back),
              color: theme.textPrimary,
            ),
            iconTheme: IconThemeData(color: theme.textPrimary),
            title: Text(
              "Order Success",
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.padding.horizontal.small,
              vertical: Dimension.padding.vertical.max,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 100,
                        color: theme.textPrimary,
                      ),
                      SizedBox(height: Dimension.padding.vertical.max),
                      Text(
                        "Thank you for your order",
                        textAlign: TextAlign.center,
                        style: context.textStyle15SemiBold(color: theme.textPrimary),
                      ),
                      SizedBox(height: Dimension.padding.vertical.small),
                      Text(
                        "Your order has been placed",
                        textAlign: TextAlign.center,
                        style: context.textStyle15SemiBold(color: theme.textPrimary),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Track Order",
                    onTap: () {
                      context.read<CartBloc>().add(const ClearCart());
                      context.pushReplacementNamed(DashboardPage.name);
                    }),
                SizedBox(height: Dimension.padding.vertical.small),
              ],
            ),
          ),
        );
      },
    );
  }
}
