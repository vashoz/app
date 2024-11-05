part of 'find_bloc.dart';

sealed class FindProductEvent extends Equatable {
  const FindProductEvent();

  @override
  List<Object> get props => [];
}

class FindProduct extends FindProductEvent {
  final String slug;
  const FindProduct({required this.slug});
}
