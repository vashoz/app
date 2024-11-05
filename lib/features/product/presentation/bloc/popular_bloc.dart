import '../../../../core/shared/shared.dart';
import '../../product.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularProductsBloc
    extends Bloc<PopularProductsEvent, PopularProductsState> {
  final PopularProductsUseCase useCase;
  PopularProductsBloc({
    required this.useCase,
  }) : super(PopularProductsInitial()) {
    on<FetchPopularProducts>((event, emit) async {
      emit(const PopularProductsLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(PopularProductsError(failure: failure)),
        (products) => emit(PopularProductsDone(products: products)),
      );
    });
  }
}
