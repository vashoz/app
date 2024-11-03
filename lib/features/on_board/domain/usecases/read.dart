import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class ReadOnBoardUseCase {
  final OnBoardRepository repository;

  ReadOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<OnBoardEntity>>> call() async {
    return await repository.read();
  }
}
