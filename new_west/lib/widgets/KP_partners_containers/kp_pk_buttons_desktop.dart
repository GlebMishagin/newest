import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'kp_pk_win_butt_desk.dart';

class KpPkButtonsDesktop extends StatelessWidget {
  const KpPkButtonsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: CustomColor.color3),
              child: const Text(
                "Добавить папку",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const KpPkWinDesk();
                    });
              }),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: CustomColor.color3),
              child: const Text(
                "Редактировать",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return ;
                //     });
              }),
        ],
      ),
    );
  }
}
