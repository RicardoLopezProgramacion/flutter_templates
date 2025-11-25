import 'package:authentication_firebase_template/core/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: SidebarWidget(),
      body: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home'),
              ElevatedButton(onPressed: () {}, child: const Text('Logout')),
            ],
          ),
        ),
      ),
    );
  }
}
