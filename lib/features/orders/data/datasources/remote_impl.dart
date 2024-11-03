import '../../../../core/shared/shared.dart';
import '../../orders.dart';

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final Client client;

  OrdersRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<OrdersModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrdersModel>> findAll({
    required String guid,
  }) async {
    try {
      final payload = await rootBundle.loadString('assets/mock/orders.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final List<Map<String, dynamic>> result =
            List<Map<String, dynamic>>.from(json.decode(response.body));

        final List<OrdersModel> resultList =
            List<Map<String, dynamic>>.from(result)
                .map((e) => OrdersModel.parse(map: e))
                .toList();
        return resultList;
      } else {
        throw OrdersModelParseFailure(
            message: response.reasonPhrase ?? "Api call failed",
            stackTrace: null);
      }
    } catch (e) {
      throw OrdersModelParseFailure(
          message: "Api call failed", stackTrace: null);
    }
  }

  @override
  FutureOr<List<OrdersModel>> refresh() async {
    throw UnimplementedError();
  }
}
