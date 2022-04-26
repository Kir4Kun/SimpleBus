import 'package:app/domain/bus_model.dart';

import 'client.dart';

Future<List<BusModel>> getAllBuses() async {
  final response = await client.get<List>('/buses');
  return response.data!.map((e) => BusModel.fromJson(e)).toList();
}

Future<void> startBus(int id) async {
  await client.post('/buses/$id/start');
}

Future<void> stopBus(int id) async {
  await client.post('/buses/$id/stop');
}
