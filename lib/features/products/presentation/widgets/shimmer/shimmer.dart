import '../../../../../core/shared/shared.dart';

class ShimmerProduct extends StatelessWidget {
  const ShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerLabel(
          width: 172,
          height: 172,
          margin: EdgeInsets.zero,
        ),
        SizedBox(height: Dimension.padding.vertical.medium),
        Align(
            alignment: Alignment.topLeft,
            child: ShimmerLabel(
                width: 100 + Random().nextInt(16).toDouble(),
                height: 12.h,
                margin: EdgeInsets.zero)),
        SizedBox(
          width: 172,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLabel(
                  width: 48 + Random().nextInt(16).toDouble(),
                  height: 16.h,
                  margin: EdgeInsets.zero),
              const ShimmerIcon(radius: 36),
            ],
          ),
        ),
      ],
    );
  }
}
