import 'package:dio/dio.dart';

Dio _createClient() => Dio(BaseOptions(baseUrl: 'http://localhost:3000/'));

final client = _createClient();
