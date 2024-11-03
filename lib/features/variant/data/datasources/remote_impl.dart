import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class VariantRemoteDataSourceImpl extends VariantRemoteDataSource {
  final Client client;

  VariantRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required VariantEntity variant,
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
  FutureOr<VariantModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<VariantModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<VariantModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<VariantModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required VariantEntity variant,
  }) async {
    throw UnimplementedError();
  }
}
