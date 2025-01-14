import 'package:casal_rico/shared/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/dialog_widget.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/drawer_widget.dart';
import '../view_model/incoming_view_model.dart';

class IncomeCategoryPage extends StatefulWidget {
  const IncomeCategoryPage({super.key});

  @override
  State<IncomeCategoryPage> createState() => _IncomeCategoryPageState();
}

class _IncomeCategoryPageState extends State<IncomeCategoryPage> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<IncomeViewModel>().getAllIncomeCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Categorias de Despesas'),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Consumer<IncomeViewModel>(
            builder: (context, incomesViewModel, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: incomesViewModel.entries.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(viewModel: incomesViewModel, index: index, callback: () {
                      incomesViewModel.deleteIncomeCategory(incomesViewModel.entries[index].id!);
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
                  context.read<IncomeViewModel>().addIncomeCategory({
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
