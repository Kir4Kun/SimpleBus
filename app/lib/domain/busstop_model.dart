class BusStopModel {
  final int id;
  final double latitude;
  final double longitude;
  final String name;

  BusStopModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.name});

  factory BusStopModel.fromJson(Map<String, dynamic> json) => BusStopModel(
        id: json["id"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
      );
}
