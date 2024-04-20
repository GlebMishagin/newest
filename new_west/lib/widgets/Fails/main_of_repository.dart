import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class RepositoryMain extends StatelessWidget {
  const RepositoryMain({super.key});

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
