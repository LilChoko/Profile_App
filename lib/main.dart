import 'package:flutter/material.dart';
import 'package:profile_app/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRACTICA 2',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Paleta de colores morada
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5), // Color morado claro casi blanco
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'D . A . T . A', // Título centrado
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.purple, // Color morado oscuro para el texto
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 55), // Espacio entre el texto y el ícono

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(), // Navegar sin parámetros
                  ),
                );
              },
              child: Image.asset(
                'assets/boton.png', // Ruta de la imagen
                width: 100.0,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
