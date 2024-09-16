import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Establecer valores predeterminados
  final String fullName = 'Leonardo Ivan Vazquez Torres'; // Nombre predefinido
  final String phone = '4615464934'; // Teléfono predefinido
  final String email = 'ilove.lilchoko@gmail.com'; // Email predefinido
  File? _image; // Variable para almacenar la imagen seleccionada
  final picker = ImagePicker();

  // Para poder hacer llamada
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    // Comprobar si se puede hacer una llamada
    canLaunchUrl(Uri(scheme: 'tel', path: '')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  // Función para seleccionar imagen desde la galería
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Función para tomar una foto con la cámara
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color lightPurple =
        Color.fromARGB(255, 155, 121, 218); // Ejemplo de un tono más claro
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert),
        ],
        title: const Text(
          'Welcome To Your Profile',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: lightPurple, // Color del AppBar
        elevation: 0, // Elimina la sombra del AppBar si se desea
      ),
      backgroundColor: Color(0xFFF0E5FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen circular
            CircleAvatar(
              radius: 100,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : const AssetImage('assets/leofoto.jpeg') as ImageProvider,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        _showPicker(
                            context); // Desplegar opciones de cámara y galería
                      },
                    ),
                  )
                ],
              ),
            ),

            //SEPARACION ENTRE IMAGEN E INFORMACION
            const SizedBox(height: 85),

            // Información de perfil en forma de tabla
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Columna izquierda (Nombre)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45.0, right: 0),
                        child: Container(
                          padding: const EdgeInsets.all(
                              15), // Espacio dentro del rectángulo
                          decoration: BoxDecoration(
                            color: lightPurple,
                            borderRadius: BorderRadius.circular(
                                15), // Esquinas redondeadas
                          ),
                          child: Text(
                            'Full Name\n$fullName',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Columna derecha (Teléfono)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, right: 50.0),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: lightPurple,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Teléfono\n$phone',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        30), // Espacio entre la fila de Nombre y Teléfono y el Email
                // Rectángulo para el Email (centrado)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Email\n$email',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                const SizedBox(height: 65),
                // Fila para los botones de GitHub y Llamar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0), // Margen lateral
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botón de GitHub (alineado a la izquierda pero con margen)
                      TextButton.icon(
                        onPressed: () async {
                          final githubAppUrl =
                              Uri.parse('https://github.com/LilChoko');
                          final githubWebUrl = Uri.parse('https://github.com/');

                          if (await canLaunchUrl(githubAppUrl)) {
                            await launchUrl(githubAppUrl,
                                mode: LaunchMode.externalApplication);
                          } else if (await canLaunchUrl(githubWebUrl)) {
                            await launchUrl(githubWebUrl,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'No se pudo abrir $githubWebUrl';
                          }
                        },
                        icon: Image.asset(
                          'assets/github.png',
                          height: 25,
                          width: 25,
                        ),
                        label: const Text(
                          'GitHub',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),

                      // Botón de Llamar (alineado a la derecha pero con margen)
                      TextButton.icon(
                        onPressed: _hasCallSupport
                            ? () => setState(() {
                                  _launched = _makePhoneCall(phone);
                                })
                            : null,
                        icon: const Icon(
                          Icons.phone,
                          size: 20,
                        ),
                        label: _hasCallSupport
                            ? Text(
                                '$phone',
                                style: TextStyle(fontSize: 20),
                              )
                            : const Text('Calling not supported'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 20), // Espacio entre fila de botones y el de correo

                // Botón de enviar correo (centrado)
                Align(
                  alignment: Alignment.center,
                  child: TextButton.icon(
                    onPressed: () async {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: email,
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Practica 2 Moviles',
                          'body':
                              'Prueba de que se puede enviar un correo desde mi aplicacion',
                        }),
                      );
                      try {
                        await launchUrl(emailUri);
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    icon: const Icon(
                      Icons.email,
                      size: 20,
                    ),
                    label: Text(
                      'Enviar Correo',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Galería'),
                  onTap: () {
                    _pickImageFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Cámara'),
                onTap: () {
                  _pickImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
