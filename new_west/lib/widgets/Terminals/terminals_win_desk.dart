import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/country_city.dart';
import '../../constants/lists/terminalList.dart';

class TerminalsWinDesk extends StatefulWidget {
  const TerminalsWinDesk({super.key});

  @override
  State<TerminalsWinDesk> createState() => _TerminalsWinDeskState();
}

class _TerminalsWinDeskState extends State<TerminalsWinDesk> {
  String? selectedCountry;
  String? selectedCity;
  TextEditingController terminal = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController adres = TextEditingController();
  TextEditingController contactMail = TextEditingController();
  TextEditingController contactPhone = TextEditingController();
  TextEditingController hoursWork = TextEditingController();
  TextEditingController mechVid = TextEditingController();
  TextEditingController prr20dc = TextEditingController();
  TextEditingController prr40hc = TextEditingController();
  TextEditingController storage20dc = TextEditingController();
  TextEditingController storage40hc = TextEditingController();
  TextEditingController photo = TextEditingController();
  TextEditingController accs = TextEditingController();
  Map<String, String> terminalfull = {};
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
                      "Добавление Терминала",
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
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: terminal,
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
                  const Text('Сток'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: stock,
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
                  const Text('Адрес'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: adres,
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
                  const Text('Контактная почта'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: contactMail,
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
                  const Text('Контактный номер'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: contactPhone,
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
                  const Text('Часы работы'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: hoursWork,
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
                  const Text('Механика выдачи'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: mechVid,
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
                  const Text('ПРР 20DC'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: prr20dc,
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
                  const Text('ПРР 40HC'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: prr40hc,
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
                  const Text('Хранение 20DC (руб/сутки)'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: storage20dc,
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
                  const Text('Хранение 40HC (руб/сутки)'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: storage40hc,
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
                  const Text('Фото'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: photo,
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
                  const Text('Аккаунты'),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: accs,
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
                      onPressed: () {
                        if (selectedCountry != null &&
                            selectedCity != null &&
                            terminal.text.isNotEmpty &&
                            stock.text.isNotEmpty &&
                            adres.text.isNotEmpty &&
                            contactMail.text.isNotEmpty &&
                            contactPhone.text.isNotEmpty &&
                            hoursWork.text.isNotEmpty &&
                            mechVid.text.isNotEmpty &&
                            prr20dc.text.isNotEmpty &&
                            prr40hc.text.isNotEmpty &&
                            storage20dc.text.isNotEmpty &&
                            storage40hc.text.isNotEmpty &&
                            photo.text.isNotEmpty &&
                            accs.text.isNotEmpty) {
                          setState(() {
                            List<String> terminalData = [
                              (terminalList.length + 1).toString(),
                              selectedCountry!,
                              selectedCity!,
                              terminal.text,
                              stock.text,
                              adres.text,
                              contactMail.text,
                              contactPhone.text,
                              hoursWork.text,
                              mechVid.text,
                              prr20dc.text,
                              prr40hc.text,
                              storage20dc.text,
                              storage40hc.text,
                              photo.text,
                              accs.text,
                            ];
                            Navigator.of(context).pop();
                            terminalList.add(terminalData);
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
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
