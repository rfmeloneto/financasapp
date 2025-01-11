import 'package:casal_rico/ui/view_model/expenses_view_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/expense_category_entity.dart';

abstract interface class States<T>{
  List<T> loadedState();
  Widget loadingState();
  Widget errorState();
  Widget initState();
}

class ExpenseStates implements States{
  final ExpensesViewModel expensesViewModel;
  ExpenseStates(this.expensesViewModel);

  @override
  Widget initState() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget loadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  List<ExpenseCategoryEntity> loadedState() {
    return expensesViewModel.entries;
  }

  @override
  Widget errorState() {
    return const Center(child: Text("Error"));
  }

  
}