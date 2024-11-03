part of 'find_products_bloc.dart';

sealed class FindProductsState extends Equatable {
  const FindProductsState();

  @override
  List<Object> get props => [];
}

final class FindProductsInitial extends FindProductsState {}

class FindProductsDone extends FindProductsState {
  final List<String> categories;
  const FindProductsDone(this.categories);
}

class FindProductsLoading extends FindProductsState {
  const FindProductsLoading();
}

class FindProductsError extends FindProductsState {
  final String message;
  const FindProductsError(this.message);
}
