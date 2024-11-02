import 'package:flutter/cupertino.dart';

import '../../../ui/common/common.dart';

class Itembutton extends StatelessWidget {
  const Itembutton({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            icon,
            color: Palette.grey,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Palette.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
