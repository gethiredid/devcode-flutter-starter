import 'package:flutter/material.dart';

class HelloView extends StatelessWidget {
  const HelloView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/png/devcode-logo.png', key: const Key('devcode-logo'), width: 200, height: 200),
          const SizedBox(height: 15,),
          const Align(
            alignment: Alignment.center, child: Text("I'm ready for the next challenge!", key: Key('devcode-title'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          )
        ],
      ),
    );
  }
}
