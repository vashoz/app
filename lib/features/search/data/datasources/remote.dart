import '../../../../core/shared/shared.dart';
import '../../search.dart';

abstract class SearchRemoteDataSource {
  FutureOr<void> create({
    required SearchEntity search,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<SearchModel> find({
    required int id,
  });

  FutureOr<List<SearchModel>> read();

  FutureOr<List<SearchModel>> refresh();

  FutureOr<List<SearchModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required SearchEntity search,
  });
}
