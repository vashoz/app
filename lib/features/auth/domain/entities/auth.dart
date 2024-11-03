import '../../../../core/shared/shared.dart';

class AuthEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const AuthEntity({
    required this.guid,
  });

  factory AuthEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
