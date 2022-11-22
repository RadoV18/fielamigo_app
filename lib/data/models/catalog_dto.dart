class CatalogDto {
  int id;
  String name;

  CatalogDto({
    required this.id,
    required this.name,
  });

  factory CatalogDto.fromJson(Map<String, dynamic> json) => CatalogDto(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}