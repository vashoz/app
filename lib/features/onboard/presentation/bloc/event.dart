part of 'bloc.dart';

abstract class OnboardEvent extends Equatable {
  const OnboardEvent();

  @override
  List<Object> get props => [];
}

class OnBoarded extends OnboardEvent {
  const OnBoarded();
  @override
  List<Object> get props => [];
}

class PermissionPrompted extends OnboardEvent {
  const PermissionPrompted();
  @override
  List<Object> get props => [];
}
