import 'package:app/domain/busstop_model.dart';

import 'client.dart';

Future<List<BusStopModel>> getAllBusstops() async {
  final response = await client.get<List>('/busstops');
  return response.data!.map((e) => BusStopModel.fromJson(e)).toList();
}
