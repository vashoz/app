import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterModel extends FilterEntity {
  // TODO: implement model properties
  FilterModel({
    required super.id,
  });

  factory FilterModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw FilterModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
