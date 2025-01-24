import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/domain/entities/entry_entity.dart';
import 'package:casal_rico/domain/entities/totalizer_entity.dart';
import 'package:casal_rico/domain/usecases/totalizer_use_case.dart';

class EntryUseCase {
  final ApiRepository apiRepository;
  final TotalizerUseCase totalizerUseCase;
  EntryUseCase({required this.apiRepository, required this.totalizerUseCase});

  Future<List<EntryEntity>> getAllEntries() async {
    try{
      return await apiRepository.getAllEntries();
    }catch(e){
      throw Exception(e);
    }
  }
  Future<List<EntryEntity>> getEntryByParam(Map<String, dynamic> param) async {
    try{
      return await apiRepository.getEntryByParam(param);
    }catch(e){
      throw Exception(e);
    }
  }
  Future<void> addEntry(Map<String, dynamic> entry) async {
    try{
      await apiRepository.addEntry(entry);
      List<TotalizerEntity> totalizer = await totalizerUseCase.getTotalizerByParam({'year': entry['year'], 'month': entry['month']});
      if (totalizer.isEmpty) {
        totalizerUseCase.addTotalizer({
          'isExpense': entry['isExpense'],
          'amount': entry['amount'],
          'year': entry['year'],
          'month': entry['month'],
        });
      }
      Map<String,dynamic> totalizerMap = totalizer[0].toMap();
      totalizerUseCase.updateTotalizer(totalizerMap);  
    }catch(e){
      throw Exception(e);
    }

  }
  Future<void> updateEntry(Map<String, dynamic> entry) async {
    try{
      await apiRepository.updateEntry(entry);
      totalizerUseCase.updateTotalizer(entry);
    }catch(e){
      throw Exception(e);
    }
  }
  Future<void> deleteEntry({required int id, required int amount, required Map<String, dynamic> totalizer}) async {
    try{
      await apiRepository.deleteEntry(id);
      totalizerUseCase.subtractTotalizerByEntryAmount(totalizer: totalizer, amount: amount);
    }catch(e){
      throw Exception(e);
    }
  }
}