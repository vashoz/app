import '../../../../core/shared/shared.dart';
import '../../../delivery_address/delivery_address.dart';
import '../widgets/stepper.dart';

class ShippingMethodPage extends StatefulWidget {
  static const String path = '/shipping-method';
  static const String name = 'ShippingMethodPage';

  const ShippingMethodPage({super.key});
  @override
  State<ShippingMethodPage> createState() => _ShippingMethodPageState();
}

class _ShippingMethodPageState extends State<ShippingMethodPage> {
  int _selectedIndex = 0;

  Widget buildShippingOption(
      String title, String subtitle, double price, int index) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? theme.positive.withOpacity(.1)
                  : theme.backgroundPrimary,
              border: Border.all(
                color: _selectedIndex == index
                    ? theme.positive
                    : theme.textLight.withOpacity(.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              dense: false,
              visualDensity: VisualDensity.comfortable,
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: context.textStyle15SemiBold(color: theme.textPrimary),
              ),
              subtitle: Text(
                subtitle,
                style: context.textStyle10Regular(color: theme.textLight),
              ),
              trailing: Text(
                "$taka $price",
                style: context.textStyle15SemiBold(color: theme.textPrimary),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            title: Text(
              "Shipping Method",
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            backgroundColor: theme.backgroundSecondary,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomStepper(
                        step: 1,
                        isActive: true,
                        text: "Shipping",
                        completed: false,
                      ),
                    ),
                    Expanded(
                      child: CustomStepper(
                        step: 2,
                        isActive: false,
                        text: "Address",
                        completed: false,
                      ),
                    ),
                    CustomStepper(
                      step: 3,
                      isActive: false,
                      text: "Payment",
                      completed: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildShippingOption(
                        "Standard Delivery",
                        "Order will be delivered between 3 - 4 business days straight to your doorstep.",
                        3,
                        0),
                    buildShippingOption("Next Day Delivery",
                        "Order will be delivered the next business day.", 5, 1),
                    buildShippingOption("Nominated Delivery",
                        "Order will be delivered on a nominated day.", 3, 2),
                  ],
                ),
              ),
              CustomButton(
                text: "Continue",
                onTap: () {
                  context.pushNamed(DeliveryAddressPage.name);
                },
              ),
              SizedBox(height: Dimension.padding.vertical.max),
            ],
          ),
        );
      },
    );
  }
}
