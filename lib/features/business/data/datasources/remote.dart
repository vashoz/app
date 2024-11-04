import '../../../../core/shared/shared.dart';
import '../../business.dart';

abstract class BusinessInformationRemoteDataSource {
  FutureOr<BusinessInformationModel> read();
}
