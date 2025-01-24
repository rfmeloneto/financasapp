import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/domain/entities/totalizer_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TotalizerUseCase {

  final ApiRepository apiRepository;

  TotalizerUseCase(this.apiRepository);

  Future<List<TotalizerEntity>> getTotalizerByParam(Map<String, dynamic> param) async {
    try{
      return await apiRepository.getTotalizerByParam(param);
    }catch(e){
      throw Exception(e);
    }
  }


  Future<void> addTotalizer(Map<String, dynamic> totalizer) async {
    await Supabase.instance.client.from('Totalizer').insert(totalizer);
  }


  Future<void> updateTotalizer(Map<String, dynamic> totalizer) async {

    List<Map<String, dynamic>> response = [];
    double newAmount;

    response = await Supabase.instance.client.from('Totalizer').select().eq('id', totalizer['id']);

    if (response.isEmpty) {
      apiRepository.addTotalizer(totalizer);
    }
    else{
      newAmount = response[0]['amount'] + totalizer['amount'];
      totalizer['amount'] = newAmount;
      apiRepository.updateTotalizer(totalizer);
    }

  }

  Future<void> subtractTotalizerByEntryAmount({required Map<String, dynamic> totalizer, required int amount}) async {
     final newamount = totalizer['amount'] - amount;
     totalizer['amount'] = newamount;
     apiRepository.updateTotalizer(totalizer);
  }

}