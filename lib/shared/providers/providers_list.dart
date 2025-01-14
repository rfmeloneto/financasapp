import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/data/repositories/api/api_repository_imp.dart';
import 'package:casal_rico/data/services/api/api_service.dart';
import 'package:casal_rico/ui/view_model/expenses_view_model.dart';
import 'package:casal_rico/ui/view_model/incoming_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvidersList{
  static List<SingleChildWidget> providers = [
    Provider<ApiService>(create: (context) => ApiService()),
    Provider<ApiRepository>(create: (context) => ApiRepositoryImp(apiService: context.read<ApiService>())),
    ChangeNotifierProvider<ExpensesViewModel>(create: (context) => ExpensesViewModel(apiRepository: context.read<ApiRepository>())),
    ChangeNotifierProvider<IncomeViewModel>(create: (context) => IncomeViewModel(apiRepository: context.read<ApiRepository>())),
  ];
}