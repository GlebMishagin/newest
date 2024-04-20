import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/remont_list.dart';

class RepairTable extends StatefulWidget {
  const RepairTable({super.key});

  @override
  State<RepairTable> createState() => _RepairTableState();
}

class _RepairTableState extends State<RepairTable> {
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
                  columnSpacing: 69, // Расстояние между колонками
                  dataRowColor: MaterialStateProperty.all(CustomColor.color2),
                  columns: const [
                    DataColumn(
                      label: Text('№'),
                    ),
                    DataColumn(
                      label: Text('Номер контейнера'),
                    ),
                    DataColumn(
                      label: Text('Город'),
                    ),
                    DataColumn(
                      label: Text('Терминал'),
                    ),
                    DataColumn(
                      label: Text('Тип'),
                    ),
                    DataColumn(
                      label: Text('Фото'),
                    ),
                    DataColumn(
                      label: Text('Состояние'),
                    ),
                    DataColumn(
                      label: Text('Оказанный ремонт'),
                    ),
                    DataColumn(
                      label: Text('Фото после ремонта'),
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
    return remontList.map((List<String> rowData) {
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
