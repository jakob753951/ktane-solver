class Edgework {
  Batteries batteries;
  String serial;
  List<Indicator> indicators;
  List<PortPlate> portPlates;

  Edgework(this.batteries, this.indicators, this.serial, this.portPlates);

  Edgework.fromStringList(List<String> stringList)
      : batteries = Batteries.fromString(stringList[0]),
        indicators = stringList[1]
            .split(' ')
            .map((indicatorString) => Indicator.fromString(indicatorString))
            .toList(),
        serial = stringList[2],
        portPlates = RegExp(r'\[[\w\ ]*\]')
            .allMatches(stringList[3])
            .map((match) => PortPlate.fromString(match.group(0)!))
            .toList();

  Edgework.fromString(String inString)
      : this.fromStringList(inString.split(' // '));

  int get lastDigitInSerialNumber =>
      int.parse(serial[serial.lastIndexOf(RegExp('[0-9]'))]);

  @override
  String toString() => [
        batteries,
        indicators.join(' '),
        serial,
        portPlates.map((plateString) => '[$plateString]').join(' ')
      ].join(' // ');
}

class Batteries {
  int amount;
  int holders;

  Batteries(this.amount, this.holders);

  // format: 3B5H
  Batteries.fromString(String inString)
      : amount = int.parse(inString[0]),
        holders = int.parse(inString[2]);

  @override
  String toString() => "${amount}B${holders}H";
}

class Indicator {
  String label;
  bool lit;

  Indicator(this.label, this.lit);

  Indicator.fromString(String indicatorString)
      : label = indicatorString.replaceAll('*', '').toUpperCase(),
        lit = indicatorString.endsWith('*');

  @override
  String toString() => "$label${lit ? '*' : ''}";
}

class PortPlate {
  List<Port> ports;

  PortPlate(this.ports);

  PortPlate.fromString(String inString)
      : this.fromStringList(
            inString.substring(1, inString.length - 1).split(' '));

  PortPlate.fromStringList(List<String> inStrings)
      : this.ports = inStrings
            .map((portString) =>
                Port.values.firstWhere((port) => port.name == portString))
            .toList();

  @override
  String toString() =>
      ports.map((port) => port.toString().split('.').last).join(' ');
}

enum Port { DVI, Parallel, PS, RJ, Serial, RCA }
