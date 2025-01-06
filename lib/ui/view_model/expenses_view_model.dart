// import 'package:casal_rico/data/repositories/api/api_repository.dart';
// import 'package:casal_rico/domain/entities/expense_category_entity.dart';
// import 'package:flutter/material.dart';

// class ExpensesViewModel extends ChangeNotifier {
//   final ApiRepository apiRepository;

//   ExpensesViewModel({required this.apiRepository});

//   List<ExpenseCategoryEntity> _entries = [];
//   bool _isLoading = false;

//   bool get isLoading => _isLoading;

//   List<ExpenseCategoryEntity> get entries => _entries;

//   void getAllExpenseCategory() async {
    
//     try {
//       _isLoading = true;

//       _entries = await apiRepository.getAllExpenseCategory();
//       notifyListeners();
//     } catch (e) {
//       debugPrint('Erro ao carregar categorias de despesas: $e');
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void addExpenseCategory(Map<String, dynamic> expenseCategory) {
//     try {
//       apiRepository.addExpenseCategory(expenseCategory);
//       notifyListeners();
//       getAllExpenseCategory();
//       notifyListeners();
//     } catch (e) {
//       debugPrint('Erro ao adicionar categoria de despesas: $e');
//     }
//   }

//   Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory)async {
//     try {
//       apiRepository.updateExpenseCategory(expenseCategory);
//        _entries = await apiRepository.getAllExpenseCategory();
//       notifyListeners();
      
//     } catch (e) {
//       debugPrint('Erro ao atualizar categoria de despesas: $e');
//     }
//   }

//   void deleteExpenseCategory(int id) {
//     try {
//       apiRepository.deleteExpenseCategory(id);
//       notifyListeners();
//       getAllExpenseCategory();
//       notifyListeners();

//     } catch (e) {
//       debugPrint('Erro ao deletar categoria de despesas: $e');
//     }
//   }
// }


import 'package:flutter/material.dart';

import '../../data/repositories/api/api_repository.dart';
import '../../domain/entities/expense_category_entity.dart';

class ExpensesViewModel extends ChangeNotifier {
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
      notifyListeners(); // Notifica somente após carregar.
    }
  }

  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory) async {
    try {
      _entries.add(ExpenseCategoryEntity.fromMap(expenseCategory));
      await apiRepository.addExpenseCategory(expenseCategory);
      notifyListeners(); // Notifica que há uma nova entrada.
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
        _entries[index] = ExpenseCategoryEntity.fromMap(expenseCategory); // Atualiza localmente.
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating expense category: $e');
    }
  }
}

