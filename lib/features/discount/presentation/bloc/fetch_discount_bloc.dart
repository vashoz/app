import '../../../../core/shared/shared.dart';
import '../../discount.dart';

part 'fetch_discount_event.dart';
part 'fetch_discount_state.dart';

class FetchDiscountBloc extends Bloc<FetchDiscountEvent, FetchDiscountState> {
  final ReadDiscountUseCase readDiscountUseCase;
  FetchDiscountBloc({required this.readDiscountUseCase})
      : super(FetchDiscountInitial()) {
    on<FetchDiscount>((event, emit) async {
      emit(const FetchDiscountLoading());
      final result = await readDiscountUseCase();
      result.fold((l) {
        emit(FetchDiscountError(message: l.message));
      }, (r) {
        emit(FetchDiscountLoaded(discounts: r));
      });
    });
  }
}
