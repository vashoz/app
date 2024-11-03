import '../../../../core/shared/shared.dart';
import '../../variant.dart';

abstract class VariantRemoteDataSource {
  FutureOr<void> create({
    required VariantEntity variant,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<VariantModel> find({
    required String guid,
  });

  FutureOr<List<VariantModel>> read();

  FutureOr<List<VariantModel>> refresh();

  FutureOr<List<VariantModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required VariantEntity variant,
  });
}
