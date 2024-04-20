import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/archiv_list.dart';
import '../../constants/lists/svod_list.dart';

class ArchivWinDesk extends StatefulWidget {
  const ArchivWinDesk({super.key});

  @override
  State<ArchivWinDesk> createState() => _ArchivWinDeskState();
}

class _ArchivWinDeskState extends State<ArchivWinDesk> {
  String? selectedContainer;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        height: 200,
        child: Column(
          children: [
            const Center(
              child: Text(
                "Вернуть контейнер",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Text("Выберите контейнер"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: CustomColor.color2,
                      width: 1,
                    ),
                  ),
                ),
                child: DropdownButton<String>(
                  hint: const Text('Выберите контейнер'),
                  value: selectedContainer, // Устанавливаем выбранное значение
                  onChanged: (newValue) {
                    setState(() {
                      selectedContainer = newValue;
                    });
                  },
                  items: archivList
                      .map((row) => DropdownMenuItem<String>(
                            value: row[5], // Используем шестой элемент строки
                            child: Text(row[
                                5]), // Используем шестой элемент строки для отображения
                          ))
                      .toList(),
                  underline: const SizedBox(),
                ),
              ),
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
                  if (selectedContainer != null) {
                    // Найти индекс строки с выбранным контейнером в archivList
                    int indexToRemove = archivList
                        .indexWhere((row) => row.contains(selectedContainer));

                    if (indexToRemove != -1) {
                      List<String> removedRow =
                          List.from(archivList[indexToRemove]);
                      if (removedRow.length >= 2) {
                        for (int i = removedRow.length - 2;
                            i < removedRow.length;
                            i++) {
                          removedRow[i] = '';
                        }
                      }
                      removedRow.add('');
                      svodList.add(removedRow);
                      // Удаляем строку из archivList
                      archivList.removeAt(indexToRemove);
                    }
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Вернуть'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
