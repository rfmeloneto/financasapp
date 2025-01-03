class ExpenseCategoryEntity {
  final String categoryName;
  final bool isFundamental;

  ExpenseCategoryEntity({required this.categoryName, required this.isFundamental});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'isFundamental': isFundamental
    };
  }

  factory ExpenseCategoryEntity.fromMap(Map<String, dynamic> map) {
    return ExpenseCategoryEntity(
      categoryName: map['categoryName'] ?? '',
      isFundamental: map['isFundamental'] ?? false
    );
  }
}