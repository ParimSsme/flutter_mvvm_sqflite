enum RouteEnum<T extends Object> {

  splash<Map<String, dynamic>>({"/": 0}),
  home<Map<String, dynamic>>({"map": 0}),
  poetEdit<Map<String, dynamic>>({"map": PoetEditArguments}),
  poetInfo<Map<String, dynamic>>({"map": 0});

  const RouteEnum(this.value);
  final T value;

}

enum PoetEditArguments<T extends Object> {

  splash<Map<String, dynamic>>({"map": 0});

  const PoetEditArguments(this.value);
  final T value;

}
