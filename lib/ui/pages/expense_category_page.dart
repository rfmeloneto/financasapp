// import 'package:casal_rico/ui/injections/get_injection.dart';
// import 'package:flutter/material.dart';

// import '../view_model/expenses_view_model.dart';

// class ExpenseCategoryPage extends StatefulWidget {
//   const ExpenseCategoryPage({super.key});

//   @override
//   State<ExpenseCategoryPage> createState() => _ExpenseCategoryPageState();
// }

// class _ExpenseCategoryPageState extends State<ExpenseCategoryPage> {
//   ExpensesViewModel expensesViewModel = ExpenseCategoryInjection.instance;
//   TextEditingController categoryNameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categorias de Despesas', style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.deepPurple[500],
//       ),

//       body: Expanded(
//         child: Column(
//           children: [
//             ListenableBuilder(listenable: expensesViewModel,
//              builder: (context, child) {
//               return ListView.builder(
//                 itemCount: expensesViewModel.entries.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(expensesViewModel.entries[index].categoryName),
//                     trailing: Checkbox(value: expensesViewModel.entries[index].isFundamental ?? false , onChanged:
//                       (value) {
//                           expensesViewModel.entries[index].isFundamental = value!;
//                           expensesViewModel.updateExpenseCategory(expensesViewModel.entries[index].toMap());
//                       }
//                     ),
//                   );
//                 },
//               );
//              },
//             ),
//             ElevatedButton(child: const Text('Nova Categoria'),onPressed: () {
//               expensesViewModel.addExpenseCategory({'categoryName': categoryNameController.text, 'isFundamental': false});
//               categoryNameController.clear();
//               Navigator.pop(context);
//             },)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:casal_rico/ui/injections/get_injection.dart';
import 'package:flutter/material.dart';

import '../view_model/expenses_view_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';

class ExpenseCategoryPage extends StatefulWidget {
  const ExpenseCategoryPage({super.key});

  @override
  State<ExpenseCategoryPage> createState() => _ExpenseCategoryPageState();
}

class _ExpenseCategoryPageState extends State<ExpenseCategoryPage> {
  ExpensesViewModel expensesViewModel = ExpenseCategoryInjection.instance;
  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    expensesViewModel.getAllExpenseCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Categorias de Despesas'),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: expensesViewModel,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: expensesViewModel.entries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(expensesViewModel.entries[index].categoryName),
                      trailing: Checkbox(
                        value: expensesViewModel.entries[index].isFundamental ?? false,
                        onChanged: (value) {
                          expensesViewModel.entries[index].isFundamental = !expensesViewModel.entries[index].isFundamental!;
                          expensesViewModel.updateExpenseCategory(expensesViewModel.entries[index].toMap());
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: categoryNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nova Categoria',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: const Text('Adicionar'),
                  onPressed: () {
                    expensesViewModel.addExpenseCategory({
                      'categoryName': categoryNameController.text,
                      'isFundamental': false,
                    });
                    categoryNameController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
