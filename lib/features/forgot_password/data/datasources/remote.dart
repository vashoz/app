import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

abstract class ForgotPasswordRemoteDataSource {
  FutureOr<void> create({
    required ForgotPasswordEntity forgotPassword,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<ForgotPasswordModel> find({
    required String guid,
  });

  FutureOr<List<ForgotPasswordModel>> read();

  FutureOr<List<ForgotPasswordModel>> refresh();

  FutureOr<List<ForgotPasswordModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required ForgotPasswordEntity forgotPassword,
  });
}
