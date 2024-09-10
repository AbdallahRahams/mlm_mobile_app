import 'package:flutter/material.dart';

class BottomAppBarWithActions extends StatelessWidget {
  final List<Widget> actions;

  BottomAppBarWithActions({required this.actions});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions,
      ),
    );
  }
}
