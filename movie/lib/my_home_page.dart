import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> database = List<String>.empty();
  int index = -1;

  String correctAnswer = "", suggest="";

  Map<int,int> correctAnswerKey = {};
  Map<int,int> showSuggestAnswerMap = {};
  Map<int,int> showCorrectAnswerMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{ 
      await addToDatabaseFromAssets();
      if(database.length > 0){
        startGame();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Logo Quiz')),
        actions: [
          IconButton(icon:const Icon(Icons.refresh),onPressed: (){},),
          IconButton(icon:const Icon(Icons.help),onPressed: (){},),
        ],
      ),
      body: database.isNotEmpty ?
      Padding(padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          const SizedBox(height: 30),
          database.length > 0 ? Expanded(flex:2,child: 
          Image.asset(database[index])):
          Container()
        ]
      ))
      :
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
  Future addToDatabaseFromAssets()  async{
    final manifestContent = await DefaultAssetBundle.of(context)
      .loadString('AssetManifest.json');
    final Map<String,dynamic> manifestMap = json.decode(manifestContent);
    final imagePaths = manifestMap.keys
      .where((element) => element.contains('assets/'))
      .where((element) => element.contains('.png'))
      .toList();

      setState(() {
        database = imagePaths;
      });
  }
  
  void startGame() {

    correctAnswer = suggest = "";
    showCorrectAnswerMap.clear();
    showCorrectAnswerMap.clear();
    correctAnswerKey.clear();

    var lastIndex = index;
    do{
      index = Random().nextInt(database.length -1);
    }while(index == lastIndex);

    correctAnswer = database[index]
      .substring(database[index].lastIndexOf('/')+1,
    database[index].lastIndexOf('.')).toUpperCase();

    suggest = randomWithAnswer(correctAnswer).toUpperCase();
  
    var list = suggest.runes.toList();
    list.shuffle();
    list.asMap().forEach((key, value) {
      showSuggestAnswerMap.putIfAbsent(key, () => -1);
    });
  }
  
  String randomWithAnswer(String correctAnswer) {
    const aToZ = 'abcdefghijklmnopqrstuvwxyz';
    int originalLength = correctAnswer.length;
    var randomText="";
    for(int i =0; i < originalLength;i++){
      randomText += aToZ[Random().nextInt(aToZ.length)];
    }

    randomText = String.fromCharCodes(randomText.runes.toSet().toList());

    correctAnswer += randomText;
    return correctAnswer;

  }
}