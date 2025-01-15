class TotalizerEntity {
  final int id;
  final bool isExpense;
  final double amount;
  final int year;
  final int month;

  TotalizerEntity({
    required this.id,
    required this.isExpense,
    required this.amount,
    required this.year,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isExpense': isExpense,
      'amount': amount,
      'year': year,
      'month': month,
    };
  }

  factory TotalizerEntity.fromMap(Map<String, dynamic> map) {
    return TotalizerEntity(
      id: map['id'],
      isExpense: map['isExpense'],
      amount: map['amount'],
      year: map['year'],
      month: map['month'],
    );
  }
}