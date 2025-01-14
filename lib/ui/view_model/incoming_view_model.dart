import 'package:casal_rico/ui/view_model/view_model.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/api/api_repository.dart';
import '../../domain/entities/income_category_entity.dart';

class IncomeViewModel extends ChangeNotifier implements ViewModel {
  final ApiRepository apiRepository;

  IncomeViewModel({required this.apiRepository});

  List<IncomeCategoryEntity> _entries = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<IncomeCategoryEntity> get entries => _entries;

  Future<void> getAllIncomeCategory() async {
    try {
      _isLoading = true;
      

      final data = await apiRepository.getAllIncomeCategory();
      _entries = data;
    } catch (e) {
      debugPrint('Error loading Income categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addIncomeCategory(Map<String, dynamic> incomeCategory) async {
    try {
      await apiRepository.addIncomeCategory(incomeCategory);
      final data = await apiRepository.getAllIncomeCategory();
      _entries = data;
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding Income category: $e');
    }
  }

  Future<void> deleteIncomeCategory(int id) async {
    try {
      _entries.removeWhere((entry) => entry.id == id); 
      await apiRepository.deleteIncomeCategory(id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting Income category: $e');
    }
  }

  Future<void> updateIncomeCategory(Map<String, dynamic> incomeCategory) async {
    try {
      await apiRepository.updateIncomeCategory(incomeCategory);
      final index = _entries.indexWhere((e) => e.id == incomeCategory['id']);
      if (index != -1) {
        _entries[index] = IncomeCategoryEntity.fromMap(incomeCategory);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating Income category: $e');
    }
  }
}

