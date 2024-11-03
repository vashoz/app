part of 'find_all_bloc.dart';

sealed class FindAllEvent extends Equatable {
  const FindAllEvent();

  @override
  List<Object> get props => [];
}

class FindAll extends FindAllEvent {
  final String guid;
  const FindAll({required this.guid});
}
