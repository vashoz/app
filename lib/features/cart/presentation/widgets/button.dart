import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return IconButton(
          padding: const EdgeInsets.all(0),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          onPressed: () {
            context.pushNamed(CartPage.name);
          },
          icon: CircleAvatar(
            radius: Dimension.radius.twenty,
            backgroundColor: theme.backgroundSecondary,
            child: SvgPicture.string(
              AssetImages.cartIcon,
              width: Dimension.radius.sixteen,
              height: Dimension.radius.sixteen,
            ),
          ),
        );
      },
    );
  }
}
