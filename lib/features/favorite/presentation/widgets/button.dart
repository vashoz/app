import '../../../../core/shared/shared.dart';
import '../bloc/bloc.dart';

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
        final favorite = state.products.any((p) => p.like(text: slug));
        return CircleAvatar(
          radius: Dimension.radius.twelve,
          backgroundColor: favorite ? theme.link : theme.backgroundPrimary,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            onPressed: () {
              context.read<FavoriteBloc>().add(MakeFavorite(slug: slug));
            },
            icon: Icon(
              favorite ? Icons.favorite_rounded : Icons.favorite_border_outlined,
              color: favorite ?  theme.white : theme.link,
              size: Dimension.radius.twelve,
            ),
          ),
        );
      },
    );
  }
}
