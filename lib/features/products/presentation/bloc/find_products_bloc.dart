import 'package:vashoz/features/products/products.dart';

import '../../../../core/shared/shared.dart';

part 'find_products_event.dart';
part 'find_products_state.dart';

class FindProductsBloc extends Bloc<FindProductsEvent, FindProductsState> {
  final CategoryUseCase useCase;
  FindProductsBloc({
    required this.useCase,
  }) : super(FindProductsInitial()) {
    on<FindProducts>((event, emit) async {
      emit(const FindProductsLoading());
      final result = await useCase(slug: event.slug);
      result.fold(
        (error) => emit(FindProductsError(error.message)),
        (categories) => emit(FindProductsDone(categories)),
      );
    });
  }
}
