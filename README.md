# Flutter Flame Collision Detection Minimal Example

This is example code for a short overview video on Flame
Collision Detection.

* [Flutter Games Collision Detection with Flame Overview](https://youtu.be/VzN_AZ8xT3s)

![screenshot](docs/images/screenshot.png)

## Add HasCollidables to BaseGame

In your `BaseGame`, add `HasCollidables`

```dart
class MyGame extends BaseGame with HasCollidables {
  Future<void> onLoad() async {
    print('loading assets');
    var girlSprite = await loadSprite('girl.png');
```

If you are new to Flutter and Flame, watch 
[What is the Fltuter Game Engine and When to Use It](https://youtu.be/cAormNbZPF8).

If you need to install Flame v1.0
watch [Set Up Flame v1.0 on Flutter to Build Mobile App Games](https://youtu.be/b9KVHKgsZEQ).
Important: Flame v1.0 is in the release candidate stage as of March 2021

[Playlist of 8 Flutter Flame tutorials](https://youtube.com/playlist?list=PLxvyAnoL-vu49mglrFB5_GlubMWzYqp68)

## Add Collidable and Hitbox to Sprite

```dart
class NorthGirl extends SpriteComponent with Hitbox, Collidable {
  NorthGirl(Sprite sprite) {
    this.sprite = sprite;
```

## Detect Collision

```dart
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    print('something was hit');
    _collision = true;
  }
```