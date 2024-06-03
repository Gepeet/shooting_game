import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

void main(){
   runApp(GameWidget(game:SpaceShootingGame()));
}

class SpaceShootingGame extends FlameGame with PanDetector{
   late Player player;

   @override
   Future<void>onLoad() async {
      player = Player();
      add(player);
   }

   @override
   void onPanUpdate(DragUpdateInfo info){
      player.move(info.delta.global);
   }
}

class Player extends SpriteComponent with HasGameReference<SpaceShootingGame>{

   Player()
      :super(
         size: Vector2(80,100),
         anchor: Anchor.center,
      );

   @override
   Future<void> onLoad() async{
      await super.onLoad();

      sprite = await game.loadSprite('player-sprite.png');

      position = game.size/2;
      anchor = Anchor.center;
   }


   void move(Vector2 delta){
      position.add(delta);
   }
}
