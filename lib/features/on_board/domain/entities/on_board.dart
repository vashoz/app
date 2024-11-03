import '../../../../core/shared/shared.dart';

class OnBoardEntity extends Equatable {
  // TODO: implement entity properties
  final int id;

  const OnBoardEntity({
    required this.id,
  });

  factory OnBoardEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        id,
      ];
}
