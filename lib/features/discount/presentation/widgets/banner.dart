import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/shared/shared.dart';
import '../bloc/fetch_discount_bloc.dart';

class DiscountBanner extends StatefulWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  State<DiscountBanner> createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<FetchDiscountBloc, FetchDiscountState>(
          builder: (context, state) {
            if (state is FetchDiscountLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchDiscountLoaded) {
              final discounts = state.discounts;
              return CarouselSlider.builder(
                itemCount: discounts.length,
                itemBuilder: (context, index, realIndex) {
                  final item = discounts[index];
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      vertical: Dimension.padding.horizontal.max,
                      horizontal: Dimension.padding.horizontal.max,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimension.radius.twentyFour),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimension.radius.twentyFour),
                      child: CachedNetworkImage(
                        imageUrl: item.type,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ShimmerLabel(
                          width: context.width,
                          height: 164,
                        ),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 164,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class DiscountModel {
  final String image;
  final String title;
  final String description;

  const DiscountModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
