import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class ReviewsModel extends ReviewsEntity {
  // TODO: implement model properties
  ReviewsModel({
    required super.guid,
  });

  factory ReviewsModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ReviewsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
