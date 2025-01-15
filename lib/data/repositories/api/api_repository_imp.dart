import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/data/services/api/api_service.dart';
import 'package:casal_rico/domain/entities/entry_entity.dart';
import 'package:casal_rico/domain/entities/expense_category_entity.dart';
import 'package:casal_rico/domain/entities/income_category_entity.dart';
import 'package:casal_rico/domain/entities/totalizer_entity.dart';

class ApiRepositoryImp extends ApiRepository{
  final ApiService apiService;

  ApiRepositoryImp({required this.apiService});

  @override
  Future<List<EntryEntity>> getAllEntries() async {
    List<EntryEntity> result = []; 
    try{
      final response = await apiService.getAllEntries();
      for (var element in response) {
        result.add(EntryEntity.fromMap(element));
      }
      return result;
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<List<EntryEntity>> getEntryByParam(Map<String, dynamic> param) async {
    List<EntryEntity> result = [];
    try{
      final response = await apiService.getEntryByParam(param);
      for (var element in response) {
        result.add(EntryEntity.fromMap(element));
      }
      return result;
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> addEntry(Map<String, dynamic> entry) async {
    try{
      return await apiService.addEntry(entry);
    }catch(e){
      throw Exception(e);
    }
    
  }

  @override
  Future<void> updateEntry(Map<String, dynamic> entry) async {
    try{
      return await apiService.updateEntry(entry);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteEntry(int id) async{
    try{
      return await apiService.deleteEntry(id);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<List<ExpenseCategoryEntity>> getAllExpenseCategory() async {
  List<ExpenseCategoryEntity> result = [];

    try{
      final response = await apiService.getAllExpenseCategory();
      for (var element in response) {
        result.add(ExpenseCategoryEntity.fromMap(element));
      }
      return result;
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> addExpenseCategory(Map<String, dynamic> expenseCategory) async{
    try{
      await apiService.addExpenseCategory(expenseCategory);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> updateExpenseCategory(Map<String, dynamic> expenseCategory) async {
    try{
      await apiService.updateExpenseCategory(expenseCategory);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteExpenseCategory(int id) async{
    try{
     await apiService.deleteExpenseCategory(id);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<List<IncomeCategoryEntity>> getAllIncomeCategory() async {
    List<IncomeCategoryEntity> result = [];
    try{
      final response = await apiService.getAllIncomeCategory();
      for (var element in response) {
        result.add(IncomeCategoryEntity.fromMap(element));
      }
      return result;
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> addIncomeCategory(Map<String, dynamic> incomeCategory) async {
    try{
      return await apiService.addIncomeCategory(incomeCategory);  
    }catch(e){
      throw Exception(e);
    }
    
  }

  @override
  Future<void> updateIncomeCategory(Map<String, dynamic> incomeCategory) async {
    try{
      return await apiService.updateIncomeCategory(incomeCategory);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteIncomeCategory(int id) async {
    try{
      return await apiService.deleteIncomeCategory(id);
    }catch(e){
      throw Exception(e);
    }
  }


 @override
  Future<List<TotalizerEntity>> getTotalizerByParam(Map<String, dynamic> param) async {
    try{
      return await apiService.getTotalizerByParam(param);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> addTotalizer(Map<String, dynamic> totalizer) async {
    try{
      return await apiService.addTotalizer(totalizer);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTotalizer(Map<String, dynamic> totalizer) async {
    try{
      return await apiService.updateTotalizer(totalizer);
    }catch(e){
      throw Exception(e);
    }
  }
  
}