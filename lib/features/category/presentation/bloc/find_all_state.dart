part of 'find_all_bloc.dart';

sealed class FindAllCategoriesState extends Equatable {
  const FindAllCategoriesState();

  @override
  List<Object> get props => [];
}

final class FindAllCategoriesInitial extends FindAllCategoriesState {
  const FindAllCategoriesInitial();
  @override
  List<Object> get props => [];
}

final class FindAllCategoriesError extends FindAllCategoriesState {
  final Failure failure;

  const FindAllCategoriesError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class FindAllCategoriesLoading extends FindAllCategoriesState {
  const FindAllCategoriesLoading();
  @override
  List<Object> get props => [];
}

final class FindAllCategoriesDone extends FindAllCategoriesState {
  final List<String> categories;

  const FindAllCategoriesDone({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}
