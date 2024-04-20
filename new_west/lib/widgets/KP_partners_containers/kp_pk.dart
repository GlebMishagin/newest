import 'package:flutter/material.dart';

import 'kp_pk_buttons_desktop.dart';
import 'kp_pk_table.dart';

class KpPK extends StatelessWidget {
  const KpPK({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KpPkButtonsDesktop(),
        SizedBox(
          height: 10,
        ),
        KpPkTable(),
      ],
    );
  }
}
