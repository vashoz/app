import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/shared/shared.dart';

class ReviewsPage extends StatelessWidget {
  static const String path = '/reviews';
  static const String name = 'ReviewsPage';
  final List<Review> reviews = [
    Review(name: 'Haylie Aminoff', rating: 4.5, timeAgo: '32 minutes ago', imageUrl: 'https://loremflickr.com/320/240/person'),
    Review(name: 'Carla Septimus', rating: 4, timeAgo: '32 minutes ago', imageUrl: 'https://loremflickr.com/320/240/person'),
    Review(name: 'Carla George', rating: 4.5, timeAgo: '32 minutes ago', imageUrl: 'https://loremflickr.com/320/240/person'),
    Review(name: 'Maren Kenter', rating: 4.5, timeAgo: '32 minutes ago', imageUrl: 'https://loremflickr.com/320/240/person'),
  ];

  ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            title: Text('Reviews', style: context.textStyle15SemiBold(color: theme.textPrimary)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.textPrimary),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                child: CircleAvatar(
                  backgroundColor: theme.positive,
                  child: IconButton(
                    color: theme.positive,
                    icon: Icon(Icons.add, color: theme.iconColor),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          body: ListView.builder(
            padding:
                EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ReviewCard(review: reviews[index]);
            },
          ),
        );
      },
    );
  }
}

class Review {
  final String name;
  final double rating;
  final String timeAgo;
  final String imageUrl;

  Review({
    required this.name,
    required this.rating,
    required this.timeAgo,
    required this.imageUrl,
  });
}

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Card(
          elevation: 0,
          color: theme.cardColor,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: EdgeInsets.all(Dimension.padding.horizontal.max),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(review.imageUrl),
                      radius: 24,
                    ),
                    SizedBox(width: Dimension.padding.horizontal.max),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.name,
                          style: context.textStyle15SemiBold(color: theme.textPrimary),
                        ),
                        Text(
                          review.timeAgo,
                          style: context.textStyle10Regular(color: theme.textLight),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RatingBar.builder(
                  itemBuilder: (_, index) => Icon(
                    Icons.star,
                    color: theme.warning,
                    size: 10,
                  ),
                  onRatingUpdate: (_) {},
                  itemCount: review.rating.toInt(),
                  initialRating: review.rating,
                  itemSize: Dimension.size.vertical.sixteen,
                ),
                const SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                  style: context.textStyle10Regular(color: theme.textLight.withOpacity(.7)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
