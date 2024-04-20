import 'package:flutter/material.dart';

import 'repair_buttons_desktop.dart';
import 'repair_table.dart';

class Repair extends StatelessWidget {
  const Repair({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RepairButtonsDesktop(),
        SizedBox(
          height: 10,
        ),
        RepairTable()
      ],
    );
  }
}
