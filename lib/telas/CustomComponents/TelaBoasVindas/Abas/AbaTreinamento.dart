import 'package:AuditechMobile/telas/routes.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaTreinamento extends StatelessWidget {
  Widget build(BuildContext context) {
    void irParaTreino() {
      Navigator.push(
          context, MaterialPageRoute(builder: routes["treinamento-aviso"]));
    }

    List<Map<String, dynamic>> components = [
      {"texto": "Exercício 1", "método": irParaTreino},
      {"texto": "Exercício 2", "método": irParaTreino},
      {"texto": "Exercício 3", "método": irParaTreino},
      {"texto": "Exercício 4", "método": irParaTreino},
    ];
    double space = 30;
    return GridView.count(
      padding: EdgeInsets.all(space),
      crossAxisCount: 2,
      crossAxisSpacing: space,
      mainAxisSpacing: space,
      children: [
        ...components.map(
          (e) => ButtonTreinamento(e["texto"], e["método"]),
        ),
      ],
    );
  }
}