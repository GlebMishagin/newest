import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/kp_pk_list.dart';

class KpPkTable extends StatefulWidget {
  const KpPkTable({super.key});

  @override
  State<KpPkTable> createState() => _KpPkTableState();
}

class _KpPkTableState extends State<KpPkTable> {
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
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  List<DataRow> buildDataRows() {
    return kpPKList.map((List<String> rowData) {
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
