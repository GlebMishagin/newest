import 'package:flutter/material.dart';

import 'kp_clients_butt_desk.dart';
import 'kp_clients_table.dart';

class KpClients extends StatelessWidget {
  const KpClients({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KPCButtDesk(),
        SizedBox(
          height: 10,
        ),
        KPclientsTable(),
      ],
    );
  }
}
