import '../../../../core/shared/shared.dart';
import '../../filter.dart';

abstract class FilterRemoteDataSource {
  FutureOr<void> create({
    required FilterEntity filter,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<FilterModel> find({
    required int id,
  });

  FutureOr<List<FilterModel>> read();

  FutureOr<List<FilterModel>> refresh();

  FutureOr<List<FilterModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required FilterEntity filter,
  });
}
