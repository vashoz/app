import 'package:vashoz/core/shared/shared.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.text, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.padding.horizontal.max,
        vertical: Dimension.padding.vertical.medium,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimension.padding.horizontal.medium,
        vertical: Dimension.padding.vertical.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius.twelve),
        color: context.theme.positive,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        onTap: widget.onTap,
        visualDensity: VisualDensity.compact,
        horizontalTitleGap: -8,
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: context.textStyle15Regular(color: context.theme.textSecondary),
        ),
      ),
    );
  }
}
