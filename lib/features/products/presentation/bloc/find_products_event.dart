part of 'find_products_bloc.dart';

sealed class FindProductsEvent extends Equatable {
  const FindProductsEvent();

  @override
  List<Object> get props => [];
}

class FindProducts extends FindProductsEvent {
  final String slug;
  const FindProducts({
    required this.slug,
  });
  @override
  List<Object> get props => [];
}
