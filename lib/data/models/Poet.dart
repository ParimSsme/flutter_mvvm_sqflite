
class Poet {

  int? id;
  String? name;
  String? info;
  String? image;

  poetMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['info'] = info;
    mapping['image'] = image!;
    return mapping;
  }
}
