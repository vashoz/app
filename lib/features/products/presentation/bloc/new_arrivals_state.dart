part of 'new_arrivals_bloc.dart';

sealed class NewArrivalProductsState extends Equatable {
  const NewArrivalProductsState();

  @override
  List<Object> get props => [];
}

final class NewArrivalProductsInitial extends NewArrivalProductsState {}

final class NewArrivalProductsLoading extends NewArrivalProductsState {
  const NewArrivalProductsLoading();
  @override
  List<Object> get props => [];
}

final class NewArrivalProductsDone extends NewArrivalProductsState {
  final List<String> products;
  const NewArrivalProductsDone({required this.products});
  @override
  List<Object> get props => [products];
}

final class NewArrivalProductsError extends NewArrivalProductsState {
  final Failure failure;
  const NewArrivalProductsError({required this.failure});
  @override
  List<Object> get props => [failure];
}
