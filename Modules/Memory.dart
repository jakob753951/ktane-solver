import '../Edgework.dart';
import '../Module.dart';

class Memory extends Module {
  int stage = 1;
  late int display;
  late List<int> buttons;

  Memory(this.stage) : super('Memory');

  @override
  void solve(Edgework edgework) {}

  void solveStage() {}
}
