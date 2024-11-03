import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DashboardModel extends DashboardEntity {
  // TODO: implement model properties
  const DashboardModel({
    required super.guid,
  });

  factory DashboardModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw DashboardModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
