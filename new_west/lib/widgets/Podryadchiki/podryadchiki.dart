import 'package:flutter/material.dart';

import 'podryad_table.dart';
import 'podryadchiki_butt_desk.dart';

class Podryadchiki extends StatelessWidget {
  const Podryadchiki({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PodrButtDesk(),
        SizedBox(
          height: 10,
        ),
        PodryadTable()
      ],
    );
  }
}
