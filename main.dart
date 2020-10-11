import 'Bomb.dart';
import 'Edgework.dart';
import 'Modules/Button.dart';
import 'Modules/Wires.dart';

main() {
  Batteries batteries = Batteries.fromString('1B1H');
  List<Indicator> indicators = [
    Indicator.fromString('FRK*'),
    Indicator.fromString('SND*'),
    Indicator.fromString('CAR')
  ];
  String serial = 'QE2EZ4';
  List<PortPlate> portPlates = [
    PortPlate.fromString('[Parallel]'),
    PortPlate.fromStringList(['Serial', 'RJ']),
    PortPlate.fromPortList([Port.DVI, Port.RCA])
  ];

  Edgework edgework = Edgework(batteries, indicators, serial, portPlates);

  Bomb bomb = Bomb(edgework);

  print(bomb.edgework);

  bomb.modules.add(Wires('BBKR'));
  bomb.modules.add(Button(Colour.Red, ButtonText.Detonate));

  bomb.modules.forEach((module) => module.Solve(bomb.edgework));
}
