import 'package:casal_rico/domain/entities/totalizer_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiService{
  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final response = await Supabase.instance.client.from('Entries').select();
    return response;
  }
  Future<List<Map<String, dynamic>>> getEntryByParam(Map<String, dynamic> param) async {
    List<Map<String, dynamic>> response = [];

    var query = Supabase.instance.client.from('Entries').select();

    for (var key in param.keys) {
        query = query.eq(key, param[key]);
      }

    response = await query;
    

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
    await Supabase.instance.client.from('ExpenseCategories').update(expenseCategory).eq('id', expenseCategory['id']);
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




  Future<List<TotalizerEntity>> getTotalizerByParam(Map<String, dynamic> param) async {
    List<Map<String, dynamic>> response = [];
    List<TotalizerEntity> totalizers = [];
    var query = Supabase.instance.client.from('Totalizers').select();

    for (var key in param.keys) {
        query = query.eq(key, param[key]);
      }

    response = await query;

    for (var element in response) {
      totalizers.add(TotalizerEntity.fromMap(element));
    }

    return totalizers;
  }

 Future<void> addTotalizer(Map<String, dynamic> totalizer) async {
    await Supabase.instance.client.from('Totalizers').insert(totalizer);
  }

 Future<void> updateTotalizer(Map<String, dynamic> totalizer) async {
    await Supabase.instance.client.from('Totalizers').update(totalizer).eq('id', totalizer['id']);
  }

}
