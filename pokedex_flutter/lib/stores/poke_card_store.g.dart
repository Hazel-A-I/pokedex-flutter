// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokeCardStore on _PokeCardStore, Store {
  late final _$isHoveredAtom =
      Atom(name: '_PokeCardStore.isHovered', context: context);

  @override
  bool get isHovered {
    _$isHoveredAtom.reportRead();
    return super.isHovered;
  }

  @override
  set isHovered(bool value) {
    _$isHoveredAtom.reportWrite(value, super.isHovered, () {
      super.isHovered = value;
    });
  }

  late final _$isPressedAtom =
      Atom(name: '_PokeCardStore.isPressed', context: context);

  @override
  bool get isPressed {
    _$isPressedAtom.reportRead();
    return super.isPressed;
  }

  @override
  set isPressed(bool value) {
    _$isPressedAtom.reportWrite(value, super.isPressed, () {
      super.isPressed = value;
    });
  }

  late final _$_PokeCardStoreActionController =
      ActionController(name: '_PokeCardStore', context: context);

  @override
  void setHovered(bool hovered) {
    final _$actionInfo = _$_PokeCardStoreActionController.startAction(
        name: '_PokeCardStore.setHovered');
    try {
      return super.setHovered(hovered);
    } finally {
      _$_PokeCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPressed(bool pressed) {
    final _$actionInfo = _$_PokeCardStoreActionController.startAction(
        name: '_PokeCardStore.setPressed');
    try {
      return super.setPressed(pressed);
    } finally {
      _$_PokeCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHovered: ${isHovered},
isPressed: ${isPressed}
    ''';
  }
}
