class ExpenseCategoryEntity {
  final String categoryName;

  ExpenseCategoryEntity({required this.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
    };
  }

  factory ExpenseCategoryEntity.fromMap(Map<String, dynamic> map) {
    return ExpenseCategoryEntity(
      categoryName: map['categoryName'] ?? '',
    );
  }
}