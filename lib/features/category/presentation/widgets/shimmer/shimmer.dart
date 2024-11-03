import '../../../../../core/shared/shared.dart';

class ShimmerFeaturedCategories extends StatelessWidget {
  const ShimmerFeaturedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: Dimension.padding.horizontal.ultraMax);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ShimmerIcon(radius: 48),
            SizedBox(height: Dimension.padding.vertical.max),
            ShimmerLabel(
                width: 54 + Random().nextInt(16).toDouble(),
                height: 10.h,
                margin: EdgeInsets.zero),
          ],
        );
      },
    );
  }
}
