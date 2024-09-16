// import 'package:flutter/material.dart';
// //import 'package:screen_profile_app/profile_screen.dart';

// class LoginScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _fullNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('INICIAR SESION'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: InputDecoration(labelText: 'Nombre Completo'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Ingrese su Nombre Completo';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Contraseña'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Ingrese su Contraseña';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(labelText: 'Telefono'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Ingrese su telefono';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Ingrese su Email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProfileScreen(
//                           fullName: _fullNameController.text,
//                           password: _passwordController.text,
//                           phone: _phoneController.text,
//                           email: _emailController.text,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Entrar Al Perfil'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
