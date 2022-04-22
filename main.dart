import 'Bomb.dart';
import 'Edgework.dart';
import 'Modules/Button.dart';
import 'Modules/Wires.dart';

main() {
  Batteries batteries = Batteries.fromString('1B1H');
  String serial = 'QE2EZ4';
  List<Indicator> indicators = [
    Indicator.fromString('FRK*'),
    Indicator.fromString('SND*'),
    Indicator.fromString('CAR')
  ];
  List<PortPlate> portPlates = [
    PortPlate.fromString('[Parallel]'),
    PortPlate.fromStringList(['Serial', 'RJ']),
    PortPlate([Port.DVI, Port.RCA])
  ];

  Edgework edgework1 = Edgework(batteries, indicators, serial, portPlates);

  Edgework edgework2 = Edgework.fromString(
      '2B1H // QE2EZ4 // FRK* SND* CAR // [Parallel] [Serial RJ] [DVI RCA]');

  Bomb bomb1 =
      Bomb(edgework1, [Wires('BBKR'), Button(Colour.Red, ButtonText.Detonate)]);
  Bomb bomb2 =
      Bomb(edgework2, [Wires('BBKR'), Button(Colour.Red, ButtonText.Detonate)]);

  print(bomb1.edgework);
  print(bomb2.edgework);

  bomb1.solve();
  bomb2.solve();
}
