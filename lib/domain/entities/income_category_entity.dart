class IncomeCategoryEntity {
  final String categoryName;

  IncomeCategoryEntity({required this.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
    };
  }

  factory IncomeCategoryEntity.fromMap(Map<String, dynamic> map) {
    return IncomeCategoryEntity(
      categoryName: map['categoryName'] ?? '',
    );
  }
}