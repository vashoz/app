import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class FindBannerUseCase {
  final BannerRepository repository;

  FindBannerUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<BannerEntity>>> call() async {
    return await repository.find();
  }
}
