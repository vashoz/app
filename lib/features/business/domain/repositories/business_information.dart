import '../../../../core/shared/shared.dart';
import '../../business.dart';

typedef BusinessInformationEntityPaginatedResponse = ({
  List<BusinessInformationEntity> items,
  int total,
});

abstract class BusinessInformationRepository {
  FutureOr<Either<Failure, BusinessInformationEntity>> read();
}
