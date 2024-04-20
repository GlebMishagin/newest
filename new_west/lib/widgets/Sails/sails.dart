import 'package:flutter/material.dart';

import 'sails_butt_desk.dart';
import 'sails_table.dart';

class Sails extends StatelessWidget {
  const Sails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SailsButtDesk(),
        SizedBox(
          height: 10,
        ),
        SailsTable()
      ],
    );
  }
}
