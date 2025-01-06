

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
    ExpensesViewModel expensesViewModel = context.watch<ExpensesViewModel>();
    return Scaffold(
      appBar: const AppBarWidget(title: 'Categorias de Despesas'),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: expensesViewModel,
              builder: (context, child) {
                if(expensesViewModel.isLoading) {
                  return Center(child: const CircularProgressIndicator());
                }else{
                return ListView.builder(
                  itemCount: expensesViewModel.entries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(expensesViewModel.entries[index].categoryName),
                      trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
                        context.read<ExpensesViewModel>().deleteExpenseCategory(expensesViewModel.entries[index].id); 
                      },)
                    );
                  },
                );}
              },
            ),
          ),
          //
          // Consumer<ExpensesViewModel>(
          //   builder: (context, expensesViewModel, child) {
          //     return Expanded(
          //       child: ListView.builder(
          //         itemCount: expensesViewModel.entries.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(expensesViewModel.entries[index].categoryName),
          //             trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
          //               expensesViewModel.deleteExpenseCategory(expensesViewModel.entries[index].id); 
          //             },)
          //           );
          //         },
          //       ),
          //     );
          //   },
          // )
          //
          // Expanded(
          //   child: ListenableBuilder(
          //     listenable: expensesViewModel,
          //     builder: (context, child) {
          //       if(expensesViewModel.isLoading) {
          //         return Center(child: const CircularProgressIndicator());
          //       }else{
          //       return ListView.builder(
          //         itemCount: expensesViewModel.entries.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(expensesViewModel.entries[index].categoryName),
          //             trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
          //               expensesViewModel.deleteExpenseCategory(expensesViewModel.entries[index].id); 
          //             },)
          //           );
          //         },
          //       );}
          //     },
          //   ),
          // ),
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
