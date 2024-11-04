part of 'fetch_information_bloc.dart';

sealed class FetchInformationState extends Equatable {
  const FetchInformationState();

  @override
  List<Object> get props => [];
}

final class FetchInformationInitial extends FetchInformationState {}

final class FetchInformationLoading extends FetchInformationState {
  const FetchInformationLoading();
}

final class FetchInformationDone extends FetchInformationState {
  final BusinessInformationEntity businessInformation;
  const FetchInformationDone(this.businessInformation);
}

final class FetchInformationError extends FetchInformationState {
  final Failure message;
  const FetchInformationError(this.message);
}
