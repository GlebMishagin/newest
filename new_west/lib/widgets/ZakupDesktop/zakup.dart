import 'package:flutter/material.dart';

import '../../constants/lists/bought_container.dart';
import 'buttons_buy_desktop.dart';
import 'buy_table.dart';

class Zakup extends StatefulWidget {
  const Zakup({super.key});

  @override
  State<Zakup> createState() => _ZakupState();
}

class _ZakupState extends State<Zakup> {
  bool isEditingEnabled = false;

  void toggleEditing() {
    setState(() {
      isEditingEnabled = !isEditingEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsBuyDesktop(onEditPressed: toggleEditing),
        const SizedBox(
          height: 10,
        ),
        BuyTable(
          isEditingEnabled: isEditingEnabled,
          onDataChanged: ((newData) {
            setState(() {
              nestedList = newData;
            });
          }),
        ),
      ],
    );
  }
}
