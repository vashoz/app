import '../../../../core/shared/shared.dart';
import '../../products.dart';

part 'new_arrivals_event.dart';
part 'new_arrivals_state.dart';

class NewArrivalProductsBloc
    extends Bloc<NewArrivalProductsEvent, NewArrivalProductsState> {
  final NewArrivalProductsUseCase useCase;
  NewArrivalProductsBloc({required this.useCase})
      : super(NewArrivalProductsInitial()) {
    on<FetchNewArrivalProducts>((event, emit) async {
      emit(const NewArrivalProductsLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(NewArrivalProductsError(failure: failure)),
        (products) => emit(NewArrivalProductsDone(
          products: products,
        )),
      );
    });
  }
}
