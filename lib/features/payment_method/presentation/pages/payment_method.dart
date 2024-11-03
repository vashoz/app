import 'package:vashoz/features/payment_method/data/models/method.dart';

import '../../../../core/shared/shared.dart';
import '../../../checkout/presentation/order_success.dart';
import '../../../shipping_method/presentation/widgets/stepper.dart';
import '../widgets/add_card_form.dart';
import '../widgets/card.dart';

class PaymentMethodPage extends StatefulWidget {
  static const String path = '/payment-method';
  static const String name = 'Payment-Method';

  const PaymentMethodPage({super.key});
  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int selectedIndex = 0;
  bool _saveAddress = false;
  final List<PaymentMethod> paymentMethods = [
    const PaymentMethod(
      guid: '1',
      paymentImage: "https://i.imgur.com/rkvcFsR.png",
      paymentTitle: "bKash",
    ),
    const PaymentMethod(
      guid: '2',
      paymentImage: "https://i.imgur.com/fJqZWHJ.png",
      paymentTitle: "Nogod",
    ),
    const PaymentMethod(
      guid: '3',
      paymentImage: "https://i.imgur.com/2fW2uLn.jpeg",
      paymentTitle: "Rocket",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            title: Text(
              "Payment Methods",
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            backgroundColor: theme.backgroundSecondary,
            elevation: 0,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomStepper(
                        step: 1,
                        isActive: true,
                        text: "Shipping",
                        completed: true,
                      ),
                    ),
                    Expanded(
                      child: CustomStepper(
                        step: 2,
                        isActive: true,
                        text: "Address",
                        completed: true,
                      ),
                    ),
                    CustomStepper(
                      step: 3,
                      isActive: true,
                      text: "Payment",
                      completed: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.large,
                    vertical: Dimension.padding.horizontal.large,
                  ),
                  children: [
                    SizedBox(height: Dimension.padding.vertical.medium),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.paypal_outlined,
                                  color: theme.textPrimary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Paypal",
                                  style: context.textStyle10Regular(color: theme.textPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card_outlined,
                                  color: theme.textPrimary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Credit Card",
                                  style: context.textStyle10Regular(color: theme.textPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple,
                                  color: theme.textPrimary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Apple",
                                  style: context.textStyle10Regular(color: theme.textPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    const CardWidget(),
                    SizedBox(height: Dimension.padding.vertical.max),
                    const AddCardForm(),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Row(
                      children: [
                        Text('Save this card', style: context.textStyle12Regular(color: theme.textPrimary)),
                        const SizedBox(width: 8),
                        Switch(
                          thumbColor: WidgetStateProperty.all(theme.positive),
                          activeColor: theme.positive,
                          inactiveThumbColor: theme.textLight,
                          inactiveTrackColor: theme.textLight.withOpacity(.1),
                          activeTrackColor: theme.positive.withOpacity(.1),
                          splashRadius: 16,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: _saveAddress,
                          onChanged: (value) {
                            setState(() {
                              _saveAddress = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: "Make Payment",
                onTap: () {
                  context.pushNamed(OrderSuccess.name);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
