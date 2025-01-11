

import 'package:casal_rico/shared/widgets/list_tile_widget.dart';
import 'package:casal_rico/ui/injections/get_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/dialog_widget.dart';
import '../view_model/expenses_view_model.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/drawer_widget.dart';

class ExpenseCategoryPage extends StatefulWidget {
  const ExpenseCategoryPage({super.key});

  @override
  State<ExpenseCategoryPage> createState() => _ExpenseCategoryPageState();
}

class _ExpenseCategoryPageState extends State<ExpenseCategoryPage> {
  // ExpensesViewModel expensesViewModel = ExpenseCategoryInjection.instance;
  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ExpensesViewModel>().getAllExpenseCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Categorias de Despesas'),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Consumer<ExpensesViewModel>(
            builder: (context, expensesViewModel, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: expensesViewModel.entries.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(viewModel: expensesViewModel, index: index, callback: () {
                      expensesViewModel.deleteExpenseCategory(expensesViewModel.entries[index].id!);
                    });
                  },
                ),
              );
            },
          )
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogWidget(
                title: 'Adicionar Categoria',
                callback: () {
                  context.read<ExpensesViewModel>().addExpenseCategory({
                    'categoryName': categoryNameController.text,
                  });
                },
                controller: categoryNameController,
                
              );
            },
          );
        },
      ),
    );
  }
}
