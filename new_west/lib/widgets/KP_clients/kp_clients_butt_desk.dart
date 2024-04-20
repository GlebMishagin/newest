import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KPCButtDesk extends StatelessWidget {
  const KPCButtDesk({super.key});

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
