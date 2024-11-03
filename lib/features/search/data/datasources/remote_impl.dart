import '../../../../core/shared/shared.dart';
import '../../search.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final Client client;

  SearchRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required SearchEntity search,
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
  FutureOr<SearchModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<SearchModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<SearchModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<SearchModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required SearchEntity search,
  }) async {
    throw UnimplementedError();
  }
}
