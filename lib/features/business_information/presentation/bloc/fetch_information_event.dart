part of 'fetch_information_bloc.dart';

sealed class FetchInformationEvent extends Equatable {
  const FetchInformationEvent();

  @override
  List<Object> get props => [];
}

class FetchInformation extends FetchInformationEvent {
  const FetchInformation();
}
