import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/sidebar_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isColapse = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: isColapse ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: isColapse ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isColapse
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                SidebarButton(
                  isColapse: isColapse,
                  icon: Icons.add,
                  text: 'Home',
                ),
                SidebarButton(
                  isColapse: isColapse,
                  icon: Icons.search,
                  text: 'Search',
                ),
                SidebarButton(
                  isColapse: isColapse,
                  icon: Icons.language,
                  text: 'Language',
                ),
                SidebarButton(
                  isColapse: isColapse,
                  icon: Icons.auto_awesome,
                  text: 'Discover',
                ),
                SidebarButton(
                  isColapse: isColapse,
                  icon: Icons.cloud_off_outlined,
                  text: 'Library',
                ),

                const Spacer(), // create flexible space(full space kosong)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isColapse = !isColapse;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    child: Icon(
                      isColapse
                          ? Icons.keyboard_arrow_right
                          : Icons.keyboard_arrow_left,
                      color: AppColors.iconGrey,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
