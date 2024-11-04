import '../../../features/onboard/onboard.dart';

extension OnboardBlocExtension on OnboardBloc {
  bool get onBoarded => state.onBoarded;
}
