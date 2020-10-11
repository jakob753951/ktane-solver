import '../Edgework.dart';
import '../Module.dart';

class Wires extends Module {
  Wires(this.wires) : super("Wires");

  String wires;

  @override
  String Solve(Edgework edgework) => 'Cut wire: ${wireToCut(edgework)}';

  int wireToCut(Edgework edgework) {
    switch (this.wires.length) {
      case 3:
        {
          if ((count('B') == 2 && count('R') == 1)) return 2;
          if (count('R') == 0) return 2;
          return 3;
        }
      case 4:
        {
          if (count('R') >= 2 && edgework.lastDigitInSerialNumber % 2 != 0)
            return wires.lastIndexOf('R');

          if (this.wires[this.wires.length - 1] == 'Y' && count('R') == 0)
            return 1;

          if (count('B') == 1) return 1;
          if (count('Yellow') >= 2) return 4;
          return 2;
        }
      case 5:
        {
          if (this.wires[this.wires.length - 1] == 'K' &&
              edgework.lastDigitInSerialNumber % 2 != 0) return 4;
          if (count('R') == 1 && count('Y') >= 2) return 1;
          if (count('K') == 0) return 2;
          return 1;
        }
      case 6:
        {
          if (count('Y') == 0 && edgework.lastDigitInSerialNumber % 2 != 0)
            return 3;
          if (count('Y') == 1 && count('W') >= 2) return 4;
          if (count('R') == 0) return 6;
          return 4;
        }
      default:
        {
          throw Exception(
              'Invalid wire count! Expected 3-6, but got ${this.wires.length}');
        }
    }
  }

  int count(letter) => letter.allMatches(this.wires).length;
}
