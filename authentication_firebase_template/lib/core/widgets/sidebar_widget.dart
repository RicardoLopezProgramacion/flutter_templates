import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  static int _selectedIndex = 0;
  static User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: _selectedIndex, // <--- Aquí va el índice seleccionado
      onDestinationSelected: (index) async {
        if (index == 3) {
          // Logout
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          setState(() {
            _selectedIndex = index;
            // La lista de rutas definidas que requieras y esten mapeadas en el main.dart ↓
            List<String> routes = ['home'];
            Navigator.pushReplacementNamed(
              context,
              '/${routes[_selectedIndex]}',
            );
          });
        }
      },
      children: [
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.black87,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              "Email: ${user?.email}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text("Configuration"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.support),
          label: Text("Support"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.logout, color: Colors.red),
          label: Text("Logout", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
