import 'package:casal_rico/shared/widgets/entry_dialog.dart';
import 'package:casal_rico/ui/view_model/login_view_model.dart';
import 'package:casal_rico/shared/widgets/app_bar_widget.dart';
import 'package:casal_rico/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginViewModel loginViewModel = LoginViewModel();

  bool isFundamental = false;
  bool isExpense = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Resumo"),
      drawer: DrawerWidget(),
      floatingActionButton: IconButton(onPressed: (){
        showDialog(context: context, builder: (context) {
          return EntryDialog(titleController: titleController, amountController: amountController, isFundamental: isFundamental, isExpense: isExpense);
        });
      }, icon: Icon(Icons.add_box_outlined)),
    );
  }
}
