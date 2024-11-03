import '../../../../../core/shared/shared.dart';

class ShimmerCategories extends StatelessWidget {
  const ShimmerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: .9,
      ),
      itemBuilder: (BuildContext context, int index) {
        return  ShimmerLabel(
          width: Dimension.size.horizontal.oneTwentyEight,
          height: Dimension.size.vertical.oneTwentyEight,
          margin: EdgeInsets.zero,
        );
      },
    );
  }
}
