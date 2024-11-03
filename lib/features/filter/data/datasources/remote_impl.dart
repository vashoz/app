import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterRemoteDataSourceImpl extends FilterRemoteDataSource {
  final Client client;

  FilterRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required FilterEntity filter,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<FilterModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FilterModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FilterModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FilterModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required FilterEntity filter,
  }) async {
    throw UnimplementedError();
  }
}
