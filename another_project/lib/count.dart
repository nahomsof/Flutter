import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  final int count;
  final VoidCallback onCountSelected;
  final Function(int) onCountChange;
  Count(
      {required this.count,
      required this.onCountSelected,
      required void Function() oncountSelected,
      required this.onCountChange});

  get floatingActionButton => null;
  @override
  Widget build(BuildContext contet) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => onCountChange(1),
        ),,
        FloatingActionButton(onPressed: onPressed)(
          child: Text("$count"),
          onPressed: () => onCountSelected(),
        )
      ],
    );
  }
}
