import 'package:flutter/material.dart';

import 'perevoz_butt_desk.dart';
import 'perevoz_table.dart';

class Perevozki extends StatefulWidget {
  const Perevozki({super.key});

  @override
  State<Perevozki> createState() => _PerevozkiState();
}

class _PerevozkiState extends State<Perevozki> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PerevozButtDesk(),
        SizedBox(
          height: 10,
        ),
        PerevozTable()
      ],
    );
  }
}
