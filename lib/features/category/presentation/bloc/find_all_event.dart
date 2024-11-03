part of 'find_all_bloc.dart';

sealed class FindAllCategoriesEvent extends Equatable {
  const FindAllCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class FindAllCategories extends FindAllCategoriesEvent {
  const FindAllCategories();
  @override
  List<Object> get props => [];
}

final class RefreshAllCategories extends FindAllCategoriesEvent {
  const RefreshAllCategories();
  @override
  List<Object> get props => [];
}
