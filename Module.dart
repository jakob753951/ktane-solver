import 'Edgework.dart';

abstract class Module {
  Module(this.name);

  String name;

  void solve(Edgework edgework);
}
