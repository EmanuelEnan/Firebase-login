import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/login.jpg'),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              },
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'your email',
              ),
            ),
            TextFormField(
              onChanged: (val) {
                setState(() => password = val);
              },
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'your password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password)
                    .then((val) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                });
              },
              child: const Text('Sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
