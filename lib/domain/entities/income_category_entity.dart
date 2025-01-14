class IncomeCategoryEntity {
  final int? id;
  final String categoryName;

  IncomeCategoryEntity({ this.id,required this.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
    };
  }

  factory IncomeCategoryEntity.fromMap(Map<String, dynamic> map) {
    return IncomeCategoryEntity(
      id: map['id'],
      categoryName: map['categoryName'] ?? '',
    );
  }
}