import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  // TODO: implement model properties
  const ProductDetailsModel({
    required super.guid,
  });

  factory ProductDetailsModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ProductDetailsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
