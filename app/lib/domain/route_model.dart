import 'package:app/domain/bus_model.dart';
import 'package:app/domain/busstop_model.dart';

class RouteModel {
  final int id;
  final int stopOrder;
  final BusStopModel busStop;

  RouteModel(
      {required this.id, required this.stopOrder, required this.busStop});

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        id: json["id"],
        stopOrder: json["stopOrder"],
        busStop: BusStopModel.fromJson(json["busStop"]),
      );
}
