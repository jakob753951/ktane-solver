import 'Edgework.dart';

abstract class Module {
  Module(this.name);

  String name;

  String Solve(Edgework edgework);
}
