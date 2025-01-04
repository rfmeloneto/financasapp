import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/domain/entities/expense_category_entity.dart';
import 'package:flutter/material.dart';

class ExpensesViewModel extends ChangeNotifier {
  final ApiRepository apiRepository;

  ExpensesViewModel({required this.apiRepository});

  List<ExpenseCategoryEntity> _entries = [];

  List<ExpenseCategoryEntity> get entries => _entries;

  void getAllExpenseCategory() async {
    _entries = await apiRepository.getAllExpenseCategory();
    notifyListeners();
  }
  void addExpenseCategory(Map<String, dynamic> expenseCategory) async {
    apiRepository.addExpenseCategory(expenseCategory);
    getAllExpenseCategory();
    notifyListeners();
  }

  void updateExpenseCategory(Map<String, dynamic> expenseCategory) async {
    apiRepository.updateExpenseCategory(expenseCategory);
    getAllExpenseCategory();
    notifyListeners();
  }

  void deleteExpenseCategory(int id) async {
    apiRepository.deleteExpenseCategory(id);
    getAllExpenseCategory();
    notifyListeners();
  }

  

}