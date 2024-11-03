import '../../../../core/shared/shared.dart';
import '../../category.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchCategoriesBloc
    extends Bloc<SearchCategoriesEvent, SearchCategoriesState> {
  final SearchCategoriesUseCase useCase;

  SearchCategoriesBloc({
    required this.useCase,
  }) : super(const SearchCategoriesInitial()) {
    on<SearchCategories>((event, emit) async {
      emit(const SearchCategoriesLoading());
      final result = await useCase(query: event.query);
      result.fold(
        (failure) => emit(SearchCategoriesError(failure: failure)),
        (categories) => emit(SearchCategoriesDone(categories: categories)),
      );
    });
  }
}
