import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class TrackOrderRemoteDataSourceImpl extends TrackOrderRemoteDataSource {
  final Client client;

  TrackOrderRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required TrackOrderEntity trackOrder,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<TrackOrderModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<TrackOrderModel> read({
    required String orderId,
    required String email,
  }) async {
    try {
      final payload =
          await rootBundle.loadString('assets/mock/track_order.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final TrackOrderModel result =
            TrackOrderModel.parse(map: (json.decode(response.body)));
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
  FutureOr<List<TrackOrderModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<TrackOrderModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required TrackOrderEntity trackOrder,
  }) async {
    throw UnimplementedError();
  }
}
