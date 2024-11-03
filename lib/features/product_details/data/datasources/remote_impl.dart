import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSource {
  final Client client;

  ProductDetailsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required ProductDetailsEntity productDetails,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<ProductDetailsModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProductDetailsModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProductDetailsModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProductDetailsModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required ProductDetailsEntity productDetails,
  }) async {
    throw UnimplementedError();
  }
}
