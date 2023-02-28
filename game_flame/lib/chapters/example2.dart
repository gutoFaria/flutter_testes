import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';


class MyCircle extends PositionComponent{
  MyCircle() : super();

  @override
  Future<void> onLoad() async{}

  @override
  void render(Canvas canvas){
    canvas.drawCircle(
      const Offset(10,10), 
      10, 
      BasicPalette.red.paint()
    );
  }
}

class MyGame extends FlameGame{
  @override
  Future<void> onLoad() async{
    await add(MyCircle());
  }
}

main(){
  runApp(GameWidget(game: MyGame()));
}
