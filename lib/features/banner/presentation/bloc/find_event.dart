part of 'find_bloc.dart';

abstract class FindBannersEvent extends Equatable {
  const FindBannersEvent();

  @override
  List<Object> get props => [];
}

class FindBanners extends FindBannersEvent {
  const FindBanners();
  @override
  List<Object> get props => [];
}

class RefreshBanners extends FindBannersEvent {
  const RefreshBanners();
  @override
  List<Object> get props => [];
}
