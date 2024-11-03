import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final Client client;

  FavoriteRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required FavoriteEntity favorite,
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
  FutureOr<FavoriteModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FavoriteModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FavoriteModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FavoriteModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required FavoriteEntity favorite,
  }) async {
    throw UnimplementedError();
  }
}
