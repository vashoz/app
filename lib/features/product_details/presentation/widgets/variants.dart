import 'package:vashoz/core/shared/shared.dart';

import '../../../product/product.dart';
import '../../../variant/variant.dart';

class ProductDetailsVariants extends StatefulWidget {
  final ProductEntity product;
  final Function(VariantEntity variant) onVariantSelected;
  const ProductDetailsVariants(
      {super.key, required this.product, required this.onVariantSelected});

  @override
  State<ProductDetailsVariants> createState() => _ProductDetailsVariantsState();
}

class _ProductDetailsVariantsState extends State<ProductDetailsVariants> {
  VariantEntity? selectVariant;
  @override
  void initState() {
    super.initState();
    if (widget.product.variants.length > 1) {
      selectVariant = widget.product.variants.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return SizedBox(
          height: 48.h,
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max),
            scrollDirection: Axis.horizontal,
            children: widget.product.variants.map((variant) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectVariant = variant;
                    widget.onVariantSelected(variant);
                  });
                },
                child: Container(
                  width: context.width * .35,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      right: Dimension.padding.horizontal.medium),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.padding.horizontal.max),
                  decoration: BoxDecoration(
                    color: selectVariant == variant
                        ? theme.positive
                        : theme.backgroundPrimary,
                    border: Border.all(
                      color: theme.positive,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimension.radius.eight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        variant.size.toString(),
                        style: context.textStyle13Regular(
                            color: selectVariant == variant
                                ? theme.backgroundPrimary
                                : theme.textPrimary),
                      ),
                      SizedBox(width: Dimension.padding.horizontal.medium),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: selectVariant == variant
                              ? theme.backgroundPrimary
                              : theme.textPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: Dimension.padding.horizontal.medium),
                      Text(
                        variant.unit.toString(),
                        style: context.textStyle13Regular(
                            color: selectVariant == variant
                                ? theme.backgroundPrimary
                                : theme.textPrimary),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
