import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/colors.dart';
import '../../constants/country_city.dart';
import '../../constants/lists/bought_container.dart';
import '../../../constants/health_containers.dart';
import '../../../constants/manegers.dart';
import '../../../constants/status_of_payment.dart';
import '../../constants/lists/kp_clients_list.dart';
import '../../constants/lists/podryadchik.dart';
import '../../constants/lists/svod_list.dart';
import '../../constants/lists/terminalList.dart';
import '../../constants/types_of_containers.dart';

class BuyWindowDesktop extends StatefulWidget {
  const BuyWindowDesktop({super.key});

  @override
  State<BuyWindowDesktop> createState() => _BuyWindowDesktopState();
}

class _BuyWindowDesktopState extends State<BuyWindowDesktop> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedType;
  String? selectedHealth;
  String? selectedTerminal;
  String? pickManager;
  String? pickStatusOfPayment;
  bool? isCashPayment = false; // Добавлено значение по умолчанию
  bool? isNdsIncluded = false; // Добавлено значение по умолчанию
  bool? hasCustomsDeclaration = false;
  bool? zeroNdsPayment = false;
  String? _selectedContractor;
  bool? isNdsZero;
  bool isRepairNeeded = false;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController containerNumberController =
      TextEditingController();
  final TextEditingController photoLinkController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  List<String> citiesForSelectedCountry = [];

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
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Добавление контейнера",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Страна"),
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
                        value: selectedCountry,
                        items: countryCitiesMap.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCountry = newValue;
                            citiesForSelectedCountry =
                                countryCitiesMap[selectedCountry!] ?? [];
                            selectedCity = null; // Сбрасываем выбранный город
                          });
                        },
                        hint: const Text('Выберите страну'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Город"),
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
                        value: selectedCity,
                        items: citiesForSelectedCountry.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue;
                          });
                        },
                        hint: const Text('Выберите город'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Терминал'),
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
                      child: DropdownButton(
                        value: selectedTerminal,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTerminal = value!;
                          });
                        },
                        items: terminalList.map((List<String> list) {
                          return DropdownMenuItem(
                            value: list[
                                3], // Выбираем третий элемент из внутреннего списка
                            child: Text(list[3]), // Отображаем его значение
                          );
                        }).toList(),
                        hint: const Text('Выберите терминал'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Номер контейнера'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: containerNumberController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z]{0,4}\d{0,7}$')),
                        UppercaseTextInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: CustomColor.color2,
                            width: 2,
                          ),
                        ),
                      ),
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
                  const Text('Ссылка на фото'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: photoLinkController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 2))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('YOM'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: yearController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 2))),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Состояние"),
                  SizedBox(
                    width: 300,
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
                        value: selectedHealth,
                        items: healthOfContainers.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedHealth = newValue;
                          });
                        },
                        hint: const Text('Выберите Состояние'),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Тип оплаты: "),
                      Checkbox(
                        value: isCashPayment ?? false,
                        onChanged: (value) {
                          setState(() {
                            isCashPayment = value;
                            if (!value!) {
                              isNdsIncluded =
                                  null; // Сбрасываем значение НДС, если выбран безналичный платеж
                            }
                          });
                        },
                      ),
                      const Text("Наличные"),
                      const SizedBox(width: 10),
                      Checkbox(
                        value: isCashPayment == false ? true : false,
                        onChanged: (value) {
                          setState(() {
                            isCashPayment = value == true ? false : null;
                            if (value == true) {
                              isNdsIncluded =
                                  null; // Сбрасываем значение НДС, если выбран наличный платеж
                            }
                          });
                        },
                      ),
                      const Text("Рассчетный счет"),
                    ],
                  ),
                  isCashPayment == false
                      ? Row(
                          children: [
                            const Text("Налог: "),
                            Checkbox(
                              value: isNdsIncluded ?? false,
                              onChanged: (value) {
                                setState(() {
                                  isNdsIncluded = value;
                                });
                              },
                            ),
                            const Text("С НДС"),
                            const SizedBox(width: 10),
                            Checkbox(
                              value: isNdsIncluded == false ? true : false,
                              onChanged: (value) {
                                setState(() {
                                  isNdsIncluded = value == true
                                      ? false
                                      : null; // Переключаем на обратное значение
                                });
                              },
                            ),
                            const Text("Без НДС"),
                            const SizedBox(width: 10),
                            Checkbox(
                              value: isNdsZero ?? false,
                              onChanged: (value) {
                                setState(() {
                                  isNdsZero = value;
                                });
                              },
                            ),
                            const Text("С НДС 0%"),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("ГТД: "),
                      Checkbox(
                        value:
                            hasCustomsDeclaration ?? false, // Добавьте ?? false
                        onChanged: (value) {
                          setState(() {
                            hasCustomsDeclaration = value;
                          });
                        },
                      ),
                      const Text("Есть"),
                      const SizedBox(width: 10),
                      hasCustomsDeclaration == true
                          ? TextButton(
                              onPressed: () {
                                // Здесь обработка загрузки документа ГТД
                              },
                              child: const Text("Загрузить документ"),
                            )
                          : Container(),
                    ],
                  ),
                  const Text('Цена закупа (руб.)'),
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
                  const Text('Подрядчик'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return podryadList
                            .where((item) => item[1].toLowerCase().contains(
                                  textEditingValue.text.toLowerCase(),
                                ))
                            .map((item) => item[1])
                            .toList();
                      },
                      onSelected: (String? selectedValue) {
                        setState(() {
                          _selectedContractor = selectedValue;
                        });
                      },
                      fieldViewBuilder: (
                        BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted,
                      ) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: (String value) {
                            onFieldSubmitted();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      },
                      optionsViewBuilder: (
                        BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options,
                      ) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: SizedBox(
                              height: 200,
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: options
                                    .map((String option) => GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: ListTile(
                                            title: Text(option),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Дата поступления'),
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
                  const Text('Коментарий от терминала о состоянии контейнера'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: CustomColor.color2, width: 2))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Статус оплаты"),
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
                        value: pickStatusOfPayment,
                        items: statusOfPayment.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            pickStatusOfPayment = newValue;
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
                  const Text('Нуждается в ремонте'),
                  Checkbox(
                    value: isRepairNeeded,
                    onChanged: (bool? value) {
                      setState(() {
                        isRepairNeeded = value ?? false;
                      });
                    },
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
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.color1,
                      ),
                      onPressed: () {
                        if (selectedCountry != null &&
                            selectedCity != null &&
                            selectedTerminal != null &&
                            containerNumberController.text.isNotEmpty &&
                            selectedType != null &&
                            photoLinkController.text.isNotEmpty &&
                            yearController.text.isNotEmpty &&
                            selectedHealth != null &&
                            priceController.text.isNotEmpty &&
                            _selectedContractor != null &&
                            _dateController.text.isNotEmpty &&
                            pickManager != null &&
                            pickStatusOfPayment != null &&
                            commentController.text.isNotEmpty) {
                          setState(() {
                            String getNdsValue() {
                              if (isCashPayment == true) {
                                if (isNdsIncluded == true) {
                                  return 'С НДС';
                                } else if (isNdsZero == true) {
                                  return 'С НДС 0%'; // Значение не выбрано
                                } else {
                                  return 'Без НДС';
                                }
                              } else {
                                return ' ';
                              }
                            }

                            String nal() {
                              if (isCashPayment == true) {
                                return 'Наличные';
                              } else {
                                return 'Расчетный счет';
                              }
                            }

                            String getCustomsDeclarationValue() {
                              return hasCustomsDeclaration == true
                                  ? 'Документ'
                                  : ''; // Добавлено для ГТД
                            }

                            String stock() {
                              String stock = '';
                              if (selectedTerminal != null) {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 4 &&
                                      terminal[3] == selectedTerminal) {
                                    stock = terminal[
                                        4]; // Записываем значение пятого элемента, если четвертый элемент равен selectedTerminal
                                  }
                                }
                              }
                              return stock;
                            }

                            String terminalStorage() {
                              String terminalStorage = ' ';
                              if (selectedTerminal != null &&
                                  selectedType == '20DC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 12 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    terminalStorage = terminal[
                                        12]; // Подтягиваем девятый элемент
                                  }
                                }
                              } else if (selectedTerminal != null &&
                                  selectedType == '40HC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 13 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    terminalStorage = terminal[13];
                                  }
                                }
                              }
                              return terminalStorage;
                            }

                            String prr() {
                              String prr = ' ';
                              if (selectedTerminal != null &&
                                  selectedType == '20DC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 10 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    prr = terminal[
                                        10]; // Подтягиваем девятый элемент
                                  }
                                }
                              } else if (selectedTerminal != null &&
                                  selectedType == '40HC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 11 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    prr = terminal[11];
                                  }
                                }
                              }
                              return prr;
                            }

                            String izderzhki() {
                              String izderzhki = ' ';
                              if (selectedTerminal != null &&
                                  selectedType == '20DC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 15 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    izderzhki = (int.parse(terminal[10]) +
                                            int.parse(terminal[12]))
                                        .toString(); // Подтягиваем девятый элемент
                                  }
                                }
                              } else if (selectedTerminal != null &&
                                  selectedType == '40HC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 15 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    izderzhki = (int.parse(terminal[11]) +
                                            int.parse(terminal[13]))
                                        .toString();
                                  }
                                }
                              }
                              return izderzhki;
                            }

                            String sebes() {
                              String sebes = ' ';
                              if (selectedTerminal != null &&
                                  selectedType == '20DC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 15 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    sebes = (int.parse(terminal[10]) +
                                            int.parse(terminal[12]) +
                                            int.parse(priceController.text))
                                        .toString(); // Подтягиваем девятый элемент
                                  }
                                }
                              } else if (selectedTerminal != null &&
                                  selectedType == '40HC') {
                                for (var terminal in terminalList) {
                                  if (terminal.length > 15 &&
                                      terminal[3] == selectedTerminal) {
                                    // Проверяем только совпадение терминала
                                    sebes = (int.parse(terminal[11]) +
                                            int.parse(terminal[13]) +
                                            int.parse(priceController.text))
                                        .toString();
                                  }
                                }
                              }
                              return sebes;
                            }

                            String repair() {
                              if (isRepairNeeded == true) {
                                return '✅';
                              } else {
                                return ' ';
                              }
                            }

                            List<String> containerList = [
                              (nestedList.length + 1).toString(),
                              selectedCountry!,
                              selectedCity!,
                              selectedTerminal!,
                              stock(),
                              containerNumberController.text,
                              selectedType!,
                              photoLinkController.text,
                              yearController.text,
                              selectedHealth!,
                              nal(),
                              priceController.text,
                              getNdsValue(),
                              getCustomsDeclarationValue(),
                              _selectedContractor!,
                              _dateController.text,
                              pickStatusOfPayment!,
                              terminalStorage(),
                              repair(),
                              prr(),
                              izderzhki(),
                              commentController.text,
                              pickManager!,
                            ];
                            nestedList.add(containerList);

                            List<String> svodAd = [
                              (svodList.length + 1).toString(),
                              selectedCountry!,
                              selectedCity!,
                              selectedTerminal!,
                              stock(),
                              containerNumberController.text,
                              photoLinkController.text,
                              yearController.text,
                              selectedType!,
                              selectedHealth!,
                              sebes(),
                              _selectedContractor!,
                              _dateController.text,
                              ' ',
                              ' ',
                              pickStatusOfPayment!,
                            ];
                            svodList.add(svodAd);
                            List<String> kpClientsAd = [
                              (kpClientsList.length + 1).toString(),
                              selectedCountry!,
                              selectedCity!,
                              selectedTerminal!,
                              containerNumberController.text,
                              photoLinkController.text,
                              yearController.text,
                              selectedType!,
                              ' ',
                            ];
                            kpClientsList.add(kpClientsAd);
                            Navigator.of(context).pop();
                          });
                        } else {
                          // Если хотя бы одно поле не заполнено, выводим сообщение об ошибке
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
                      child: const Text(
                        'Готово',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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

class UppercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
