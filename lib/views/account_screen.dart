import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // ignore: avoid_print
      print(auth.currentUser!.email);
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text("Tentang Saya", style: TextStyle(fontSize: 25,)),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Stack(
                  children: <Widget>[
                    Image.network('https://cdn.dribbble.com/users/5184204/avatars/normal/open-uri20200420-23439-eu48bu?1587412906&compress=1&resize=40x40'),
                  ],
                )),
              const SizedBox(height: 30),
              const Text("Robby Satya Wicaksana", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)), 
              const SizedBox(height: 8),
              const Text("robbysatya12@gmail.com", style: TextStyle(fontSize: 14, color: Colors.black45)), 
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _signOut().then((value) => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen())));
                },
                child: const Text('Logout'),
              )
          ],
          ),
        ),
    );
  }
}
