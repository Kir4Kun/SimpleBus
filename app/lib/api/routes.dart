import 'package:app/domain/bus_model.dart';
import 'package:app/domain/route_model.dart';

import 'client.dart';

Future<List<BusModel>> searchRoutes(String from, String to) async {
  final response = await client.get<List>('/routes/search', queryParameters: {
    'from': from,
    'to': to,
  });
  return response.data!.map((e) => BusModel.fromJson(e)).toList();
}

Future<List<RouteModel>> getRoutesByBusId(
  num id,
) async {
  final response = await client.get<List>(
    '/routes/$id',
  );
  return response.data!.map((e) => RouteModel.fromJson(e)).toList();
}
