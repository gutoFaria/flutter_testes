import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

main(){
  runApp(GameWidget(game: MyCircle()));
}

class MyCircle with Game{
  

  @override
  Future<void> onLoad() async{
    super.onLoad();
  }

  @override
  void render(Canvas canvas){
    canvas.drawCircle(
      const Offset(10,10), 
      10, 
      BasicPalette.red.paint()
    );
  }

  @override
  void update(double deltaTime){}
}




