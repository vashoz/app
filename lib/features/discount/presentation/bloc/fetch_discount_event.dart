part of 'fetch_discount_bloc.dart';

sealed class FetchDiscountEvent extends Equatable {
  const FetchDiscountEvent();

  @override
  List<Object> get props => [];
}

class FetchDiscount extends FetchDiscountEvent {
  const FetchDiscount();
}
