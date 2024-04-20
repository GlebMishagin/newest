import 'package:flutter/material.dart';

import 'svod_buttons_desktop.dart';
import 'svod_table.dart';

class Svod extends StatelessWidget {
  const Svod({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SvodButtDesk(),
        SizedBox(
          height: 10,
        ),
        SvodTable(),
      ],
    );
  }
}
