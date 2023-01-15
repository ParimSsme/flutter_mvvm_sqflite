
class Poet {

  int? id;
  String? name;
  String? info;
  String? image;

  poetMap() {
    var mapping = <String, dynamic>{};
    mapping[PoetColumns.id.value] = id;
    mapping[PoetColumns.name.name] = name;
    mapping[PoetColumns.info.value] = info;
    mapping[PoetColumns.image.value] = image!;
    return mapping;
  }
}

enum PoetColumns<T extends Object> {

  id<String>('id'),
  name<String>('name'),
  info<String>('info'),
  image<String>('image');

  const PoetColumns(this.value);
  final T value;

}
