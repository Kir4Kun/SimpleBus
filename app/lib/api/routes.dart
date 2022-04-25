import 'client.dart';
import 'package:dio/dio.dart';

Future<Response> searchRoutes(String from, String to) async {
  final response = await client.get('/routes/search', queryParameters: {
    'from': from,
    'to': to,
  });
  return response;
}

Future<Response> getRoutesByBusId(
  num id,
) async {
  final response = await client.get(
    '/routes/$id',
  );
  return response;
}
