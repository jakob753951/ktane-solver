import 'Module.dart';
import 'Edgework.dart';

class Bomb {
  Bomb(this.edgework, this.modules);

  Edgework edgework;
  List<Module> modules;

  void solve() => modules.forEach((module) => module.solve(edgework));
}
