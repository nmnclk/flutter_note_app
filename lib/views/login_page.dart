import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Note App",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("sing in");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), 
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
