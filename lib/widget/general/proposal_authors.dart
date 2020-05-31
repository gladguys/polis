import 'package:flutter/material.dart';

import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../label_value.dart';

class ProposalAuthors extends StatefulWidget {
  ProposalAuthors(this.nomesAutores, {this.quantidadeAutores = 3});

  final List<String> nomesAutores;
  final int quantidadeAutores;

  @override
  _ProposalAuthorsState createState() => _ProposalAuthorsState();
}

class _ProposalAuthorsState extends State<ProposalAuthors> {
  List<String> get nomesAutores => widget.nomesAutores;
  int get quantidadeAutores => widget.quantidadeAutores;

  bool mostrarTodos = false;

  @override
  Widget build(BuildContext context) {
    return mostrarTodos
        ? Stack(
            children: <Widget>[
              LabelValue(
                label: AUTHORS,
                value: _getAuthorsNamesFormatted(nomesAutores, ''),
                emptyValue: NOT_INFORMED,
              ),
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: () => setState(() => mostrarTodos = false),
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    key: dontShowAllIconKey,
                    size: 18,
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: <Widget>[
              LabelValue(
                label: AUTHORS,
                value: _getAuthorsNamesFormatted(
                    _getMinimumAuthorsFromList(nomesAutores, quantidadeAutores),
                    '...'),
                emptyValue: NOT_INFORMED,
              ),
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: () => setState(() => mostrarTodos = true),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      key: doShowAllIconKey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  List<String> _getMinimumAuthorsFromList(List<String> authors, int qtd) {
    final authorsLength = authors.length;
    if (authors.isEmpty) {
      return [];
    } else if (authorsLength >= qtd) {
      return authors.sublist(0, qtd);
    }
    return authors.sublist(0, authorsLength);
  }

  String _getAuthorsNamesFormatted(List<String> authors, String replacement) {
    if (authors.isNotEmpty) {
      final allAuthors = authors.fold('', (nome, nomes) => '$nomes, $nome');
      final lastComma = allAuthors.lastIndexOf(',');
      return allAuthors.replaceRange(lastComma, lastComma + 1, replacement);
    }
    return '';
  }
}
