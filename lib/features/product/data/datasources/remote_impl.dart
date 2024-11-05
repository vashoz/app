import '../../../../core/shared/shared.dart';
import '../../product.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final Client client;

  ProductsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<ProductsModel> find({
    required String slug,
  }) async {
    try {
      final payload = await rootBundle.loadString('assets/mock/product.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final ProductsModel result =
            ProductsModel.parse(map: (json.decode(response.body)));
        return result;
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<List<String>> category({
    required String slug,
  }) async {
    try {
      final payload =
          await rootBundle.loadString('assets/mock/product_category.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final List<String> result =
            List<String>.from(json.decode(response.body));
        return result;
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> newArrivals() async {
    try {
      final payload =
          await rootBundle.loadString('assets/mock/new_arrivals.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final List<String> result =
            List<String>.from(json.decode(response.body));
        return result;
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> popular() async {
    try {
      final payload = await rootBundle.loadString('assets/mock/popular.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final List<String> result =
            List<String>.from(json.decode(response.body));
        return result;
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }
}
