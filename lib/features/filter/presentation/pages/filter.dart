import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/shared/shared.dart';

class FilterPage extends StatefulWidget {
  static const path = '/filter';
  static const name = 'FilterPage';
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectRatingValue = 1;
  int selectOthersCategoryType = 1;
  double rating = 0;

  List<OthersCategory> othersCategoryList = [
    OthersCategory(
      name: 'Discount',
      icon: Icons.discount,
    ),
    OthersCategory(
      name: 'Free Shipping',
      icon: Icons.local_shipping,
    ),
    OthersCategory(
      name: 'Same Day Delivery',
      icon: Icons.card_giftcard_outlined,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: theme.textPrimary,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            title: Text('Apply Filters', style: context.textStyle15SemiBold(color: theme.textPrimary)),
            centerTitle: true,
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                child: Text('Reset', style: context.textStyle12Regular(color: theme.negative)),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Range',
                            style: context.textStyle10Regular(color: theme.textLight),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildPriceInputField('Min'),
                              _buildPriceInputField('Max'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Star Rating',
                            style: context.textStyle10Regular(color: theme.textLight),
                          ),
                          SizedBox(height: Dimension.padding.vertical.max),
                          RatingBar(
                            initialRating: rating,
                            ratingWidget: RatingWidget(
                              full: Icon(Icons.star_rounded, size: 32, color: theme.warning),
                              half: Icon(Icons.star_half_rounded, size: 32, color: theme.warning),
                              empty: Icon(Icons.star_border_rounded, size: 32, color: theme.warning),
                            ),
                            onRatingUpdate: (val) {
                              setState(() {
                                rating = val;
                              });
                            },
                            allowHalfRating: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Others',
                            style: context.textStyle10Regular(color: theme.textLight),
                          ),
                          const SizedBox(height: 16.0),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            children: List.generate(
                              othersCategoryList.length,
                              (index) {
                                final OthersCategory category = othersCategoryList[index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectOthersCategoryType = index;
                                    });
                                  },
                                  child: ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    contentPadding: EdgeInsets.zero.copyWith(bottom: 8),
                                    leading: CircleAvatar(
                                      radius: Dimension.radius.twenty,
                                      backgroundColor: theme.positive.withOpacity(.1),
                                      child: Icon(category.icon, color: theme.positive),
                                    ),
                                    title: Text(
                                      category.name,
                                      style: context.textStyle12Regular(color: theme.textLight),
                                    ),
                                    trailing: Icon(
                                      selectOthersCategoryType == index ? Icons.check_circle : Icons.check_circle_outline,
                                      color: theme.positive,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(text: "Apply Filter", onTap: () {}),
              SizedBox(height: Dimension.padding.vertical.max),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPriceInputField(String hint) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          width: context.width * .35,
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.padding.horizontal.max,
            vertical: Dimension.padding.vertical.max,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: theme.textLight.withOpacity(.3)),
          ),
          child: TextFormField(
            onChanged: (value) {},
            style: context.textStyle10Regular(color: theme.textPrimary),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              hintStyle: context.textStyle10Regular(color: theme.textLight),
              fillColor: state.mode == ThemeMode.dark ? theme.cardColor : theme.backgroundPrimary,
              labelStyle: context.textStyle10Regular(color: theme.textPrimary),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
                vertical: Dimension.padding.vertical.medium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.twelve)),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
            ),
          ),
        );
      },
    );
  }
}

class OthersCategory {
  final String name;
  final IconData icon;
  OthersCategory({required this.name, required this.icon});
}
