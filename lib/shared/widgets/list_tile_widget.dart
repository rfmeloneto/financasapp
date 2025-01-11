import 'package:flutter/material.dart';

import '../../ui/view_model/view_model.dart';

class ListTileWidget extends StatelessWidget {
  final VoidCallback callback;
  final ViewModel viewModel;
  final int index;

  const ListTileWidget({required this.viewModel, required this.index, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                      title: Text(viewModel.entries[index].categoryName),
                      trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => callback())
                    );
  }
}