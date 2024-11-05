part of 'new_arrivals_bloc.dart';

sealed class NewArrivalProductsEvent extends Equatable {
  const NewArrivalProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewArrivalProducts extends NewArrivalProductsEvent {}
