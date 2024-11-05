part of 'popular_bloc.dart';

sealed class PopularProductsState extends Equatable {
  const PopularProductsState();

  @override
  List<Object> get props => [];
}

final class PopularProductsInitial extends PopularProductsState {}

class PopularProductsLoading extends PopularProductsState {
  const PopularProductsLoading();
  @override
  List<Object> get props => [];
}

class PopularProductsDone extends PopularProductsState {
  final List<String> products;
  const PopularProductsDone({required this.products});
  @override
  List<Object> get props => [];
}

class PopularProductsError extends PopularProductsState {
  final Failure failure;
  const PopularProductsError({required this.failure});
  @override
  List<Object> get props => [];
}
