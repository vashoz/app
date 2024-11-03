import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class ForgotPasswordRemoteDataSourceImpl
    extends ForgotPasswordRemoteDataSource {
  final Client client;

  ForgotPasswordRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required ForgotPasswordEntity forgotPassword,
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
  FutureOr<ForgotPasswordModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ForgotPasswordModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ForgotPasswordModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ForgotPasswordModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required ForgotPasswordEntity forgotPassword,
  }) async {
    throw UnimplementedError();
  }
}
