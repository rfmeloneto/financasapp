import 'package:casal_rico/domain/entities/entry_entity.dart';
import 'package:casal_rico/ui/view_model/entry_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntryDialog extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  bool isFundamental;
  bool isExpense;
  EntryDialog({ required this.titleController, required this.amountController, required this.isFundamental, required this.isExpense, super.key});

  @override
  State<EntryDialog> createState() => _EntryDialogState();
}

class _EntryDialogState extends State<EntryDialog> {
  DateTime? date;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
          return AlertDialog(
            title: Text("Entrada"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              spacing: 20.0,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Título"),
                  controller: widget.titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Valor"),
                  controller: widget.amountController,
                ),
                Row(
                  children: [
                    Text("Fundamental"),
                    Checkbox(value: widget.isFundamental, onChanged: (value) {
                      setState(() {
                        widget.isFundamental = !widget.isFundamental;
                      });
                    }),
                    Text("É Despesa"),
                    Builder(
                      builder: (context) {
                        return Checkbox(value: widget.isExpense, onChanged: (value) {
                          setState(() {
                            widget.isExpense = !widget.isExpense;
                          });
                        });
                      }
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Selecione a Data", icon: Icon(Icons.calendar_month)),
                  controller: dateController,
                  readOnly: true,
                  onTap: () async{
                    date = await _datePicker(context, date);
                    setState(() {
                      dateController.text = date != null ? "${date!.day}/${date!.month}/${date!.year}" : "Selecione a data";
                    });
                  },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(child: Text("Cancelar"),onPressed: () => Navigator.pop(context),),
                    ElevatedButton(child: Text("Adicionar"),onPressed: (){

                      Map<String, dynamic> entry = EntryEntity(isExpense: widget.isExpense, title: widget.titleController.text, amount: double.parse(widget.amountController.text), date: date!, isFundamental: widget.isFundamental).toMap();
                      context.read<EntryViewModel>().addEntry(entry);
                      Navigator.pop(context);
                    },)
                  ],)
              ],
              
            ),
          );
        }
  }

Future<DateTime?> _datePicker(BuildContext context , DateTime? initialDate) async {
  DateTime? selectedDate;
  selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),  
  );

  return selectedDate;
  
}