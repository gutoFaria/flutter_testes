import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const  Center(child: Text('Quiz curso app')),
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/quiz.png',)
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(100,20,100,20)
              ),
              onPressed: (){

              }, 
              child:const  Text('Jogar',style: TextStyle(fontSize: 50),))
          ],
        )),
      ),
    );
  }
}