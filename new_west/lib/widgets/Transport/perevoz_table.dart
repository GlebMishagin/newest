import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/perevozlist.dart';

class PerevozTable extends StatefulWidget {
  const PerevozTable({super.key});

  @override
  State<PerevozTable> createState() => _PerevozTableState();
}

class _PerevozTableState extends State<PerevozTable> {
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
                      label: Text('Подрядчик'),
                    ),
                    DataColumn(
                      label: Text('Дата подписания сделки'),
                    ),
                    DataColumn(
                      label: Text('Количество контейнеров'),
                    ),
                    DataColumn(
                      label: Text('Город А'),
                    ),
                    DataColumn(
                      label: Text('Терминал(ы) в городе А'),
                    ),
                    DataColumn(
                      label: Text('Сток в терминале города А'),
                    ),
                    DataColumn(
                      label: Text('Город Б'),
                    ),
                    DataColumn(
                      label: Text('Терминал(ы) в городе Б'),
                    ),
                    DataColumn(
                      label: Text('Сток в терминале города Б'),
                    ),
                    DataColumn(
                      label: Text('Цена (+ или -)'),
                    ),
                    DataColumn(
                      label: Text('Статус оплаты'),
                    ),
                    DataColumn(
                      label: Text('Ответственный менеджер'),
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
    return perevozList.map((List<String> rowData) {
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
