import '../../../../core/shared/shared.dart';
import '../../profile.dart';

abstract class ProfileRemoteDataSource {
  FutureOr<void> create({
    required ProfileEntity profile,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<ProfileModel> find({
    required String guid,
  });

  FutureOr<List<ProfileModel>> read();

  FutureOr<List<ProfileModel>> refresh();

  FutureOr<List<ProfileModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required ProfileEntity profile,
  });
}
