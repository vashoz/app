import '../../../../core/shared/shared.dart';

class OnboardItem extends StatelessWidget {
  final String image, title, description;

  const OnboardItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
        SizedBox(height: Dimension.padding.vertical.max),
        Text(
          title,
          style: context.textStyle25Bold(color: context.theme.textPrimary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Dimension.padding.vertical.max),
        Text(
          description,
          style: context.textStyle13Regular(color: context.theme.textLight),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
