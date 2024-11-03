import '../../../../core/shared/shared.dart';
import '../../products.dart';

abstract class ProductsRemoteDataSource {
  FutureOr<ProductsModel> find({
    required String slug,
  });

  FutureOr<List<String>> category({
    required String slug,
  });

  FutureOr<List<String>> popular();

  FutureOr<List<String>> newArrivals();
}
