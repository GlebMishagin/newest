import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/terminalList.dart';

class TerminalsTable extends StatefulWidget {
  const TerminalsTable({super.key});

  @override
  State<TerminalsTable> createState() => _TerminalsTableState();
}

class _TerminalsTableState extends State<TerminalsTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 122,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: CustomColor.color3,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          //buttons
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.color1,
              ),
              onPressed: () {
                setState(() {});
              },
              child: const Text(
                '♻️',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 25, // Расстояние между колонками
                  dataRowColor: MaterialStateProperty.all(CustomColor.color2),
                  columns: const [
                    DataColumn(
                      label: Text('№'),
                    ),
                    DataColumn(
                      label: Text('Страна'),
                    ),
                    DataColumn(
                      label: Text('Город'),
                    ),
                    DataColumn(
                      label: Text('Терминал'),
                    ),
                    DataColumn(
                      label: Text('Сток'),
                    ),
                    DataColumn(
                      label: Text('Адрес'),
                    ),
                    DataColumn(
                      label: Text('Контактная почта'),
                    ),
                    DataColumn(
                      label: Text('Контактный номер'),
                    ),
                    DataColumn(
                      label: Text('Часы работы'),
                    ),
                    DataColumn(
                      label: Text('Механика выдачи'),
                    ),
                    DataColumn(
                      label: Text('ПРР 20DC'),
                    ),
                    DataColumn(
                      label: Text('ПРР 40HC'),
                    ),
                    DataColumn(
                      label: Text('Хранение 20DC (руб/сутки)'),
                    ),
                    DataColumn(
                      label: Text('Хранение 40HC (руб/сутки)'),
                    ),
                    DataColumn(
                      label: Text('Фото'),
                    ),
                    DataColumn(
                      label: Text('Аккаунты'),
                    ),
                  ],
                  rows: buildDataRows(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  List<DataRow> buildDataRows() {
    return terminalList.map((List<String> rowData) {
      return DataRow(
        cells: rowData.map((String cellData) {
          return DataCell(Center(
            child: Text(cellData),
          ));
        }).toList(),
      );
    }).toList();
  }
}
