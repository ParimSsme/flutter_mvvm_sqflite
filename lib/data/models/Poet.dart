
class Poet {

  static const String tableKey = "book";
  static const String idKey = "id";
  static const String nameKey = "name";
  static const String infoKey = "info";
  static const String imageKey = "image";

  int id;
  String name;
  String info;
  String image;

  Poet({
    this.id = -1,
    this.name = "",
    this.info = "",
    this.image = ""
  });

  factory Poet.fromMap(Map<String, dynamic> map) {
    return Poet(
        id: map[idKey]?.toInt() ?? 0,
        name: map[nameKey] ?? '',
        info: map[infoKey] ?? '',
        image: map[imageKey] ?? ''
    );
  }

  // int? id;
  // String? name;
  // String? info;
  // String? image;
  //
  // poetMap() {
  //   var mapping = <String, dynamic>{};
  //   mapping[PoetColumns.id.value] = id;
  //   mapping[PoetColumns.name.name] = name;
  //   mapping[PoetColumns.info.value] = info;
  //   mapping[PoetColumns.image.value] = image;
  //   return mapping;
  // }
}