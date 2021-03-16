import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() {
  var game = MyGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}

class MyGame extends BaseGame with HasCollidables {
  Future<void> onLoad() async {
    print('loading assets');
    var girlSprite = await loadSprite('girl.png');
    var girl = Girl(girlSprite, size[0]);
    add(girl);
    add(NorthGirl(await loadSprite('woman.png')));
  }
}

class NorthGirl extends SpriteComponent with Hitbox, Collidable {
  NorthGirl(Sprite sprite) {
    this.sprite = sprite;
    size = Vector2(100.0, 100.0);
    position = Vector2(500.0, 200.0);
    debugMode = true;
    anchor = Anchor.center;
    addShape(HitboxRectangle());
  }
}

class Girl extends SpriteComponent with Hitbox, Collidable {
  final double _gameWidth;
  bool _collision = false;

  Girl(Sprite sprite, double gameWidth) : _gameWidth = gameWidth {
    this.sprite = sprite;
    size = Vector2(100.0, 100.0);
    position = Vector2(100.0, 200.0);
    debugMode = true;
    anchor = Anchor.center;
    addShape(HitboxRectangle());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (this.x > _gameWidth) {
      print('remove character');
      remove();
    } else {
      this.x += 1;
    }
    if (_collision) {
      print('hit');
      remove();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    print('something was hit');
    _collision = true;
  }
}
