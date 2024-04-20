import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/sails_list.dart';

class SailsTable extends StatefulWidget {
  const SailsTable({super.key});

  @override
  State<SailsTable> createState() => _SailsTableState();
}

class _SailsTableState extends State<SailsTable> {
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
                      label: Text('Клиент'),
                    ),
                    DataColumn(
                      label: Text('Дата сделки'),
                    ),
                    DataColumn(
                      label: Text('Статус сделки'),
                    ),
                    DataColumn(
                      label: Text('Стоимость продажи'),
                    ),
                    DataColumn(
                      label: Text('Маржа по сделке'),
                    ),
                    DataColumn(
                      label: Text('Вид расчета'),
                    ),
                    DataColumn(
                      label: Text('НДС'),
                    ),
                    DataColumn(
                      label: Text('Количество КТК'),
                    ),
                    DataColumn(
                      label: Text('Город'),
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
    return sailsList.map((List<String> rowData) {
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
