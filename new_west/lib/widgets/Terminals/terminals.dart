import 'package:flutter/material.dart';

import 'terminals_butt_desk.dart';
import 'terminals_table.dart';

class Terminals extends StatelessWidget {
  const Terminals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TerminalButtDesk(),
        SizedBox(
          height: 10,
        ),
        TerminalsTable()
      ],
    );
  }
}
