import 'package:casal_rico/domain/usecases/entry_use_case.dart';
import 'package:casal_rico/domain/usecases/totalizer_use_case.dart';
import 'package:flutter/material.dart';

class EntryViewModel  extends ChangeNotifier{
  final TotalizerUseCase totalizerUseCase;
  final EntryUseCase entryUseCase;

  EntryViewModel({required this.totalizerUseCase, required this.entryUseCase});

  bool _isLoading= false;

  bool get isLoading => _isLoading;

  Future<void> addEntry(Map<String, dynamic> entry) async {
    _isLoading = true;
    notifyListeners();
    await entryUseCase.addEntry(entry);
    _isLoading = false;
    notifyListeners();
  }

}