import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Column(
            children: [
              // SearchSection
              // Footer
            ],
          ),
        ],
      ),
    );
  }
}
