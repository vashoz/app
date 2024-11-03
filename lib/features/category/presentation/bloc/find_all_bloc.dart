import '../../../../core/shared/shared.dart';
import '../../category.dart';

part 'find_all_event.dart';
part 'find_all_state.dart';

class FindAllCategoriesBloc
    extends Bloc<FindAllCategoriesEvent, FindAllCategoriesState> {
  final FindAllCategoriesUseCase find;
  final RefreshAllCategoriesUseCase refresh;
  FindAllCategoriesBloc({
    required this.find,
    required this.refresh,
  }) : super(const FindAllCategoriesInitial()) {
    on<FindAllCategories>((event, emit) async {
      emit(const FindAllCategoriesLoading());
      final result = await find();
      result.fold(
        (failure) => emit(FindAllCategoriesError(failure: failure)),
        (categories) => emit(FindAllCategoriesDone(categories: categories)),
      );
    });
    on<RefreshAllCategories>((event, emit) async {
      emit(const FindAllCategoriesLoading());
      final result = await refresh();
      result.fold(
        (failure) => emit(FindAllCategoriesError(failure: failure)),
        (categories) => emit(FindAllCategoriesDone(categories: categories)),
      );
    });
  }
}
