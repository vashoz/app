part of 'track_order_bloc.dart';

sealed class TrackOrderState extends Equatable {
  const TrackOrderState();

  @override
  List<Object> get props => [];
}

final class TrackOrderInitial extends TrackOrderState {}

final class TrackOrderDone extends TrackOrderState {
  final TrackOrderEntity item;
  const TrackOrderDone({
    required this.item,
  });
}

final class TrackOrderLoading extends TrackOrderState {
  const TrackOrderLoading();
}

final class TrackOrderError extends TrackOrderState {
  final Failure failure;
  const TrackOrderError({
    required this.failure,
  });
}
