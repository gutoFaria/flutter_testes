import 'package:flutter/material.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "pergunta":"Quem descobriu o brasil?",
        "resposta":[
          "Dom Pedro 1°",
          "Pedro Álvares Cabral",
          "Tiradentes",
          "Dom Pedro"
        ],
        "alternativa_correta":2
      }
    ];

    quiz.add({
       "pergunta":"Flutter é?",
        "resposta":[
          "Uma Linguagem",
          "Um aplicativo",
          "Um SDK",
          "Um notebook"
        ],
        "alternativa_correta":3
    });

    int perguntaNumero = 1;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const  Center(child: Text('Quiz curso app')),
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
               padding: EdgeInsets.all(10),
               child: Align(
                alignment: Alignment.centerRight,
                child: Text('Pergunta 1 de 10')),
             ),
             Align(
              
              alignment: Alignment.center,
              child: Text('Pergunta:\n\n ${quiz[perguntaNumero - 1]['pergunta']}')
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(100,20,100,20)
              ),
              onPressed: (){

              }, 
              child:const  Text('Resposta 1',style: TextStyle(fontSize: 20),)),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(100,20,100,20)
              ),
              onPressed: (){

              }, 
              child:const  Text('Resposta 2',style: TextStyle(fontSize: 20),)),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(100,20,100,20)
              ),
              onPressed: (){

              }, 
              child:const  Text('Resposta 3',style: TextStyle(fontSize: 20),)),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(100,20,100,20)
              ),
              onPressed: (){

              }, 
              child:const  Text('Resposta 4',style: TextStyle(fontSize: 20),))
          ],
        )),
      ),
    );
  }
}