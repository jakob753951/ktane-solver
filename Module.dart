import 'Edgework.dart';

abstract class Module {
  Module(this.name);

  String name;

  void Solve(Edgework edgework);
}
