import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists/bought_container.dart';
import '../../constants/lists/na_remonte.dart';
import '../../constants/lists/remont_list.dart';

class RepairWinDesk extends StatefulWidget {
  const RepairWinDesk({super.key});

  @override
  State<RepairWinDesk> createState() => _RepairWinDeskState();
}

class _RepairWinDeskState extends State<RepairWinDesk> {
  String? selectedContainer;
  final TextEditingController remont = TextEditingController();
  final TextEditingController photoNew = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 700,
        height: 410,
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
                      "Ремонт контейнера",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Выберите контейнер"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
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
                        hint: const Text('Выберите контейнер'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedContainer = newValue;
                          });
                        },
                        items: [
                          for (var sublist in nestedList)
                            if (sublist.length > 5 && sublist[18] == '✅')
                              DropdownMenuItem<String>(
                                value: sublist[5],
                                child: Text(sublist[5]),
                              ),
                        ],
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Оказанный ремонт'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: remont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 1))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Фото после ремонта'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: photoNew,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 1))),
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
                        if (selectedContainer != null &&
                            remont.text.isNotEmpty) {
                          setState(() {
                            String city() {
                              if (selectedContainer != null) {
                                for (var sublist in nestedList) {
                                  if (sublist.length > 5 &&
                                      sublist[5] == selectedContainer) {
                                    return sublist[
                                        3]; // Возвращаем третий элемент списка
                                  }
                                }
                              }
                              return ' '; // Возвращаем null, если совпадение не найдено или selectedContainer равно null
                            }

                            String terminal() {
                              if (selectedContainer != null) {
                                for (var sublist in nestedList) {
                                  if (sublist.length > 5 &&
                                      sublist[5] == selectedContainer) {
                                    return sublist[
                                        2]; // Возвращаем третий элемент списка
                                  }
                                }
                              }
                              return ' ';
                            }

                            String type() {
                              if (selectedContainer != null) {
                                for (var sublist in nestedList) {
                                  if (sublist.length > 5 &&
                                      sublist[5] == selectedContainer) {
                                    return sublist[
                                        6]; // Возвращаем третий элемент списка
                                  }
                                }
                              }
                              return ' ';
                            }

                            String photo() {
                              if (selectedContainer != null) {
                                for (var sublist in nestedList) {
                                  if (sublist.length > 5 &&
                                      sublist[5] == selectedContainer) {
                                    return sublist[
                                        7]; // Возвращаем третий элемент списка
                                  }
                                }
                              }
                              return ' ';
                            }

                            String health() {
                              if (selectedContainer != null) {
                                for (var sublist in nestedList) {
                                  if (sublist.length > 5 &&
                                      sublist[5] == selectedContainer) {
                                    return sublist[
                                        9]; // Возвращаем третий элемент списка
                                  }
                                }
                              }
                              return ' ';
                            }

                            List<String> remontData = [
                              (remontList.length + 1).toString(),
                              selectedContainer!,
                              city(),
                              terminal(),
                              type(),
                              photo(),
                              health(),
                              remont.text,
                              photoNew.text
                            ];
                            remontList.add(remontData);
                            moveSublistToNaRemonte();
                            print(naRemonte);
                            print(nestedList);
                            Navigator.of(context).pop();
                          });
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
                      child: const Text('На ремонт'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void moveSublistToNaRemonte() {
    nestedList.removeWhere((sublist) {
      if (sublist.length > 5 && sublist[5] == selectedContainer) {
        naRemonte.add(sublist); // Добавляем подсписок в naRemonte
        return true; // Возвращаем true для удаления подсписка из nestedList
      }
      return false; // Возвращаем false, чтобы подсписок не был удален
    });
  }
}
