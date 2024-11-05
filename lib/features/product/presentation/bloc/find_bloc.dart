import '../../../../core/shared/shared.dart';
import '../../product.dart';

part 'find_event.dart';
part 'find_state.dart';

class FindProductBloc extends Bloc<FindProductEvent, FindProductState> {
  final FindProductUseCase useCase;
  FindProductBloc({
    required this.useCase,
  }) : super(FindProductInitial()) {
    on<FindProduct>((event, emit) async {
      emit(const FindProductLoading());
      final result = await useCase(slug: event.slug);
      result.fold(
        (error) => emit(FindProductError(message: error.message)),
        (product) => emit(FindProductDone(product: product)),
      );
    });
  }
}
