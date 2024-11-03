import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class DiscountRemoteDataSourceImpl extends DiscountRemoteDataSource {
  final Client client;

  DiscountRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required DiscountEntity discount,
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
  FutureOr<DiscountModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<DiscountModel>> read() async {
    try {
      final payload = await rootBundle.loadString('assets/mock/discount.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result =
            Map<String, dynamic>.from(json.decode(response.body));
        if (result["success"] as bool) {
          final List<DiscountModel> resultList =
              List<Map<String, dynamic>>.from(result["result"])
                  .map((e) => DiscountModel.parse(map: e))
                  .toList();
          return resultList;
        } else {
          final String errorMessage = result["message"] ?? "";
          throw RemoteFailure(message: errorMessage);
        }
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<List<DiscountModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<DiscountModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required DiscountEntity discount,
  }) async {
    throw UnimplementedError();
  }
}
