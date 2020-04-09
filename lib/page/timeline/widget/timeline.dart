import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class Timeline extends StatefulWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  String currentHoverDate;

  @override
  void initState() {
    currentHoverDate = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.separated(
          padding: const EdgeInsets.only(top: 8),
          itemBuilder: (_, i) {
            if (widget.activities[i] is DespesaModel) {
              return VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (visibility) {
                  if (visibility.visibleFraction == 1.0) {
                    final despesa = widget.activities[i] as DespesaModel;
                    setState(() => currentHoverDate = despesa.dataDocumento);
                  }
                },
                child:
                    DespesaTileConnected(widget.activities[i] as DespesaModel),
              );
            } else {
              return VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (visibility) {
                  if (visibility.visibleFraction == 1.0) {
                    final proposta = widget.activities[i] as PropostaModel;
                    setState(() => currentHoverDate = proposta.dataDocumento);
                  }
                },
                child: PropostaTileConnected(
                    widget.activities[i] as PropostaModel),
              );
            }
          },
          separatorBuilder: (_, i) => const Divider(
            height: 16,
            indent: 8,
            endIndent: 8,
          ),
          itemCount: widget.activities.length,
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 40,
          child: Container(
            child: Text(currentHoverDate),
            height: 40,
            width: 120,
            color: Colors.blueAccent,
          ),
        )
      ],
    );
  }
}
