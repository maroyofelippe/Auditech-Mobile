import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'treinamentos.dart';

class STreinamento3 extends STreinamentoBase<ExercicioCentral> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() async {
    definirRequisitos(1, exercicios["Ex3"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Pássaro", "método": podeAvancar("P")},
        "s1",
        {"nome": "Gato", "método": podeAvancar("G")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Cavalo", "método": podeAvancar("C")},
        "s1",
        {"nome": "Bode", "método": podeAvancar("B")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 3"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                VisorDeRespostas(
                  respostasDadasL,
                  direcao: VisorDirecao.HORIZONTAL,
                ),
                // Adiciona os componentes de forma dinâmica
                if (respostas < respostasDadasL.length)
                  addDynamicComponents(selecoes),
              ],
            ),
            if (sequencia == 0) jmpBtn(),
          ],
        ),
      ),
    );
  }
}
