import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class RefreshOnBoardUseCase {
  final OnBoardRepository repository;

  RefreshOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<OnBoardEntity>>> call() async {
    return await repository.refresh();
  }
}
