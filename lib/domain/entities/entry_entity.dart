class EntryEntity {
  final int id;
  final String? incomeCategory;
  final String? expenseCategory;
  final bool isExpense;
  final String title;
  final double amount;
  final DateTime date;
  late int year;
  late int month;
  final bool isFundamental;

  EntryEntity({
    this.incomeCategory,
    this.expenseCategory,
    required this.id,
    required this.isExpense,
    required this.title,
    required this.amount,
    required this.date,
    required this.isFundamental
  }){
    year = date.year;
    month = date.month;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isExpense': isExpense,
      'expenseCategory': expenseCategory,
      'incomeCategory': incomeCategory,
      'amount': amount,
      'date': date.toIso8601String(),
      'year': year,
      'month': month,
      'isFundamental':isFundamental,
    };
  }

  factory EntryEntity.fromMap(Map<String, dynamic> json) {
    return EntryEntity(
      id: json['id'],
      title: json['title'],
      isExpense: json['isExpense'],
      expenseCategory: json['expenseCategory'],
      incomeCategory: json['incomeCategory'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      isFundamental: json['isFundamental'],
    );
  }
}