import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TasksMain extends StatefulWidget {
  const TasksMain({super.key});

  @override
  State<TasksMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TasksMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: CustomColor.color3,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
