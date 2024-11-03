import '../../../../core/shared/shared.dart';

class ForgotPasswordEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const ForgotPasswordEntity({
    required this.guid,
  });

  factory ForgotPasswordEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
