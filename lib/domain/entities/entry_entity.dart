class EntryEntity {
  final int id;
  final String? incomeCategory;
  final String? expenseCategory;
  final bool isExpense;
  final String title;
  final String? description;
  final double amount;
  final DateTime date;

  EntryEntity({
    this.description,
    this.incomeCategory,
    this.expenseCategory,
    required this.id,
    required this.isExpense,
    required this.title,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isExpense': isExpense,
      'expenseCategory': expenseCategory,
      'incomeCategory': incomeCategory,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory EntryEntity.fromJson(Map<String, dynamic> json) {
    return EntryEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isExpense: json['isExpense'],
      expenseCategory: json['expenseCategory'],
      incomeCategory: json['incomeCategory'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }
}