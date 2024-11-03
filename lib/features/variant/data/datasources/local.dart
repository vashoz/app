import '../../../../core/shared/shared.dart';
import '../../variant.dart';

abstract class VariantLocalDataSource {
  FutureOr<void> add({
    required VariantEntity variant,
  });

  FutureOr<void> addAll({
    required List<VariantEntity> items,
  });

  FutureOr<void> update({
    required VariantEntity variant,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<VariantEntity> find({
    required String guid,
  });
}
