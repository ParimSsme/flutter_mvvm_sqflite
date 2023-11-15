class Poet {
  static const String tableKey = "poet";
  static const String idKey = "id";
  static const String nameKey = "name";
  static const String infoKey = "info";
  static const String imageKey = "image";
  static const String isFavoriteKey = "isFavorite";

  int? id;
  String name;
  String info;
  String image;
  bool isFavorite;

  Poet({
    this.id,
    this.name = "",
    this.info = "",
    this.image = "",
    this.isFavorite = false,
  });

  factory Poet.fromMap(Map<String, dynamic> map) {
    return Poet(
      id: map[idKey]?.toInt(),
      name: map[nameKey] ?? '',
      info: map[infoKey] ?? '',
      image: map[imageKey] ?? '',
      isFavorite: (map[isFavoriteKey] ?? 0) == 0 ? false : true,
    );
  }

  poetMap() {
    var mapping = <String, dynamic>{};
    mapping[idKey] = id;
    mapping[nameKey] = name;
    mapping[infoKey] = info;
    mapping[imageKey] = image;
    mapping[isFavoriteKey] = (isFavorite) == false ? 0 : 1;
    return mapping;
  }
}
