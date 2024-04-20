import 'package:flutter/material.dart';

import 'archiv_butt_desk.dart';
import 'archiv_table.dart';

class Archiv extends StatelessWidget {
  const Archiv({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ArchivButtDesk(),
        SizedBox(
          height: 10,
        ),
        ArchivTable()
      ],
    );
  }
}
