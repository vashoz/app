import 'package:vashoz/core/shared/shared.dart';

import '../../business_information.dart';

part 'fetch_information_event.dart';
part 'fetch_information_state.dart';

class FetchInformationBloc
    extends Bloc<FetchInformationEvent, FetchInformationState> {
  final ReadBusinessInformationUseCase usecase;
  FetchInformationBloc({required this.usecase})
      : super(FetchInformationInitial()) {
    on<FetchInformation>((event, emit) async {
      emit(const FetchInformationLoading());
      final result = await usecase();
      result.fold((error) {
        emit(FetchInformationError(error));
      }, (data) {
        emit(FetchInformationDone(data));
      });
    });
  }
}
