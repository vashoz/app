part of 'bloc.dart';

class OnboardState extends Equatable {
  final bool onBoarded;
  const OnboardState({
    this.onBoarded = false,
  });

  factory OnboardState.fromJson({
    required Map<String, dynamic> json,
  }) {
    return OnboardState(
      onBoarded: (json['onBoarded'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> get toJson => {
        'onBoarded': onBoarded,
      };

  @override
  List<Object> get props => [onBoarded];
}
