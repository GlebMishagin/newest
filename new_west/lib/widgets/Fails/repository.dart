import 'package:flutter/material.dart';

import 'main_of_repository.dart';

class Repository extends StatelessWidget {
  const Repository({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RepositoryMain(),
      ],
    );
  }
}
