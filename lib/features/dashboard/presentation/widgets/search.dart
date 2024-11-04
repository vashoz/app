import '../../../../core/shared/shared.dart';
import '../../../search/search.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return InkWell(
          onTap: () {
            context.pushNamed(SearchPage.name);
          },
          child: Container(
            padding: EdgeInsets.all(Dimension.padding.vertical.large),
            decoration: BoxDecoration(
              color: theme.textSecondary.withAlpha(15),
              borderRadius: BorderRadius.circular(
                Dimension.size.vertical.twelve,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.search, color: theme.textSecondary),
                SizedBox(width: Dimension.size.horizontal.eight),
                Expanded(
                  child: Text(
                    "Search product",
                    style: context.textStyle10Regular(color: theme.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
