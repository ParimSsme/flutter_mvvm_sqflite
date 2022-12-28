import 'dart:convert';

class Poet {

  static const String tableKey = "poet";
  static const String idKey = "id";
  static const String nameKey = "name";
  static const String infoKey = "info";
  static const String imageKey = "image";

  final int? id;
  final String name;
  final String info;
  final String image;

  Poet({
    this.id,
    required this.name,
    required this.info,
    required this.image
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      idKey: id,
      nameKey: name,
      infoKey: info,
      imageKey: image
    };
  }

  factory Poet.fromMap(Map<String, dynamic> map) {
    return Poet(
      id: map[idKey]?.toInt() ?? 0,
      name: map[nameKey] ?? '',
      info: map[infoKey] ?? '',
      image: map[imageKey] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Poet.fromJson(String source) => Poet.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$tableKey($idKey: $id, $nameKey: $name, $infoKey: $info, '
        '$imageKey: $image)';
  }
}
