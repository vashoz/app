part of 'track_order_bloc.dart';

sealed class TrackOrderEvent extends Equatable {
  const TrackOrderEvent();

  @override
  List<Object> get props => [];
}

class TrackOrder extends TrackOrderEvent {
  final String orderId;
  final String email;

  const TrackOrder(
    this.orderId,
    this.email,
  );
}
