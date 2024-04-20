import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/Archiv/archiv.dart';
import '../widgets/Fails/repository.dart';
import '../widgets/KP_clients/kp_clients.dart';
import '../widgets/KP_partners_containers/kp_pk.dart';
import '../widgets/Podryadchiki/podryadchiki.dart';
import '../widgets/RemontDesktop/repair.dart';
import '../widgets/Sails/sails.dart';
import '../widgets/Svod/svod.dart';
import '../widgets/Tasks/tasks.dart';
import '../widgets/Terminals/terminals.dart';
import '../widgets/Transport/perevoz.dart';
import '../widgets/ZakupDesktop/zakup.dart';
import '../widgets/header_desktop.dart';
import '../widgets/menu_desktop.dart';

class BuyContainers extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const BuyContainers({Key? key, required this.user});
  final Map<String, String> user;

  @override
  State<BuyContainers> createState() => _BuyContainersState();
}

class _BuyContainersState extends State<BuyContainers> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String userPosition = widget.user["position"]!;
    return Scaffold(
      backgroundColor: CustomColor.color4,
      body: Column(
        children: [
          //header
          HeaderDesktop(
            user: widget.user,
          ),

          //main
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                color: CustomColor.color4,
                margin: const EdgeInsets.only(top: 0),
                child: MenuDesktop(
                  userPosition: userPosition,
                  user: widget.user,
                  onMenuItemClicked: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 205,
                height: MediaQuery.of(context).size.height - 60,
                color: CustomColor.color4,
                child: Column(
                  children: [
                    //Table
                    const SizedBox(
                      height: 10,
                    ),
                    if (userPosition == 'Админ' ||
                        userPosition == 'Директор') ...[
                      // Отображаем все виджеты для Админа и Директора
                      if (_selectedIndex == 0) const Svod(),
                      if (_selectedIndex == 1) const Zakup(),
                      if (_selectedIndex == 2) const Terminals(),
                      if (_selectedIndex == 3) const Repair(),
                      if (_selectedIndex == 4) const Sails(),
                      if (_selectedIndex == 5) const KpPK(),
                      if (_selectedIndex == 6) const KpClients(),
                      if (_selectedIndex == 7) const Archiv(),
                      if (_selectedIndex == 8) const Podryadchiki(),
                      if (_selectedIndex == 9) const Tasks(),
                      if (_selectedIndex == 10) const Perevozki(),
                      if (_selectedIndex == 11) const Repository(),
                    ] else if (userPosition == 'Менеджер по продажам') ...[
                      // Отображаем виджеты только для Менеджера по продажам
                      if (_selectedIndex == 0) const Svod(),
                      if (_selectedIndex == 1) const Sails(),
                      if (_selectedIndex == 2) const KpPK(),
                      if (_selectedIndex == 3) const KpClients(),
                      if (_selectedIndex == 4) const Podryadchiki(),
                      if (_selectedIndex == 5) const Tasks(),
                      if (_selectedIndex == 6) const Perevozki(),
                      if (_selectedIndex == 7) const Repository(),
                    ] else if (userPosition == 'Менеджер cнабжения') ...[
                      // Отображаем виджеты только для Менеджера снабжения
                      if (_selectedIndex == 0) const Svod(),
                      if (_selectedIndex == 1) const Zakup(),
                      if (_selectedIndex == 2) const Terminals(),
                      if (_selectedIndex == 3) const KpPK(),
                      if (_selectedIndex == 4) const Archiv(),
                      if (_selectedIndex == 5) const Podryadchiki(),
                      if (_selectedIndex == 6) const Tasks(),
                      if (_selectedIndex == 7) const Perevozki(),
                      if (_selectedIndex == 8) const Repository(),
                    ] else if (userPosition == 'Операционный менеджер') ...[
                      // Отображаем виджеты только для Операционного менеджера
                      if (_selectedIndex == 0) const Svod(),
                      if (_selectedIndex == 1) const Sails(),
                      if (_selectedIndex == 2) const KpPK(),
                      if (_selectedIndex == 3) const Podryadchiki(),
                      if (_selectedIndex == 4) const Tasks(),
                      if (_selectedIndex == 5) const Perevozki(),
                      if (_selectedIndex == 6) const Repository(),
                    ],
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
