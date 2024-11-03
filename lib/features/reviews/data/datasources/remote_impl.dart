import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class ReviewsRemoteDataSourceImpl extends ReviewsRemoteDataSource {
  final Client client;

  ReviewsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required ReviewsEntity reviews,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<ReviewsModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ReviewsModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ReviewsModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ReviewsModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required ReviewsEntity reviews,
  }) async {
    throw UnimplementedError();
  }
}
