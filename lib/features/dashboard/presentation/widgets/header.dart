import 'package:vashoz/features/cart/domain/entities/cart.dart';
import 'package:vashoz/features/cart/presentation/pages/cart_page.dart';

import '../../../../core/shared/shared.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import 'search.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: SearchField()),
              const SizedBox(width: 16),
              Stack(
                children: [
                  IconBtnWithCounter(
                    svgSrc: AssetImages.cartIcon,
                    press: () {
                      context.pushNamed(CartPage.name);
                    },
                  ),
                  BlocBuilder<CartBloc, CartEntity?>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state?.items.isNotEmpty ?? false,
                        child: Positioned(
                          top: -1,
                          right: -1,
                          child: Container(
                            height: 18.h,
                            width: 18.w,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  Dimension.padding.horizontal.verySmall,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF4848),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                            ),
                            child: Text(
                              state?.items.length.toString() ?? "0",
                              textAlign: TextAlign.center,
                              style: context.textStyle10Regular(
                                  color: theme.backgroundPrimary),
                            ),
                          )
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                                onComplete: (controller) => controller.repeat(),
                              )
                              .shake(
                                duration: const Duration(seconds: 1),
                              ),
                        ),
                      );
                    },
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

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  });

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.theme.textLight.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.string(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
