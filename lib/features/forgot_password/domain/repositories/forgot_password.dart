import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

typedef ForgotPasswordEntityPaginatedResponse = ({
  List<ForgotPasswordEntity> items,
  int total,
});

abstract class ForgotPasswordRepository {
  FutureOr<Either<Failure, void>> create({
    required ForgotPasswordEntity forgotPassword,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, ForgotPasswordEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> read();

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> refresh();

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required ForgotPasswordEntity forgotPassword,
  });
}
