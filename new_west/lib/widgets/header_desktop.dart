import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.user});
  final Map<String, String> user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      color: CustomColor.color4,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: SiteLogo(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(
              "${user["name"]}\n${user["position"]}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
