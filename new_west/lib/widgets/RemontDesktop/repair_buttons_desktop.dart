import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'repair_window_desk.dart';

class RepairButtonsDesktop extends StatelessWidget {
  const RepairButtonsDesktop({super.key});

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
                "Добавить контейнер",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return RepairWinDesk();
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
