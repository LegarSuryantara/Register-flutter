import 'package:flutter/material.dart';

import 'ProfilePage.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passworldController = TextEditingController();
  final TextEditingController comfirmPassworldController =TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Nama Lengkap', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passworldController,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: comfirmPassworldController,
              decoration: InputDecoration(
                  labelText: 'Confirm Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passworldController.text.isEmpty ||
                    comfirmPassworldController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Form Tidak Lengkap'),
                        content:
                            Text('Silakan isi semua field sebelum mendaftar.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pendaftaran Berhasil'),
                        content: Text('Anda telah berhasil mendaftar!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    name: nameController.text,
                                    email: emailController.text,
                                  ),
                                ),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Daftar'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sudah punya akun ? Login',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
