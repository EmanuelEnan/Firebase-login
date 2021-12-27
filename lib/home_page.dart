import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';
import 'sign_up.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'your password',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password)
                  .then((val) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FirstScreen()));
              }).onError((error, stackTrace) {
                showDialog(
                    context: context,
                    builder: (_) => Center(child: Text('error')));
              });
            },
            child: Text('Login'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('don\'t have an account?'),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignUp(),
                  ),
                ),
                child: Text('Sign-up now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
