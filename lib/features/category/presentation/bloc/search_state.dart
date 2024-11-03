part of 'search_bloc.dart';

sealed class SearchCategoriesState extends Equatable {
  const SearchCategoriesState();

  @override
  List<Object> get props => [];
}

final class SearchCategoriesInitial extends SearchCategoriesState {
  const SearchCategoriesInitial();
  @override
  List<Object> get props => [];
}

final class SearchCategoriesError extends SearchCategoriesState {
  final Failure failure;

  const SearchCategoriesError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class SearchCategoriesLoading extends SearchCategoriesState {
  const SearchCategoriesLoading();
  @override
  List<Object> get props => [];
}

final class SearchCategoriesDone extends SearchCategoriesState {
  final List<String> categories;

  const SearchCategoriesDone({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}
