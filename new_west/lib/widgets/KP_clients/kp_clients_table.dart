import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/kp_clients_list.dart';

class KPclientsTable extends StatefulWidget {
  const KPclientsTable({super.key});

  @override
  State<KPclientsTable> createState() => _KPclientsTableState();
}

class _KPclientsTableState extends State<KPclientsTable> {
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
                  columnSpacing: 90, // Расстояние между колонками
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
                      label: Text('Номер контейнера'),
                    ),
                    DataColumn(
                      label: Text('Фото'),
                    ),
                    DataColumn(
                      label: Text('YOM'),
                    ),
                    DataColumn(
                      label: Text('Тип'),
                    ),
                    DataColumn(
                      label: Text('Оценка'),
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
    return kpClientsList.map((List<String> rowData) {
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
