import 'package:mobx/mobx.dart';

part 'poke_card_store.g.dart';

class PokeCardStore = _PokeCardStore with _$PokeCardStore;

abstract class _PokeCardStore with Store {
  @observable
  bool isHovered = false;

  @observable
  bool isPressed = false;

  @action
  void setHovered(bool hovered) {
    isHovered = hovered;
  }

  @action
  void setPressed(bool pressed) {
    isPressed = pressed;
  }
}
