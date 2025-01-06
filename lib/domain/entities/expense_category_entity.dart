class ExpenseCategoryEntity {
  final int id;
  final String categoryName;
  

  ExpenseCategoryEntity({required this.id, required this.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
    };
  }

  factory ExpenseCategoryEntity.fromMap(Map<String, dynamic> map) {
    return ExpenseCategoryEntity(
      id: map['id'],
      categoryName: map['categoryName'] ?? '',
    );
  }
}