import '../../../../core/shared/shared.dart';

class ReviewsEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  ReviewsEntity({
    required this.guid,
  });

  factory ReviewsEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
