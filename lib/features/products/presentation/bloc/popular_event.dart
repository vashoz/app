part of 'popular_bloc.dart';

sealed class PopularProductsEvent extends Equatable {
  const PopularProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularProducts extends PopularProductsEvent {
  const FetchPopularProducts();
}
