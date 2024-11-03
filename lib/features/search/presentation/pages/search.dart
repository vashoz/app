import '../../../../core/shared/shared.dart';
import '../../../filter/filter.dart';

class SearchPage extends StatelessWidget {
  static const String path = '/search';
  static const String name = 'SearchPage';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            iconTheme: IconThemeData(color: theme.textPrimary),
            title: Container(
              margin: EdgeInsets.zero
                  .copyWith(right: Dimension.padding.horizontal.max),
              child: TextFormField(
                onChanged: (value) {},
                style: context.textStyle10Regular(
                    color: context.theme.textPrimary),
                decoration: InputDecoration(
                  filled: true,
                  hintStyle: context.textStyle10Regular(
                      color: context.theme.textLight),
                  fillColor: context.theme.textLight.withOpacity(.1),
                  labelStyle: context.textStyle10Regular(
                      color: context.theme.textPrimary),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.small,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      context.pushNamed(FilterPage.name);
                    },
                    child: Icon(
                      Icons.tune,
                      color: context.theme.textLight,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimension.radius.twelve)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimension.radius.twelve)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimension.radius.twelve)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search product",
                  prefixIcon:
                      Icon(Icons.search, color: context.theme.textLight),
                ),
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.padding.horizontal.max,
              vertical: Dimension.padding.vertical.max,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search featured",
                    style: context.textStyle13Regular(
                        color: context.theme.textPrimary),
                  ),
                  CircleAvatar(
                      backgroundColor: theme.negative.withOpacity(.08),
                      child: Icon(Icons.delete_forever,
                          color: context.theme.negative)),
                ],
              ),
              SizedBox(height: Dimension.padding.vertical.max),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: Dimension.padding.horizontal.small,
                    crossAxisSpacing: Dimension.padding.horizontal.small,
                    childAspectRatio: 2.5),
                itemBuilder: (_, __) => Padding(
                  padding:
                      EdgeInsets.only(right: Dimension.padding.horizontal.max),
                  child: Chip(
                    label: Text(
                      "Vashoz Achar muri",
                      style: context.textStyle10Regular(
                          color: theme.backgroundPrimary),
                    ), // Text styling for chips
                    backgroundColor: theme.backgroundSecondary.withOpacity(.1),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                      side: BorderSide(
                          color: theme
                              .backgroundSecondary), // Border color for chips
                    ),
                  ),
                ),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        );
      },
    );
  }
}
