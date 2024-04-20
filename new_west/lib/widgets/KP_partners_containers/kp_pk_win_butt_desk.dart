import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KpPkWinDesk extends StatefulWidget {
  const KpPkWinDesk({super.key});

  @override
  State<KpPkWinDesk> createState() => _KpPkWinDeskState();
}

class _KpPkWinDeskState extends State<KpPkWinDesk> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        height: 200,
        child: Column(
          children: [
            const Center(
              child: Text(
                "Создать папку",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Имя папки'),
            SizedBox(
              width: 400,
              height: 50,
              child: TextField(
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
                  Navigator.of(context).pop();
                },
                child: const Text('Создать'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
