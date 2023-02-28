import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class MySprite extends SpriteComponent{
  MySprite() : super(size: Vector2.all(16));

  @override
  Future<void> onLoad() async{
    sprite = await Sprite.load('assets/image.png');
  }
}


class MyGame extends FlameGame{
  @override
  Future<void> onLoad() async{
    await add(MySprite());
  }
}

main(){
  runApp(GameWidget(game: MyGame()));
}