import 'package:casal_rico/domain/entities/entry_entity.dart';
import 'package:casal_rico/domain/entities/totalizer_entity.dart';

import '../../../domain/entities/expense_category_entity.dart';
import '../../../domain/entities/income_category_entity.dart';

abstract class ApiRepository {
  Future<List<EntryEntity>> getAllEntries();
  Future<List<EntryEntity>> getEntryByParam(Map<String, dynamic> param);
  Future<void> addEntry(Map<String, dynamic> entry);
  Future<void> updateEntry(Map<String, dynamic> entry);
  Future<void> deleteEntry(int id);


  Future<List<ExpenseCategoryEntity>> getAllExpenseCategory();
  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory);
  Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory);
  Future<void> deleteExpenseCategory(int id);

  
  Future<List<IncomeCategoryEntity>> getAllIncomeCategory();
  Future<void> addIncomeCategory(Map<String, dynamic> incomeCategory);
  Future<void> updateIncomeCategory(Map<String, dynamic> incomeCategory);
  Future<void> deleteIncomeCategory(int id);


  Future<List<TotalizerEntity>> getTotalizerByParam(Map<String, dynamic> param);
  Future<void> addTotalizer(Map<String, dynamic> totalizer);
  Future<void> updateTotalizer(Map<String, dynamic> totalizer);
}