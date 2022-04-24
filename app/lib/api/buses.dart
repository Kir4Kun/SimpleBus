import 'package:app/api/client.dart';
import 'package:dio/dio.dart';

Future<Response> getAllBuses() async {
  final response = await client.get('/buses');
  return response;
}
