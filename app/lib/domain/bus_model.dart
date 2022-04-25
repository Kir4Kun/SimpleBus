class BusModel {
  final int id;
  final String rno;
  final String name;

  BusModel({required this.id, required this.rno, required this.name});

  factory BusModel.fromJson(Map<String, dynamic> json) => BusModel(
        id: json["id"],
        rno: json["rno"],
        name: json["name"],
      );
}
