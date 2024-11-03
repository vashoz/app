import '../../../../core/shared/shared.dart';
import '../../auth.dart';

abstract class AuthRemoteDataSource {
  FutureOr<void> create({
    required AuthEntity auth,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<AuthModel> find({
    required String guid,
  });

  FutureOr<List<AuthModel>> read();

  FutureOr<List<AuthModel>> refresh();

  FutureOr<List<AuthModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required AuthEntity auth,
  });
}
