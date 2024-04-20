import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'terminals_win_desk.dart';

class TerminalButtDesk extends StatelessWidget {
  const TerminalButtDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: CustomColor.color3),
            child: const Text(
              "Редактирование",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: CustomColor.color3),
              child: const Text(
                "Добавить терминал",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const TerminalsWinDesk();
                    });
              }),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: CustomColor.color3),
            child: const Text(
              "Выгрузка Excel",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
