import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

abstract class ProductDetailsRemoteDataSource {
  FutureOr<void> create({
    required ProductDetailsEntity productDetails,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<ProductDetailsModel> find({
    required String guid,
  });

  FutureOr<List<ProductDetailsModel>> read();

  FutureOr<List<ProductDetailsModel>> refresh();

  FutureOr<List<ProductDetailsModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required ProductDetailsEntity productDetails,
  });
}
