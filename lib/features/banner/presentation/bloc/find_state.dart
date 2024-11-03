part of 'find_bloc.dart';

abstract class FindBannersState extends Equatable {
  const FindBannersState();

  @override
  List<Object> get props => [];
}

class FindBannersInitial extends FindBannersState {
  const FindBannersInitial();
}

class FindBannersLoading extends FindBannersState {
  const FindBannersLoading();
}

class FindBannersError extends FindBannersState {
  final Failure failure;

  const FindBannersError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindBannersDone extends FindBannersState {
  final List<BannerEntity> banners;

  const FindBannersDone({required this.banners});

  @override
  List<Object> get props => [banners];
}
