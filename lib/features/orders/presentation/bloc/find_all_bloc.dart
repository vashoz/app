import '../../../../core/shared/shared.dart';
import '../../orders.dart';

part 'find_all_event.dart';
part 'find_all_state.dart';

class FindAllBloc extends Bloc<FindAllEvent, FindAllState> {
  final FindAllOrdersUseCase usecase;
  FindAllBloc({
    required this.usecase,
  }) : super(FindAllInitial()) {
    on<FindAll>((event, emit) async {
      emit(const FindAllLoading());
      final result = await usecase(guid: event.guid);

      result.fold(
        (error) => emit(FindAllError(failure: error)),
        (orders) => emit(FindAllDone(orders: orders)),
      );
    });
  }
}
