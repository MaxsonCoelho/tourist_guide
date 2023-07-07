import 'package:flutter/material.dart';


Widget CustomDrawer ({
  required BuildContext pageContext
}) {

  return Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Travel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica Neue'
                      ),
                    ),
                    Text('versão 1.0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Helvetica Neue'
                      )
                    )
                  ]
                ),
                
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black,),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacementNamed(pageContext, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.public, color: Colors.black,),
                title: const Text('Escolher um Continente'),
                onTap: () {
                  Navigator.pushReplacementNamed(pageContext, '/continent');
                },
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Colors.black,),
                title: const Text('Buscar Cidade'),
                onTap: () {
                  Navigator.pushReplacementNamed(pageContext, '/search');
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.black,),
                title: const Text('Cidades Salvas'),
                onTap: () {
                  Navigator.pushReplacementNamed(pageContext, '/favorites');
                },
              ),
            ],
          ),
        );
}