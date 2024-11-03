import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final Client client;

  ProfileRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required ProfileEntity profile,
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
  FutureOr<ProfileModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProfileModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProfileModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ProfileModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required ProfileEntity profile,
  }) async {
    throw UnimplementedError();
  }
}
