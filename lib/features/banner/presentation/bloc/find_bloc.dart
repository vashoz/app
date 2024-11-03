import '../../../../core/shared/shared.dart';
import '../../banner.dart';

part 'find_event.dart';
part 'find_state.dart';

class FindBannersBloc extends Bloc<FindBannersEvent, FindBannersState> {
  final FindBannerUseCase find;
  final RefreshBannerUseCase refresh;
  FindBannersBloc({
    required this.find,
    required this.refresh,
  }) : super(const FindBannersInitial()) {
    on<FindBanners>((event, emit) async {
      emit(const FindBannersLoading());
      final result = await find();
      result.fold(
        (failure) => emit(FindBannersError(failure: failure)),
        (banner) => emit(FindBannersDone(banners: banner)),
      );
    });
    on<RefreshBanners>((event, emit) async {
      emit(const FindBannersLoading());
      final result = await refresh();
      result.fold(
        (failure) => emit(FindBannersError(failure: failure)),
        (banner) => emit(FindBannersDone(banners: banner)),
      );
    });
  }
}
