class Edgework {
  Edgework(this.batteries, this.indicators, this.serial, this.portPlates);

  Edgework.fromStringList(List<String> stringList) {
    this.batteries = Batteries.fromString(stringList[0]);
    this.indicators = stringList[1]
        .split(' ')
        .map((indicatorString) => Indicator.fromString(indicatorString))
        .toList();
    this.serial = stringList[2];

    var matches = RegExp(r'\[(\w|\ )*\]').allMatches(stringList[3]);
    this.portPlates =
        matches.map((match) => PortPlate.fromString(match.group(0))).toList();
  }

  Edgework.fromString(String inString)
      : this.fromStringList(inString.split(' // '));

  Batteries batteries;
  List<Indicator> indicators;
  String serial;
  List<PortPlate> portPlates;

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
  Batteries();

  Batteries.fromString(String inString) {
    this.amount = int.parse(inString[0]);
    this.holders = int.parse(inString[2]);
  }

  int amount;
  int holders;

  @override
  String toString() => "${amount}B${holders}H";
}

class Indicator {
  Indicator();

  Indicator.fromString(String inString) {
    this.lit = inString.endsWith('*');
    this.label =
        inString.substring(0, inString.length - (lit ? 1 : 0)).toUpperCase();
  }

  String label;
  bool lit;

  @override
  String toString() => "$label${lit ? '*' : ''}";
}

class PortPlate {
  List<Port> ports;

  PortPlate();

  PortPlate.fromString(String inString)
      : this.fromStringList(
            inString.substring(1, inString.length - 1).split(' '));

  PortPlate.fromStringList(List<String> inStrings) {
    this.ports = inStrings
        .map((portString) => Port.values.firstWhere(
            (port) => port.toString().split('.').last == portString))
        .toList();
  }
  PortPlate.fromPortList(this.ports);

  @override
  String toString() =>
      ports.map((port) => port.toString().split('.').last).join(' ');
}

enum Port { DVI, Parallel, PS, RJ, Serial, RCA }
