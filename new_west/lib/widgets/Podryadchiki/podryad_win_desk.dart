import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/podryadchik.dart';

class PodryadWinDesk extends StatefulWidget {
  const PodryadWinDesk({super.key});

  @override
  State<PodryadWinDesk> createState() => _PodryadWinDeskState();
}

class _PodryadWinDeskState extends State<PodryadWinDesk> {
  final TextEditingController nameAgent = TextEditingController();
  final TextEditingController innAgent = TextEditingController();
  final TextEditingController docs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 700,
      height: 395,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColor.color2,
      ),
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Добавление подрядчика",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Имя контрагента'),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: nameAgent,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: CustomColor.color2, width: 2))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('ИНН'),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: innAgent,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: CustomColor.color2, width: 2))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Загрузить сопроводительные документы'),
                TextButton(
                  onPressed: () {},
                  child: const Text("Загрузить документ"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.color1,
                    ),
                    onPressed: () {
                      if (nameAgent.text.isNotEmpty &&
                          innAgent.text.isNotEmpty) {
                        List<String> podrayd = [
                          (podryadList.length + 1).toString(),
                          nameAgent.text,
                          innAgent.text,
                          'документ'
                        ];
                        podryadList.add(podrayd);
                        Navigator.of(context).pop();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Предупреждение'),
                              content: const Text(
                                  'Заполните все поля перед продолжением.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Добавить'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
