import '../../../../core/shared/shared.dart';

part 'event.dart';
part 'state.dart';

class OnboardBloc extends HydratedBloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState()) {
    on<OnBoarded>((event, emit) async {
      emit(const OnboardState(onBoarded: true));
    });
  }

  @override
  OnboardState? fromJson(Map<String, dynamic> json) {
    return OnboardState.fromJson(json: json);
  }

  @override
  Map<String, dynamic>? toJson(OnboardState state) {
    return state.toJson;
  }
}
