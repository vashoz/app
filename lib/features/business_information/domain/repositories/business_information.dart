import '../../../../core/shared/shared.dart';
import '../../business_information.dart';

typedef BusinessInformationEntityPaginatedResponse = ({
  List<BusinessInformationEntity> items,
  int total,
});

abstract class BusinessInformationRepository {
  FutureOr<Either<Failure, BusinessInformationEntity>> read();
}
