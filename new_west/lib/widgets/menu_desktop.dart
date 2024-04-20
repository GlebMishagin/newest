import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';

typedef MenuCallback = void Function(int index);

class MenuDesktop extends StatefulWidget {
  final MenuCallback onMenuItemClicked;
  final String userPosition;
  final Map<String, String> user;
  const MenuDesktop({
    super.key,
    required this.onMenuItemClicked,
    required this.userPosition,
    required this.user,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MenuDesktopState createState() => _MenuDesktopState();
}

class _MenuDesktopState extends State<MenuDesktop> {
  int _selectedIndex = 0;

  late List<String> visibleNavTitles;

  @override
  void initState() {
    super.initState();
    visibleNavTitles = getVisibleNavTitles(widget.user);
  }

  List<String> getVisibleNavTitles(Map<String, String> user) {
    String userPosition = user["position"] ?? "";
    switch (userPosition) {
      case 'Админ':
      case 'Директор':
        return navTitles;
      case 'Менеджер по продажам':
        return [
          navTitles[0], // Свод контейнеров
          navTitles[4], // Продажи
          navTitles[5], // КП Партнерские контейнеры
          navTitles[6], // КП для клиентов
          navTitles[8], // Подрядчики
          navTitles[9], // Мои Задачи
          navTitles[10], // Перевозки
          navTitles[11], // Репозиторий
        ];
      case 'Менеджер cнабжения':
        return [
          navTitles[0], // Свод контейнеров
          navTitles[1], // Закуп
          navTitles[2], // Терминалы
          navTitles[5], // КП Партнерские контейнеры
          navTitles[7], // Архив
          navTitles[8], // Подрядчики
          navTitles[9], // Мои Задачи
          navTitles[10], // Перевозки
          navTitles[11], // Репозиторий
        ];
      case 'Операционный менеджер':
        return [
          navTitles[0], // Свод контейнеров
          navTitles[4], // Продажи
          navTitles[5], // КП Партнерские контейнеры
          navTitles[8], // Подрядчики
          navTitles[9], // Мои Задачи
          navTitles[10], // Перевозки
          navTitles[11], // Репозиторий
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomColor.color3,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: ListView.builder(
          itemCount: visibleNavTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                visibleNavTitles[index],
                style: TextStyle(
                  color: _selectedIndex == index
                      ? const Color.fromARGB(255, 127, 93, 63)
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onMenuItemClicked(index);
              },
            );
          },
        ),
      ),
    );
  }
}
