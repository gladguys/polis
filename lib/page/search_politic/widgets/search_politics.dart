import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_politic/bloc.dart';
import '../../../model/partido_model.dart';
import '../../../model/politico_model.dart';
import '../../../widget/select/selects.dart';
import 'search_politics_list.dart';

class SearchPolitics extends StatelessWidget {
  SearchPolitics({@required this.politics, @required this.partidos})
      : assert(politics != null),
        assert(partidos != null);

  final List<PoliticoModel> politics;
  final List<PartidoModel> partidos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: SearchPoliticsList(politics),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: EstadoSelect(
              initialValue: context.bloc<SearchPoliticBloc>().statePicked,
              onChange: (estado) => context
                  .bloc<SearchPoliticBloc>()
                  .add(ChangeSearchPoliticFilter(estado: estado)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: PartidoSelect(
              partidos: partidos,
              initialValue: context.bloc<SearchPoliticBloc>().partidoPicked,
              onChange: (partido) => context
                  .bloc<SearchPoliticBloc>()
                  .add(ChangeSearchPoliticFilter(partido: partido)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 26,
                  color: Colors.black,
                ),
                hintText: 'Pesquise...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (term) => context
                  .bloc<SearchPoliticBloc>()
                  .add(ChangeSearchPoliticFilter(term: term)),
            ),
          ),
        ),
      ],
    );
  }
}
