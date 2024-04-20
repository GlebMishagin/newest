import 'package:flutter/material.dart';
import 'package:newest/constants/lists/sails_list.dart';

import '../../constants/colors.dart';
import '../../constants/lists/podryadchik.dart';
import '../../constants/lists/statussail.dart';
import '../../constants/lists/svod_list.dart';
import '../../constants/manegers.dart';

class SailsWinDesk extends StatefulWidget {
  const SailsWinDesk({super.key});

  @override
  State<SailsWinDesk> createState() => _SailsWinDeskState();
}

class _SailsWinDeskState extends State<SailsWinDesk> {
  bool cashCheckboxValue = false;
  bool bankAccountCheckboxValue = false;
  bool ndsChecker = false;
  bool noNdsChecker = false;
  bool zeroNdsChecker = false;
  String? selectedContractor;
  String? selectedStatus;
  String? selectedContainer;
  String? pickManager;
  final TextEditingController _dateController = TextEditingController();
  TextEditingController cost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 700,
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColor.color2,
        ),
        child: SingleChildScrollView(
          child: Align(
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
                      "Добавить сделку",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Выберите контрагента"),
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
                        value: selectedContractor,
                        hint: const Text('Выберите контрагента'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedContractor = newValue;
                          });
                        },
                        items: podryadList.map((sublist) {
                          return DropdownMenuItem<String>(
                            value: sublist[1], // Значение из индекса 1
                            child: Text(sublist[1]), // Текст из индекса 1
                          );
                        }).toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Статус"),
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
                        value: selectedStatus,
                        hint: const Text('Статус'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                        items: sailsStatus.map((status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(status),
                          );
                        }).toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Стоимость продажи'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: cost,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Дата'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 2))),
                      controller: _dateController,
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Вид оплаты'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: cashCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            cashCheckboxValue = value!;
                          });
                        },
                      ),
                      const Text('Наличные'),
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                        value: bankAccountCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            bankAccountCheckboxValue = value!;
                          });
                        },
                      ),
                      const Text('Расчетный счет'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('НДС'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: ndsChecker,
                        onChanged: (value) {
                          setState(() {
                            ndsChecker = value!;
                          });
                        },
                      ),
                      const Text('Есть'),
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                        value: noNdsChecker,
                        onChanged: (value) {
                          setState(() {
                            noNdsChecker = value!;
                          });
                        },
                      ),
                      const Text('Нет'),
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                        value: zeroNdsChecker,
                        onChanged: (value) {
                          setState(() {
                            zeroNdsChecker = value!;
                          });
                        },
                      ),
                      const Text('С НДС 0 %'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Номера контейнеров'),
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
                        value: selectedContainer,
                        hint: const Text('Номера контейнеров'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedContainer = newValue;
                          });
                        },
                        items: svodList.map((container) {
                          return DropdownMenuItem<String>(
                            value: container[5], // Значение - номер контейнера
                            child:
                                Text(container[5]), // Текст - номер контейнера
                          );
                        }).toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const Text("Ответственный менеджер"),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: pickManager,
                        items: managers.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            pickManager = newValue;
                          });
                        },
                        hint: const Text('Ответственный менеджер'),
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
                        if (selectedContractor != null &&
                            selectedStatus != null &&
                            cost.text.isNotEmpty &&
                            _dateController.text.isNotEmpty &&
                            // (cashCheckboxValue || bankAccountCheckboxValue) &&
                            // (noNdsChecker || ndsChecker || zeroNdsChecker) &&
                            selectedContainer != null &&
                            pickManager != null) {
                          String marzha() {
                            if (cost.text.isNotEmpty) {
                              String marzh = '';
                              if (selectedContainer != null) {
                                // Поиск контейнера в списке svodList
                                for (var container in svodList) {
                                  if (container.length > 5 &&
                                      container[5] == selectedContainer) {
                                    // Если контейнер найден, получаем значение из 11-й ячейки
                                    return marzh = (int.parse(cost.text) -
                                            int.parse(container[10]))
                                        .toString();
                                    // Завершаем цикл после нахождения первого совпадения
                                  }
                                }
                              }
                              return marzh;
                            } else {
                              return '';
                            }
                          }

                          String vid() {
                            if (cashCheckboxValue = true) {
                              return 'Наличные';
                            } else {
                              return 'Рассчетный счет';
                            }
                          }

                          String nds() {
                            if (noNdsChecker == true) {
                              return 'Без НДС';
                            } else if (ndsChecker == true) {
                              return 'С НДС';
                            } else if (zeroNdsChecker == true) {
                              return 'С НДС 0%';
                            } else {
                              return '';
                            }
                          }

                          String city() {
                            String city = '';
                            if (selectedContainer != null) {
                              // Поиск контейнера в списке svodList
                              for (var container in svodList) {
                                if (container.length > 5 &&
                                    container[5] == selectedContainer) {
                                  // Если контейнер найден, получаем значение из 11-й ячейки
                                  city = container[2];
                                  // Завершаем цикл после нахождения первого совпадения
                                  break;
                                }
                              }
                            }
                            return city;
                          }

                          List<String> sailsAdd = [
                            (sailsList.length + 1).toString(),
                            selectedContractor!,
                            _dateController.text,
                            selectedStatus!,
                            cost.text,
                            marzha(),
                            vid(),
                            nds(),
                            '1',
                            city(),
                            pickManager!,
                          ];
                          sailsList.add(sailsAdd);
//                           print(sailsList);
//                           int? indexToRemove;
//                           for (int i = 0; i < svodList.length; i++) {
//                             if (svodList[i].contains(selectedContainer)) {
//                               indexToRemove = i;
//                               break;
//                             }
//                           }

// // Если нашли строку с selectedContainer, удаляем ее из svodList и добавляем в archivList
//                           if (indexToRemove != null) {
//                             List<String> removedRow =
//                                 svodList.removeAt(indexToRemove);
//                             removedRow
//                                 .removeLast(); // Удаляем предпоследний элемент
//                             archivList.add(removedRow);
//                           }

//                           print(
//                               svodList); // Проверка, что строка удалена из svodList
//                           print(archivList);
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
                      child: const Text('Добавить сделку'),
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
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
