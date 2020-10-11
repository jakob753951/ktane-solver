import 'dart:io';

import '../Edgework.dart';
import '../Module.dart';

class Button extends Module {
  Button(this.colour, this.text) : super("Button");

  Colour colour;
  ButtonText text;

  @override
  void Solve(Edgework edgework) {
    if (toTap(edgework)) {
      print('Tap the button');
      return;
    }

    print('Hold the button, and enter the colour of the strip here: ');

    Colour colour = Colour.values.firstWhere(
        (colour) => colour.toString().split('.').last == stdin.readLineSync());

    print(
        'Release when the countdown timer has a ${getStrip(colour)} in any position');
  }

  bool toTap(Edgework edgework) {
    if (this.colour == Colour.Red && this.text == ButtonText.Hold) return true;
    if (edgework.batteries.amount >= 2 && this.text == ButtonText.Detonate)
      return true;
    if (this.colour == Colour.Blue && this.text == ButtonText.Abort)
      return false;
    if (edgework.indicators
        .any((indicator) => indicator.lit && indicator.label == 'CAR'))
      return false;
    if (edgework.batteries.amount >= 3 &&
        edgework.indicators
            .any((indicator) => indicator.lit && indicator.label == 'FRK'))
      return true;
    return false;
  }

  getStrip(Colour colour) {
    switch (colour) {
      case Colour.Blue:
        return 4;
      case Colour.Yellow:
        return 5;
      default:
        return 1;
    }
  }
}

enum Colour { Red, Blue, White, Yellow }
enum ButtonText { Hold, Detonate, Abort }
