import 'package:flutter/cupertino.dart';
import 'package:vashoz/core/shared/shared.dart';

import '../../../products/products.dart';
import '../../product_details.dart';

class ProductDetailsPhotos extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailsPhotos({super.key, required this.product});

  @override
  State<ProductDetailsPhotos> createState() => _ProductDetailsPhotosState();
}

class _ProductDetailsPhotosState extends State<ProductDetailsPhotos> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return SizedBox(
          height: 400.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.positive.withOpacity(.07),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(Dimension.radius.twentyFour),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: widget.product.productImages.length,
                          itemBuilder: (context, index) {
                            return CupertinoContextMenu(
                              actions: [
                                CupertinoContextMenuAction(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text('Remove'),
                                ),
                              ],
                              child: CachedNetworkImage(
                                imageUrl: widget.product.productImages[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: Dimension.padding.vertical.small),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: widget.product.productImages.length,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 16,
                          activeDotColor: theme.positive,
                          dotColor: theme.textLight.withOpacity(.5),
                        ),
                      ),
                      SizedBox(height: Dimension.padding.vertical.medium),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Dimension.padding.horizontal.max,
                top: Dimension.padding.horizontal.max,
                child: CircleAvatar(
                  backgroundColor: theme.textPrimary.withOpacity(.3),
                  radius: 18,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back, color: theme.backgroundPrimary, size: 20),
                  ),
                ),
              ),
              Positioned(
                right: Dimension.padding.horizontal.medium,
                top: Dimension.padding.horizontal.max,
                child: Container(
                  alignment: Alignment.center,
                  width: Dimension.size.vertical.seventyTwo,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: Dimension.padding.vertical.medium),
                    itemCount: widget.product.productImages.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          _controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                        },
                        child: Container(
                          height: Dimension.size.vertical.fiftyTwo,
                          width: Dimension.size.vertical.fiftyTwo,
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimension.padding.horizontal.medium,
                          ),
                          decoration: BoxDecoration(
                            color: theme.textPrimary.withOpacity(.3),
                            borderRadius: BorderRadius.circular(Dimension.radius.eight),
                            border: Border.all(color: theme.textLight.withOpacity(.5), width: 1),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.productImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
