import '../../../../core/shared/shared.dart';
import '../bloc/favorite_bloc.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final String slug;
  const FavoriteButtonWidget({
    super.key,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeBloc>().state.scheme;
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (_, state) {
        final favorite = state.products.any((p) => p == slug);
        return InkWell(
          onTap: () {
            context.read<FavoriteBloc>().add(ToggleFavoriteProduct(slug: slug));
          },
          child: CircleAvatar(
            radius: Dimension.radius.sixteen,
            backgroundColor: theme.negative.withOpacity(.1),
            child: Icon(
              favorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_outlined,
              color: theme.negative,
              size: Dimension.radius.sixteen,
            ),
          ),
        );
      },
    );
  }
}
