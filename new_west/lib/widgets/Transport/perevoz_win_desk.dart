import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newest/constants/lists/perevozlist.dart';

import '../../constants/colors.dart';
import '../../constants/country_city.dart';
import '../../constants/lists/podryadchik.dart';
import '../../constants/lists/terminalList.dart';
import '../../constants/manegers.dart';
import '../../constants/status_of_pay_perevoz.dart';
import '../../constants/types_of_containers.dart';

class PerevozWinDesk extends StatefulWidget {
  const PerevozWinDesk({super.key});

  @override
  State<PerevozWinDesk> createState() => _PerevozWinDeskState();
}

class _PerevozWinDeskState extends State<PerevozWinDesk> {
  String? selectedCountryA;
  String? selectedCityA;
  String? selectedCountryB;
  String? selectedCityB;
  List<String> citiesForSelectedCountry = [];
  List<String> citiesForSelectedCountry2 = [];
  String? selectedType;
  String? operation;
  String? pickStatusOfPaymentPerevoz;
  String? pickManager;
  String? selectedContractor;
  String? selectedTerminalA;
  String? selectedTerminalB;
  bool isOwnTerminal1 = false;
  bool isOwnTerminal2 = false;
  bool isOwnCity1 = false;
  bool isOwnCity2 = false;
  bool isOwnStock1 = false;
  bool isOwnStock2 = false;
  TextEditingController textTerminalA = TextEditingController();
  TextEditingController textCityA = TextEditingController();
  TextEditingController textCityB = TextEditingController();
  TextEditingController textStockB = TextEditingController();
  TextEditingController daysOfuse = TextEditingController();
  TextEditingController betSNP = TextEditingController();
  TextEditingController textStockA = TextEditingController();
  TextEditingController textTerminalB = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController containersController = TextEditingController();

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
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Добавить перевозку",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text("Выберите подрядчика"),
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
                      value:
                          selectedContractor, // Значение, которое выбрано в данный момент
                      hint: const Text('Выберите подрядчика'),
                      onChanged: (newValue) {
                        setState(() {
                          selectedContractor =
                              newValue; // Сохраняем выбранное значение
                        });
                      },
                      items: podryadList.map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem<String>(
                          value: list[1], // Второй элемент в каждом списке
                          child:
                              Text(list[1]), // Текст для отображения в списке
                        );
                      }).toList(),
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Номера контейнеров'),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: containersController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 2,
                          ),
                        ),
                        hintText: ('Номер, номер, номер, ')),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Тип"),
                SizedBox(
                  width: 180,
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
                      value: selectedType,
                      items: typeOfContainers.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedType = newValue;
                        });
                      },
                      hint: const Text('Выберите тип'),
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Количество дней пользования'),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: daysOfuse,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 2,
                          ),
                        ),
                        hintText: ('Количество дней')),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Ставка СНП'),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: betSNP,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: CustomColor.color2,
                          width: 2,
                        ),
                      ),
                      hintText: ('Ставка СНП'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text('Дата подписания сделки'),
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
                const Text("Страна A"),
                SizedBox(
                  width: 180,
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
                      value: selectedCountryA,
                      items: countryCitiesMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryA = newValue;
                          citiesForSelectedCountry =
                              countryCitiesMap[selectedCountryA!] ?? [];
                          selectedCityA = null; // Сбрасываем выбранный город
                        });
                      },
                      hint: const Text('Выберите страну'),
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isOwnCity1, // Состояние переключателя
                      onChanged: (bool? value) {
                        setState(() {
                          isOwnCity1 = value ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Партнерский"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Город A"),
                if (!isOwnCity1)
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: selectedCityA,
                        items: citiesForSelectedCountry.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCityA = newValue!;
                          });
                        },
                        hint: const Text('Выберите город A'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                if (isOwnCity1)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textCityA,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                        hintText: 'Введите Город A',
                      ),
                      // Обработчик изменения текста, если нужно
                      onChanged: (text) {
                        // Ваш код для обработки введенного текста
                      },
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Checkbox(
                      value: isOwnTerminal1, // Состояние переключателя
                      onChanged: (bool? newValue) {
                        setState(() {
                          isOwnTerminal1 =
                              newValue ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Партнерский"), // Текст рядом с переключателем
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!isOwnTerminal1)
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
                        value: selectedTerminalA, // Выбранное значение
                        hint: const Text(
                            'Выберите терминал A'), // Подсказка, когда ничего не выбрано
                        onChanged: (newValue) {
                          setState(() {
                            selectedTerminalA =
                                newValue; // Сохраняем выбранное значение
                          });
                        },
                        items: terminalList
                            .map<DropdownMenuItem<String>>((terminal) {
                          return DropdownMenuItem<String>(
                            value: terminal[
                                3], // Четвертый элемент - название терминала
                            child: Text(
                                terminal[3]), // Отображаем название терминала
                          );
                        }).toList(),
                        underline:
                            const SizedBox(), // Убираем линию под текстом
                      ),
                    ),
                  ),
                // Если терминал не свой, отображаем текстовое поле
                if (isOwnTerminal1)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textTerminalA,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                        hintText: 'Введите терминал A',
                      ),
                      // Обработчик изменения текста, если нужно
                      onChanged: (text) {
                        // Ваш код для обработки введенного текста
                      },
                    ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isOwnStock1, // Состояние переключателя
                      onChanged: (bool? newValue) {
                        setState(() {
                          isOwnStock1 =
                              newValue ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Чужой сток A"), // Текст рядом с переключателем
                  ],
                ),
                if (isOwnStock1)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textStockA,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 1,
                          ),
                        ),
                        hintText: 'Введите сток A',
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),

                const Text("Страна B"),
                SizedBox(
                  width: 220,
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
                      value: selectedCountryB,
                      items: countryCitiesMap2.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryB = newValue;
                          citiesForSelectedCountry2 =
                              countryCitiesMap2[selectedCountryB!] ?? [];
                          selectedCityB = null; // Сбрасываем выбранный город
                        });
                      },
                      hint: const Text('Выберите страну'),
                      underline: const SizedBox(),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isOwnCity2, // Состояние переключателя
                      onChanged: (bool? value) {
                        setState(() {
                          isOwnCity2 = value ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Партнерский"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Город B"),
                if (!isOwnCity2)
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: selectedCityB,
                        items: citiesForSelectedCountry2.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCityB = newValue!;
                          });
                        },
                        hint: const Text('Выберите город B'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                if (isOwnCity2)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textCityB,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.blue, // Цвет рамки
                            width: 1, // Ширина рамки
                          ),
                        ),
                        hintText: 'Введите Город B',
                      ),
                      // Обработчик изменения текста, если нужно
                      onChanged: (text) {
                        // Ваш код для обработки введенного текста
                      },
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Checkbox(
                      value: isOwnTerminal2, // Состояние переключателя
                      onChanged: (bool? newValue) {
                        setState(() {
                          isOwnTerminal2 =
                              newValue ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Партнерский"), // Текст рядом с переключателем
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!isOwnTerminal2)
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
                        value: selectedTerminalB, // Выбранное значение
                        hint: const Text(
                            'Выберите терминал B'), // Подсказка, когда ничего не выбрано
                        onChanged: (newValue) {
                          setState(() {
                            selectedTerminalB =
                                newValue; // Сохраняем выбранное значение
                          });
                        },
                        items: terminalList
                            .map<DropdownMenuItem<String>>((terminal) {
                          return DropdownMenuItem<String>(
                            value: terminal[
                                3], // Четвертый элемент - название терминала
                            child: Text(
                                terminal[3]), // Отображаем название терминала
                          );
                        }).toList(),
                        underline:
                            const SizedBox(), // Убираем линию под текстом
                      ),
                    ),
                  ),
                // Если терминал не свой, отображаем текстовое поле
                if (isOwnTerminal2)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textTerminalB,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 1,
                          ),
                        ),
                        hintText: 'Введите терминал B',
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isOwnStock2, // Состояние переключателя
                      onChanged: (bool? newValue) {
                        setState(() {
                          isOwnStock2 =
                              newValue ?? true; // Обновление состояния
                        });
                      },
                    ),
                    const Text("Чужой сток B"), // Текст рядом с переключателем
                  ],
                ),
                if (isOwnStock2)
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: textStockB,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 1,
                          ),
                        ),
                        hintText: 'Введите сток B',
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Radio(
                      value: '-',
                      groupValue: operation,
                      onChanged: (value) {
                        setState(() {
                          operation = value;
                        });
                      },
                    ),
                    const Text('-'),
                    const SizedBox(
                      width: 5,
                    ),
                    Radio(
                      value: '+',
                      groupValue: operation,
                      onChanged: (value) {
                        setState(() {
                          operation = value;
                        });
                      },
                    ),
                    const Text('+'),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text('Цена (руб.)'),
                SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 2))),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text("Статус оплаты"),
                SizedBox(
                  width: 200,
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
                      value: pickStatusOfPaymentPerevoz,
                      items: statusOfPaymentPerevoz.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          pickStatusOfPaymentPerevoz = newValue;
                        });
                      },
                      hint: const Text('Статус оплаты'),
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                          _dateController.text.isNotEmpty &&
                          containersController.text.isNotEmpty &&
                          betSNP.text.isNotEmpty &&
                          daysOfuse.text.isNotEmpty &&
                          selectedType != null &&
                          (selectedCityA != null ||
                              textCityA.text.isNotEmpty) &&
                          (selectedTerminalA != null ||
                              textTerminalA.text.isNotEmpty) &&
                          (selectedCityB != null ||
                              textCityB.text.isNotEmpty) &&
                          (selectedTerminalB != null ||
                              textTerminalB.text.isNotEmpty) &&
                          priceController.text.isNotEmpty &&
                          pickStatusOfPaymentPerevoz != null &&
                          pickManager != null) {
                        setState(() {
                          String cityA() {
                            if (isOwnCity1 = true) {
                              return selectedCityA!;
                            } else {
                              return textCityA.text;
                            }
                          }

                          String terminalA() {
                            if (isOwnTerminal1 = true) {
                              return selectedTerminalA!;
                            } else {
                              return textTerminalA.text;
                            }
                          }

                          String stockA() {
                            if (isOwnStock1 == true) {
                              return textStockA.text;
                            } else {
                              // Поиск в списке terminalList по значению selectedTerminalA
                              for (List<String> terminal in terminalList) {
                                if (terminal.length > 4 &&
                                    terminal[3] == selectedTerminalA) {
                                  return terminal[
                                      4]; // Возвращаем пятое значение
                                }
                              }
                              // Если ничего не найдено, возвращаем пустую строку
                              return '';
                            }
                          }

                          String cityB() {
                            if (isOwnCity2 = true) {
                              return selectedCityB!;
                            } else {
                              return textCityB.text;
                            }
                          }

                          String terminalB() {
                            if (isOwnTerminal2 = true) {
                              return selectedTerminalB!;
                            } else {
                              return textTerminalB.text;
                            }
                          }

                          String stockB() {
                            if (isOwnStock2 == true) {
                              return textStockB.text;
                            } else {
                              // Поиск в списке terminalList по значению selectedTerminalA
                              for (List<String> terminal in terminalList) {
                                if (terminal.length > 4 &&
                                    terminal[3] == selectedTerminalB) {
                                  return terminal[
                                      4]; // Возвращаем пятое значение
                                }
                              }
                              // Если ничего не найдено, возвращаем пустую строку
                              return '';
                            }
                          }

                          String price() {
                            if (operation == '-') {
                              return operation.toString() +
                                  priceController.text;
                            } else {
                              return operation.toString() +
                                  priceController.text;
                            }
                          }

                          String kolVoBox() {
                            if (containersController.text.isNotEmpty) {
                              return containersController.text
                                  .split(', ')
                                  .length
                                  .toString();
                            } else {
                              return '1';
                            }
                          }

                          List<String> adPerevoz = [
                            (perevozList.length + 1).toString(),
                            selectedContractor!,
                            _dateController.text,
                            kolVoBox(),
                            cityA(),
                            terminalA(),
                            stockA(),
                            cityB(),
                            terminalB(),
                            stockB(),
                            price(),
                            pickStatusOfPaymentPerevoz!,
                            pickManager!
                          ];
                          perevozList.add(adPerevoz);
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
                    child: const Text('Добавить'),
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
    ));
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
