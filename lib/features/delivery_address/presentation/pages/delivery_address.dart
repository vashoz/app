import '../../../../core/shared/shared.dart';
import '../../../payment_method/payment_method.dart';
import '../../../shipping_method/presentation/widgets/stepper.dart';

class DeliveryAddressPage extends StatefulWidget {
  static const String path = '/delivery-address';
  static const String name = 'DeliveryAddress';

  const DeliveryAddressPage({super.key});
  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  bool _saveAddress = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            title: Text(
              "Delivery Address",
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
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.large,
                    vertical: Dimension.padding.horizontal.large,
                  ),
                  children: [
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: theme.textLight,
                        ),
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: theme.textLight,
                        ),
                        labelText: 'Email address',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: theme.textLight,
                        ),
                        labelText: 'Phone number',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: theme.textLight,
                        ),
                        labelText: 'Address',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: theme.textLight,
                        ),
                        labelText: 'Zip code',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city_outlined,
                          color: theme.textLight,
                        ),
                        labelText: 'City',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    TextField(
                      style: context.textStyle12Regular(color: theme.textPrimary),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.language_outlined,
                          color: theme.textLight,
                        ),
                        labelText: 'Country',
                        labelStyle: context.textStyle10Regular(color: theme.textLight),
                        filled: true,
                        fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Save this address', style: context.textStyle12Regular(color: theme.textPrimary)),
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
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              CustomButton(
                text: "Continue",
                onTap: () {
                  context.pushNamed(PaymentMethodPage.name);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
