import '../../../../core/shared/shared.dart';
import '../../business_information.dart';

class ReadBusinessInformationUseCase {
  final BusinessInformationRepository repository;

  ReadBusinessInformationUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, BusinessInformationEntity>> call() async {
    return await repository.read();
  }
}
