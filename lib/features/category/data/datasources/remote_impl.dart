import '../../../../core/shared/shared.dart';
import '../../category.dart';

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final Client client;

  CategoriesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<List<String>> all() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<String>> featured() async {
    final payload =
        await rootBundle.loadString('assets/mock/featured-categories.json');

    final response = Response(payload, HttpStatus.ok);

    if (response.statusCode == HttpStatus.ok) {
      final List<String> result = List<String>.from(json.decode(response.body));
      return result;
    } else {
      throw RemoteFailure(message: response.body);
    }
  }

  @override
  FutureOr<CategoryModel> find({
    required String slug,
  }) async {
    final payload = await rootBundle.loadString('assets/mock/category.json');

    final response = Response(payload, HttpStatus.ok);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> result =
          Map<String, dynamic>.from(json.decode(response.body));
      return CategoryModel.parse(map: result);
    } else {
      throw RemoteFailure(message: response.body);
    }
  }

  @override
  FutureOr<List<String>> search({
    required String query,
  }) async {
    // TODO: implement search
    throw UnimplementedError();
  }
}
