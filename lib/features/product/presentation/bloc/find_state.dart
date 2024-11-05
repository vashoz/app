part of 'find_bloc.dart';

sealed class FindProductState extends Equatable {
  const FindProductState();

  @override
  List<Object> get props => [];
}

final class FindProductInitial extends FindProductState {}

final class FindProductDone extends FindProductState {
  final ProductEntity product;

  const FindProductDone({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

final class FindProductLoading extends FindProductState {
  const FindProductLoading();
  @override
  List<Object> get props => [];
}

final class FindProductError extends FindProductState {
  final String message;

  const FindProductError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
