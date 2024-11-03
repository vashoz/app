import '../../../../core/shared/shared.dart';
import '../../business_information.dart';

class BusinessInformationRepositoryImpl extends BusinessInformationRepository {
  final NetworkInfo network;

  final BusinessInformationRemoteDataSource remote;

  BusinessInformationRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, BusinessInformationEntity>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        //await local.add(item: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
