import '../../../../core/shared/shared.dart';
import '../../search.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    required super.id,
  });

  factory SearchModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw SearchModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
