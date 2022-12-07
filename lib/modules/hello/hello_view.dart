import 'package:flutter/material.dart';

class HelloView extends StatelessWidget {
  const HelloView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Uncomment code di bawah ini dan tambahkan source pada folder assets
          Image.asset('', key: const Key('devcode-logo'), width: 200, height: 200),
          const SizedBox(height: 30,),
          // Uncomment code di bawah ini dan tambahkan property [key] dengan value 'devcode-title'
          // const Text("I'm ready for the next challenge!", key: Key(''), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),)
        ],
      ),
    );
  }
}
