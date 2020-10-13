import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/rendering.dart';

class _STreinamento8 extends STreinamentoBase<Exercicio8> {
  void iniciarExercicio() {
    definirRequisitos(1, 1, "null", false);
  }

  @override
  Widget build(BuildContext context) {
    int respsPerSeq = 2;
    defReqs(String l) {
      Map lado = {
        "E": [respsPerSeq, 19, exercicios["Ex8"]["Esq"], true],
        "D": [respsPerSeq, 17, exercicios["Ex8"]["Dir"], true]
      };
      setState(
        () {
          definirRequisitos(lado[l][0], lado[l][1], lado[l][2], lado[l][3]);
          playBack = Playback(
            whenEnd: () {
              if (sequencia < sons.length - 1) {
                setState(() {
                  sequencia++;
                  subarr = 0;
                  respostas = (sequencia - 1) * numRPS;
                  tocarSequencia();
                });
              } else {
                irParaResultados(context);
              }
            },
          );
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 8"),
        body: Stack(
          children: [
            ...[
              if (sequencia == 0) jmpBtn(),
              Column(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Row(
                      children: [
                        ...respostasDadasL.map(
                          (e) => Text(
                            (e.toString() != "null") ? e.toString() + " " : " ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TecladoNumerico(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    aoPressionar:
                        (sequencia > 0 || sons[sequencia].contains("Aviso"))
                            ? (arr <= sequencia - 1)
                                ? (String txt) => responder(txt)
                                : null
                            : null,
                    textColor: Colors.white,
                    backgroundColor: secondary,
                    buttonsColor: corDeDestaque,
                  ),
                ],
              ),
            ],
            if (sequencia == 0 && playBack.playing == false) ...[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromRGBO(0, 0, 0, 0.5),
                child: Column(
                  children: [
                    Spacer(flex: 3),
                    textInstruct("Escolha um lado para começar o exercício"),
                    Spacer(flex: 2),
                    Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        SideButton(
                          "Esquerda",
                          () => defReqs("E"),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SideButton(
                          "Direita",
                          () => defReqs("D"),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Exercicio8 extends StatefulWidget {
  STreinamentoBase<Exercicio8> createState() {
    return _STreinamento8();
  }
}
