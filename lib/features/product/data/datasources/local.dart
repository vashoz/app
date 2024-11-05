import '../../../../core/shared/shared.dart';
import '../../product.dart';

abstract class ProductsLocalDataSource {
  FutureOr<void> add({
    required String slug,
    required ProductEntity product,
  });

  FutureOr<void> addAll({
    required List<ProductEntity> products,
  });

  FutureOr<void> addNewArrivals({
    required List<String> products,
  });
  FutureOr<void> addPopular({
    required List<String> products,
  });

  FutureOr<void> addCategory({
    required String slug,
    required List<String> products,
  });

  FutureOr<void> update({
    required ProductEntity product,
  });

  FutureOr<void> remove({
    required String slug,
  });

  FutureOr<void> removeAll();

  FutureOr<ProductEntity> find({
    required String slug,
  });

  FutureOr<List<String>> findCategory({
    required String slug,
  });
  FutureOr<List<String>> findAll();
  FutureOr<List<String>> findPopular();

  FutureOr<List<String>> findNewArrivals();
}
