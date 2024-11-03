import '../../../../core/shared/shared.dart';
import '../../business_information.dart';

abstract class BusinessInformationRemoteDataSource {
  FutureOr<BusinessInformationModel> read();
}
