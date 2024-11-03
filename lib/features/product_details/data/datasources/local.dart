import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

abstract class ProductDetailsLocalDataSource {
  FutureOr<void> add({
    required ProductDetailsEntity productDetails,
  });

  FutureOr<void> addAll({
    required List<ProductDetailsEntity> items,
  });

  FutureOr<void> update({
    required ProductDetailsEntity productDetails,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<ProductDetailsEntity> find({
    required String guid,
  });
}
