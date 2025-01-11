abstract interface class ViewModel<T> {
  List<T> _entries = [];

  List<T> get entries => _entries;
}