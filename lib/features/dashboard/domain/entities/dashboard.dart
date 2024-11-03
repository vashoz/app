import '../../../../core/shared/shared.dart';

class DashboardEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const DashboardEntity({
    required this.guid,
  });

  factory DashboardEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
