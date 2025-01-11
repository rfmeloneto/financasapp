import 'package:casal_rico/ui/view_model/view_model.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/api/api_repository.dart';
import '../../domain/entities/expense_category_entity.dart';

class ExpensesViewModel extends ChangeNotifier implements ViewModel {
  final ApiRepository apiRepository;

  ExpensesViewModel({required this.apiRepository});

  List<ExpenseCategoryEntity> _entries = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ExpenseCategoryEntity> get entries => _entries;

  Future<void> getAllExpenseCategory() async {
    try {
      _isLoading = true;
      

      final data = await apiRepository.getAllExpenseCategory();
      _entries = data;
    } catch (e) {
      debugPrint('Error loading expense categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory) async {
    try {
      await apiRepository.addExpenseCategory(expenseCategory);
      final data = await apiRepository.getAllExpenseCategory();
      _entries = data;
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding expense category: $e');
    }
  }

  Future<void> deleteExpenseCategory(int id) async {
    try {
      _entries.removeWhere((entry) => entry.id == id); 
      await apiRepository.deleteExpenseCategory(id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting expense category: $e');
    }
  }

  Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory) async {
    try {
      await apiRepository.updateExpenseCategory(expenseCategory);
      final index = _entries.indexWhere((e) => e.id == expenseCategory['id']);
      if (index != -1) {
        _entries[index] = ExpenseCategoryEntity.fromMap(expenseCategory);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating expense category: $e');
    }
  }
}

