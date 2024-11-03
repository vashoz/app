import 'package:vashoz/features/cart/domain/entities/cart.dart';

import '../../../../core/shared/shared.dart';
import '../bloc/cart_bloc.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          decoration: BoxDecoration(
            color: state.mode == ThemeMode.dark ? theme.cardColor : theme.backgroundPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(Dimension.radius.twelve),
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: Dimension.padding.vertical.extraMax,
          ),
          padding: EdgeInsets.only(
            bottom: context.bottomInset,
            left: Dimension.padding.horizontal.max,
            right: Dimension.padding.horizontal.max,
            top: Dimension.padding.vertical.max,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: Dimension.padding.vertical.max,
            ),
            children: [
              BlocBuilder<CartBloc, CartEntity?>(
                builder: (context, state) {
                  //final totalPrice = state!.totalPrice;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: context.textStyle12Regular(color: theme.textPrimary),
                      ),
                      Text(
                        "$taka 234",
                        style: context.textStyle12Regular(color: theme.textPrimary),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: Dimension.padding.vertical.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Charge',
                    style: context.textStyle12Regular(color: theme.textPrimary),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$taka 121',
                          style: context.textStyle12Regular(color: theme.textPrimary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimension.padding.vertical.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount(15%)',
                    style: context.textStyle12Regular(color: theme.textPrimary),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$taka 54',
                          style: context.textStyle12Regular(color: theme.textPrimary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimension.padding.vertical.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VAT(5%)',
                    style: context.textStyle12Regular(color: theme.textPrimary),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$taka 10',
                          style: context.textStyle12Regular(color: theme.textPrimary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimension.padding.vertical.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add_box_outlined, color: theme.textPrimary),
                      SizedBox(width: Dimension.padding.horizontal.small),
                      Text(
                        'Add a voucher',
                        style: context.textStyle12Regular(color: theme.textPrimary),
                      ),
                      SizedBox(width: Dimension.padding.horizontal.medium),
                      Container(
                        width: context.width * .25,
                        height: context.height * .04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: theme.textLight.withOpacity(.3)),
                        ),
                        child: TextFormField(
                          onChanged: (value) {},
                          style: context.textStyle10Regular(color: theme.textPrimary),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            hintStyle: context.textStyle10Regular(color: theme.textLight),
                            fillColor: state.mode == ThemeMode.dark ? theme.cardColor : theme.backgroundPrimary,
                            labelStyle: context.textStyle10Regular(color: theme.textPrimary),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimension.padding.horizontal.small,
                              vertical: Dimension.padding.vertical.small,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter voucher code",
                          ),
                        ),
                      ),
                      SizedBox(width: Dimension.padding.horizontal.small),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.positive.withOpacity(.3),
                          child: Icon(Icons.check, color: theme.textPrimary)),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$taka 10',
                          style: context.textStyle12Regular(color: theme.textPrimary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: context.textStyle15SemiBold(color: theme.textPrimary).copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "$taka 419",
                    style: context.textStyle15SemiBold(color: theme.textPrimary).copyWith(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
