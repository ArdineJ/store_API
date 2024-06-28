// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

// List<DataModel> dataFromJson(String str) =>
//     List<DataModel>.from(jsonDecode(str).map((x) => DataModel.fromMap(x)));

// String dataToJson(List<DataModel> data) =>
// json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  final int id;
  final String title;
  final double price;
  final Category category;
  final String description;
  final String image;
  final Rating rating;
  DataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'category': categoryValues.reverse[category],
      'description': description,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      title: map['title'],
      price: map['price']?.toDouble(),
      category: categoryValues.map[map["category"]]!,
      description: map['description'],
      image: map['image'],
      rating: Rating.fromJson(map['rating']),
    );
  }

  String toJson() => json.encode(toMap());

  DataModel copyWith({
    int? id,
    String? title,
    double? price,
    Category? category,
    String? description,
    String? image,
    Rating? rating,
  }) {
    return DataModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  @override
  String toString() {
    return 'DataModel(id: $id, title: $title, price: $price, category: $category, description: $description, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.category == category &&
        other.description == description &&
        other.image == image &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        category.hashCode ^
        description.hashCode ^
        image.hashCode ^
        rating.hashCode;
  }
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING,
}

String mapCategoryToString(Category category) {
  switch (category) {
    case Category.ELECTRONICS:
      return 'electronics';
    case Category.JEWELERY:
      return 'jewelery';
    case Category.MEN_S_CLOTHING:
      return "men's clothing";
    case Category.WOMEN_S_CLOTHING:
      return "women's clothing";
  }
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
