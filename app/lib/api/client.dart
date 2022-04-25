import 'package:dio/dio.dart';

Dio _createClient() => Dio(BaseOptions(baseUrl: 'http://sbapi.ved.yt/'));

final client = _createClient();
