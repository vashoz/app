import '../../../../core/shared/shared.dart';

class ProfileEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const ProfileEntity({
    required this.guid,
  });

  factory ProfileEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
