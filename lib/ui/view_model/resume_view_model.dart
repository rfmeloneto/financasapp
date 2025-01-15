import 'package:casal_rico/domain/entities/totalizer_entity.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/base_usecase.dart';

class ResumeViewModel extends ChangeNotifier{
  final BaseUseCase totalizerUseCase;

  ResumeViewModel({required this.totalizerUseCase});

    List<TotalizerEntity> _totalizers = [];
    bool _isLoading = false;

    List<TotalizerEntity> get totalizers => _totalizers;
    bool get isLoading => _isLoading;

    Future<void> getTotalizerByParam(Map<String, dynamic> param) async {
      try {
        _isLoading = true;
        notifyListeners();
        final data = await totalizerUseCase.getTotalizerByParam(param);
        _totalizers = data;
      } catch (e) {
        debugPrint('Error loading totalizers: $e');
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }

    Future<void> addTotalizer(Map<String, dynamic> totalizer) async {
      try {
        await totalizerUseCase.addTotalizer(totalizer);
        notifyListeners();
      } catch (e) {
        debugPrint('Error adding totalizer: $e');
      }
    }

    Future<void> updateTotalizer(Map<String, dynamic> totalizer) async {
      try {
        await totalizerUseCase.updateTotalizer(totalizer);
        notifyListeners();
      } catch (e) {
        debugPrint('Error updating totalizer: $e');
      }
    }


}