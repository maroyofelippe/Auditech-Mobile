import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TipoEntrada {
  CPF,
  DT,
}

extension TipoEntrda2 on TipoEntrada {
  TextInputType get type {
    TextInputType toReturn;
    switch (this) {
      case TipoEntrada.CPF:
        toReturn = TextInputType.number;
        break;
      case TipoEntrada.DT:
        toReturn = TextInputType.datetime;
        break;
    }
    return toReturn;
  }
}

class TextFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String dica;
  final bool obscure;
  final TipoEntrada tipo;
  final BorderRadius borderRadius;
  final TextInputAction action;
  final double widthScale;
  final Widget icon;
  final void Function(String value) whenSubmit;

  TextFieldLogin({
    this.controller,
    this.dica,
    this.obscure,
    this.tipo,
    this.action,
    this.widthScale = 0.8,
    this.icon,
    this.whenSubmit,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(5),
    ),
  });

  Widget build(BuildContext context) {
    TextField textfield;
    textfield = TextField(
      onSubmitted: whenSubmit,
      textInputAction: action,
      keyboardType: tipo.type,
      style: TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: dica,
        hintStyle: TextStyle(color: Colors.grey),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
      obscureText: obscure,
    );
    return Container(
      child: textfield,
      width: MediaQuery.of(context).size.width * widthScale,
    );
  }

  String get text {
    return controller.text;
  }
}
