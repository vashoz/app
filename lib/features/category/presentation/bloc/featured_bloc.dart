import '../../../../core/shared/shared.dart';
import '../../category.dart';

part 'featured_event.dart';
part 'featured_state.dart';

class FindFeaturedCategoriesBloc
    extends Bloc<FindFeaturedCategoriesEvent, FindFeaturedCategoriesState> {
  final FeaturedCategoriesUseCase useCase;
  FindFeaturedCategoriesBloc({
    required this.useCase,
  }) : super(const FindFeaturedCategoriesInitial()) {
    on<FindFeaturedCategories>((event, emit) async {
      emit(const FindFeaturedCategoriesLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FindFeaturedCategoriesError(failure: failure)),
        (categories) =>
            emit(FindFeaturedCategoriesDone(categories: categories)),
      );
    });
  }
}
