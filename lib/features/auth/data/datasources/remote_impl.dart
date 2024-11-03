import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Client client;

  AuthRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required AuthEntity auth,
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
  FutureOr<AuthModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<AuthModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<AuthModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<AuthModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required AuthEntity auth,
  }) async {
    throw UnimplementedError();
  }
}
