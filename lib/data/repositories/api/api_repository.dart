import 'package:casal_rico/domain/entities/entry_entity.dart';

import '../../../domain/entities/expense_category_entity.dart';
import '../../../domain/entities/income_category_entity.dart';

abstract class ApiRepository {
  Future<List<EntryEntity>> getAllEntries();
  Future<List<EntryEntity>> getEntryByMonthYear(int? month, int? year);
  void addEntry(Map<String, dynamic> entry);
  void updateEntry(Map<String, dynamic> entry);
  void deleteEntry(int id);


  Future<List<ExpenseCategoryEntity>> getAllExpenseCategory();
  // List<ExpenseCategoryEntity> getAllExpenseCategory();
  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory);
  Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory);
  Future<void> deleteExpenseCategory(int id);

  
  Future<List<IncomeCategoryEntity>> getAllIncomeCategory();
  void addIncomeCategory(Map<String, dynamic> incomeCategory);
  void updateIncomeCategory(Map<String, dynamic> incomeCategory);
  void deleteIncomeCategory(int id);
}