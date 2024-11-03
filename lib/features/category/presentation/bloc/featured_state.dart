part of 'featured_bloc.dart';

sealed class FindFeaturedCategoriesState extends Equatable {
  const FindFeaturedCategoriesState();

  @override
  List<Object> get props => [];
}

final class FindFeaturedCategoriesInitial extends FindFeaturedCategoriesState {
  const FindFeaturedCategoriesInitial();
  @override
  List<Object> get props => [];
}

final class FindFeaturedCategoriesError extends FindFeaturedCategoriesState {
  final Failure failure;

  const FindFeaturedCategoriesError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class FindFeaturedCategoriesLoading extends FindFeaturedCategoriesState {
  const FindFeaturedCategoriesLoading();
  @override
  List<Object> get props => [];
}

final class FindFeaturedCategoriesDone extends FindFeaturedCategoriesState {
  final List<String> categories;

  const FindFeaturedCategoriesDone({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}
