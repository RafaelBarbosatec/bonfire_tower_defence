import 'package:bonfire/bonfire.dart';

abstract class Defender extends SimpleAlly {
  Defender({
    required super.position,
    required super.size,
    super.animation,
    super.initDirection,
  });

  void showRadiusVision(bool show);
}
