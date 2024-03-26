import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  final int count;
  final VoidCallback onCountSelected;
  final Function(int) onCountChange;
  Count(
      {required this.count,
      required this.onCountSelected,
      required void Function() oncountSelected, required this.onCountChange});
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[IconButton(),FlatButton(child: Text("$count"),onPressed:() => onCountSelected(),)],)
  }
}
