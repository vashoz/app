import '../../../../core/shared/shared.dart';
import '../../auth.dart';

typedef AuthEntityPaginatedResponse = ({
  List<AuthEntity> items,
  int total,
});

abstract class AuthRepository {
  FutureOr<Either<Failure, void>> create({
    required AuthEntity auth,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, AuthEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<AuthEntity>>> read();

  FutureOr<Either<Failure, List<AuthEntity>>> refresh();

  FutureOr<Either<Failure, List<AuthEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required AuthEntity auth,
  });
}
