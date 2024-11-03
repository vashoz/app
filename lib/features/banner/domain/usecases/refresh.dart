import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class RefreshBannerUseCase {
  final BannerRepository repository;

  RefreshBannerUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<BannerEntity>>> call() async {
    return await repository.find();
  }
}
