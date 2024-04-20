import 'package:flutter/material.dart';
import '../../constants/lists/bought_container.dart';
import '../../constants/colors.dart';

class BuyTable extends StatefulWidget {
  const BuyTable(
      {super.key, required this.isEditingEnabled, required this.onDataChanged});
  final bool isEditingEnabled;
  final Function(List<List<dynamic>> newData) onDataChanged;

  @override
  State<BuyTable> createState() => _BuyTableState();
}

class _BuyTableState extends State<BuyTable> {
  void redrawWidget() {
    setState(() {});
  }

  List<List<dynamic>> data = nestedList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 122,
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
              onPressed: widget.isEditingEnabled ? () => setState(() {}) : null,
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
                  columnSpacing: 20, // Расстояние между колонками
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
                      label: Text('Номер контейнера'),
                    ),
                    DataColumn(
                      label: Text('Тип'),
                    ),
                    DataColumn(
                      label: Text('Фото'),
                    ),
                    DataColumn(
                      label: Text('YOM'),
                    ),
                    DataColumn(
                      label: Text('Состояние'),
                    ),
                    DataColumn(
                      label: Text('Вид расчета'),
                    ),
                    DataColumn(
                      label: Text('Цена закупа'),
                    ),
                    DataColumn(
                      label: Text('НДС'),
                    ),
                    DataColumn(
                      label: Text('ГТД'),
                    ),
                    DataColumn(
                      label: Text('Подрядчик'),
                    ),
                    DataColumn(
                      label: Text('Дата поступления'),
                    ),
                    DataColumn(
                      label: Text('Статус оплаты'),
                    ),
                    DataColumn(
                      label: Text('Терминальное хранение'),
                    ),
                    DataColumn(
                      label: Text('Ремонт'),
                    ),
                    DataColumn(
                      label: Text('ПРР'),
                    ),
                    DataColumn(
                      label: Text('Издрежки'),
                    ),
                    DataColumn(
                      label: Text('Комментарий'),
                    ),
                    DataColumn(
                      label: Text('Ответственный менеджер'),
                    ),
                  ],
                  rows: List.generate(
                    data.length,
                    (index) {
                      final row = data[index];
                      return DataRow(
                        cells: List.generate(
                          row.length,
                          (cellIndex) {
                            // Здесь вы можете определить редактируемый виджет для ячеек
                            return DataCell(
                              widget.isEditingEnabled
                                  ? TextField(
                                      controller: TextEditingController(
                                          text: row[cellIndex].toString()),
                                      onChanged: (value) {
                                        setState(() {
                                          // При изменении значения в TextField обновите данные в списке
                                          data[index][cellIndex] = value;
                                          widget.onDataChanged(
                                              data); // Передаем обновленные данные в родительский виджет
                                        });
                                      },
                                    )
                                  : SelectableText(row[cellIndex].toString()),
                            );
                          },
                        ),
                      );
                    },
                  ),
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
}
