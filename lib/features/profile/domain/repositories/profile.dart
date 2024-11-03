import '../../../../core/shared/shared.dart';
import '../../profile.dart';

typedef ProfileEntityPaginatedResponse = ({
  List<ProfileEntity> items,
  int total,
});

abstract class ProfileRepository {
  FutureOr<Either<Failure, void>> create({
    required ProfileEntity profile,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, ProfileEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<ProfileEntity>>> read();

  FutureOr<Either<Failure, List<ProfileEntity>>> refresh();

  FutureOr<Either<Failure, List<ProfileEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required ProfileEntity profile,
  });
}
