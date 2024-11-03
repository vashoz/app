import 'package:vashoz/core/shared/custom_button.dart';

import '../../../../core/shared/shared.dart';
import '../../../cart/presentation/widgets/items.dart';
import '../../../cart/presentation/widgets/pricing.dart';
import '../../../orders/presentation/pages/success.dart';

class CheckoutPage extends StatelessWidget {
  static const String path = '/checkout';
  static const String name = 'CheckoutPage';
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            title: Text(
              "Checkout",
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max,
                  ),
                  children: [
                    Text("Shipping Method", style: context.textStyle10Regular(color: theme.textLight)),
                    SizedBox(height: Dimension.padding.vertical.medium),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimension.padding.horizontal.max,
                      ),
                      decoration: BoxDecoration(
                        color: theme.textLight.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          "Standard Delivery",
                          style: context.textStyle15SemiBold(color: theme.textPrimary),
                        ),
                        subtitle: Text(
                          "Order will be delivered between 3 - 4 business days straight to your doorstep.",
                          style: context.textStyle10Regular(color: theme.textLight),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text("Delivery Address", style: context.textStyle10Regular(color: theme.textLight)),
                    SizedBox(height: Dimension.padding.vertical.medium),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimension.padding.horizontal.max,
                      ),
                      decoration: BoxDecoration(
                        color: theme.textLight.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          "Home",
                          style: context.textStyle13Regular(color: theme.textPrimary),
                        ),
                        subtitle: Text(
                          "123, Wall Street, Los Angeles, CA",
                          style: context.textStyle10Regular(color: theme.textLight),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text("Items", style: context.textStyle10Regular(color: theme.textLight)),
                    SizedBox(height: Dimension.padding.vertical.medium),
                    const CartItems(),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text("Payment Method", style: context.textStyle10Regular(color: theme.textLight)),
                    SizedBox(height: Dimension.padding.vertical.medium),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimension.padding.horizontal.max,
                        vertical: Dimension.padding.vertical.max,
                      ),
                      decoration: BoxDecoration(
                        color: theme.textLight.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.textLight.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "https://i.imgur.com/rkvcFsR.png",
                              height: Dimension.size.horizontal.sixtyFour,
                              width: Dimension.size.vertical.sixtyFour,
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.medium),
                          Text(
                            "bKash",
                            style: context.textStyle15Regular(color: theme.textPrimary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Container(
                      height: 2.h,
                      padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                      decoration: BoxDecoration(
                        color: theme.textPrimary.withOpacity(.1),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.medium),
                    const Pricing(),
                  ],
                ),
              ),
              CustomButton(
                text: "Place Order",
                onTap: () {
                  context.pushNamed(OrderSuccessPage.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
