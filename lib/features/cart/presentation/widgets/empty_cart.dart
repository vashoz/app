import '../../../../core/shared/shared.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.padding.horizontal.max,
            vertical: Dimension.padding.vertical.max,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 100,
                      color: theme.textLight,
                    ),
                    Text(
                      "Your cart is empty",
                      style: context.textStyle15SemiBold(color: theme.textLight),
                    ),
                  ],
                ),
              ),
              CustomButton(text: "Start Shopping", onTap: () {}),
              SizedBox(height: context.bottomInset),
            ],
          ),
        );
      },
    );
  }
}
