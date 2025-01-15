import 'package:casal_rico/domain/entities/totalizer_entity.dart';

abstract class BaseUseCase<T>{
  Future<List<TotalizerEntity>> getTotalizerByParam(Map<String, dynamic> param);
  Future<void> addTotalizer(Map<String, dynamic> totalizer);
  Future<void> updateTotalizer(Map<String, dynamic> totalizer);
}