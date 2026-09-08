import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_Section.dart';
import 'package:perplexity_clone/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                Expanded(child: SearchSection()),
                // Footer
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'Pro',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'Enterprise',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'Store',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'Blog',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'Careers',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        child: Text(
                          'English (English)',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
