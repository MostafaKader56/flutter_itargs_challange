class FavoriteItemModel {
  final int id;
  final String nameEn;
  final String nameAr;
  bool isFavorite;
  FavoriteItemModel({
    required this.nameEn,
    required this.nameAr,
    required this.id,
    this.isFavorite = false,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      isFavorite: json['is_favorite'] == 1 ? true : false,
      // isFavorite: json['is_favorite'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name_en": nameEn,
      "name_ar": nameAr,
      "is_favorite": isFavorite,
    };
  }
}
