part of 'fetch_discount_bloc.dart';

sealed class FetchDiscountState extends Equatable {
  const FetchDiscountState();

  @override
  List<Object> get props => [];
}

final class FetchDiscountInitial extends FetchDiscountState {}

final class FetchDiscountLoading extends FetchDiscountState {
  const FetchDiscountLoading();

  @override
  List<Object> get props => [];
}

final class FetchDiscountLoaded extends FetchDiscountState {
  const FetchDiscountLoaded({
    required this.discounts,
  });

  final List<DiscountEntity> discounts;

  @override
  List<Object> get props => [discounts];
}

final class FetchDiscountError extends FetchDiscountState {
  const FetchDiscountError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
