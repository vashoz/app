import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

part 'track_order_event.dart';
part 'track_order_state.dart';

class TrackOrderBloc extends Bloc<TrackOrderEvent, TrackOrderState> {
  final ReadTrackOrderUseCase usecase;
  TrackOrderBloc({
    required this.usecase,
  }) : super(TrackOrderInitial()) {
    on<TrackOrder>((event, emit) async {
      emit(const TrackOrderLoading());
      final result = await usecase(
        orderId: event.orderId,
        email: event.email,
      );
      result.fold(
        (l) => emit(TrackOrderError(failure: l)),
        (r) => emit(TrackOrderDone(item: r)),
      );
    });
  }
}
