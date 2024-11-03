import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * .20,
      margin: EdgeInsets.symmetric(
        horizontal: Dimension.padding.horizontal.max,
        vertical: Dimension.padding.vertical.max,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius.twelve),
      ),
      clipBehavior: Clip.antiAlias,
      child: BlocBuilder<FindBannersBloc, FindBannersState>(
        builder: (context, state) {
          if (state is FindBannersDone) {
            return CarouselView(
              itemExtent: context.width * .8,
              itemSnapping: true,
              scrollDirection: Axis.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimension.radius.twelve),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimension.padding.horizontal.small),
              onTap: (index) {},
              children: state.banners
                  .map(
                    (banner) => CachedNetworkImage(
                      imageUrl: banner.url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ShimmerLabel(
                          width: context.width * .8,
                          height: context.height * .15),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                  .toList(),
            );
          } else if (state is FindBannersLoading) {
            return CarouselView(
              itemExtent: context.width * .8,
              shrinkExtent: context.height * .15,
              itemSnapping: true,
              scrollDirection: Axis.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimension.radius.twelve),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimension.padding.horizontal.small),
              onTap: (index) {},
              children: [
                ShimmerLabel(
                  width: context.width * .8,
                  height: context.height * .15,
                  radius: Dimension.radius.twelve,
                ),
                ShimmerLabel(
                  width: context.width * .8,
                  height: context.height * .15,
                  radius: Dimension.radius.twelve,
                ),
                ShimmerLabel(
                  width: context.width * .8,
                  height: context.height * .15,
                  radius: Dimension.radius.twelve,
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}