part of 'search_bloc.dart';

sealed class SearchCategoriesEvent extends Equatable {
  const SearchCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class SearchCategories extends SearchCategoriesEvent {
  final String query;

  const SearchCategories({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
