import 'package:flutter/material.dart';

import 'package:perplexity_clone/theme/colors.dart';

class SidebarButton extends StatelessWidget {
  final bool isColapse;
  final IconData icon;
  final String text;

  const SidebarButton({
    super.key,
    required this.isColapse,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isColapse
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        isColapse
            ? SizedBox()
            : Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
      ],
    );
  }
}
