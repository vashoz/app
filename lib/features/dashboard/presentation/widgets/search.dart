import '../../../../core/shared/shared.dart';
import '../../../search/search.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return InkWell(
          onTap: () {
            context.pushNamed(SearchPage.name);
          },
          child: Container(
            padding: EdgeInsets.all(Dimension.padding.vertical.large),
            decoration: BoxDecoration(
              color: theme.textLight.withOpacity(.1),
              borderRadius:
                  BorderRadius.circular(Dimension.size.vertical.eight),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  color: theme.textLight,
                ),
                SizedBox(
                  width: Dimension.size.horizontal.eight,
                ),
                Text(
                  "Search product",
                  style: context.textStyle10Regular(color: theme.textLight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
