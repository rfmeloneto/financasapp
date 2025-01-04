import 'package:supabase_flutter/supabase_flutter.dart';

class ApiService{
  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final response = await Supabase.instance.client.from('Entries').select();
    return response;
  }
  Future<List<Map<String, dynamic>>> getEntryByMonthYear(int? month, int? year) async {
    List<Map<String, dynamic>> response = [];
    if(month == null){
      response = await Supabase.instance.client.from('Entries').select().eq('year', year!);
    }
    else if (year == null){
      response = await Supabase.instance.client.from('Entries').select().eq('month', month);
    }
    else{
      response = await Supabase.instance.client.from('Entries').select().eq('month', month).eq('year', year);
      }
   
    return response;
  }

  Future<void> addEntry(Map<String, dynamic> entry) async {
    await Supabase.instance.client.from('Entries').insert(entry);
  }

  Future<void> updateEntry(Map<String, dynamic> entry) async {
    await Supabase.instance.client.from('Entries').update(entry).eq('id', entry['id']);
  }

  Future<void> deleteEntry(int id) async {
    await Supabase.instance.client.from('Entries').delete().eq('id', id);
  }

  Future<List<Map<String, dynamic>>> getAllExpenseCategory() async {
    final response = await Supabase.instance.client.from('ExpenseCategories').select();
    return response;
  }

  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory) async {
    await Supabase.instance.client.from('ExpenseCategories').insert(expenseCategory);
  }

  Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory) async {
    await Supabase.instance.client.from('ExpenseCategories').update(expenseCategory).eq('categoryName', expenseCategory['categoryName']);
  }

  Future<void> deleteExpenseCategory(int id) async {
    await Supabase.instance.client.from('ExpenseCategories').delete().eq('id', id);
  }

  Future<List<Map<String, dynamic>>> getAllIncomeCategory() async {
    final response = await Supabase.instance.client.from('IncomeCategories').select();
    return response;
  }

  Future<void> addIncomeCategory(Map<String, dynamic> incomeCategory) async {
    await Supabase.instance.client.from('IncomeCategories').insert(incomeCategory);
  }

  Future<void> updateIncomeCategory(Map<String, dynamic> incomeCategory) async {
    await Supabase.instance.client.from('IncomeCategories').update(incomeCategory).eq('id', incomeCategory['id']);
  }

  Future<void> deleteIncomeCategory(int id) async {
    await Supabase.instance.client.from('IncomeCategories').delete().eq('id', id);
  }


}