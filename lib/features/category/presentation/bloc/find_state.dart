part of 'find_bloc.dart';

sealed class FindCategoryState extends Equatable {
  const FindCategoryState();

  @override
  List<Object> get props => [];
}

final class FindCategoryInitial extends FindCategoryState {
  const FindCategoryInitial();
  @override
  List<Object> get props => [];
}

final class FindCategoryError extends FindCategoryState {
  final Failure failure;

  const FindCategoryError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class FindCategoryLoading extends FindCategoryState {
  const FindCategoryLoading();
  @override
  List<Object> get props => [];
}

final class FindCategoryDone extends FindCategoryState {
  final CategoryEntity category;

  const FindCategoryDone({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
