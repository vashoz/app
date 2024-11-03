part of 'find_all_bloc.dart';

sealed class FindAllState extends Equatable {
  const FindAllState();

  @override
  List<Object> get props => [];
}

final class FindAllInitial extends FindAllState {}

final class FindAllLoading extends FindAllState {
  const FindAllLoading();

  @override
  List<Object> get props => [];
}

final class FindAllDone extends FindAllState {
  final List<TrackOrderEntity> orders;

  const FindAllDone({
    required this.orders,
  });

  @override
  List<Object> get props => [orders];
}

final class FindAllError extends FindAllState {
  final Failure failure;

  const FindAllError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
