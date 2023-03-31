class InventoryCategoryDto {
  InventoryCategoryDto({
    required this.id,
    required this.name,});

  InventoryCategoryDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  late final int id;
  late final String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}