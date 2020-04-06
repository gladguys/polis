import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_politic/bloc.dart';
import '../../../model/models.dart';
import '../../../widget/field_search.dart';
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
          child: SearchPoliticsList(politics),
        ),
        PopupFilterSearch(
          partidos: partidos,
          searchPoliticBloc: context.bloc<SearchPoliticBloc>(),
        ),
      ],
    );
  }
}

class PopupFilterSearch extends StatefulWidget {
  const PopupFilterSearch({
    @required this.partidos,
    @required this.searchPoliticBloc,
  })  : assert(partidos != null),
        assert(searchPoliticBloc != null);

  final List<PartidoModel> partidos;
  final SearchPoliticBloc searchPoliticBloc;

  @override
  State<StatefulWidget> createState() => _PopupFilterSearchState();
}

class _PopupFilterSearchState extends State<PopupFilterSearch> {
  bool isOpen;
  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    isOpen = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: FieldSearch(
          onChanged: (term) => widget.searchPoliticBloc
              .add(ChangeSearchPoliticFilter(term: term)),
          onPressedSuffix: _openFilter,
        ),
      ),
    );
  }

  _openFilter() {
    setState(() => isOpen = !isOpen);

    if (isOpen) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
    } else {
      _overlayEntry.remove();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          right: 16,
          bottom: 95,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(size.width - 268, -145),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              color: Colors.white,
              child: Container(
                height: isOpen ? 146 : 0,
                width: 250,
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 12,
                  children: <Widget>[
                    EstadoSelect(
                      initialValue: widget.searchPoliticBloc.statePicked,
                      onChange: (estado) => widget.searchPoliticBloc
                          .add(ChangeSearchPoliticFilter(estado: estado)),
                    ),
                    PartidoSelect(
                      partidos: widget.partidos,
                      initialValue: widget.searchPoliticBloc.partidoPicked,
                      onChange: (partido) => widget.searchPoliticBloc
                          .add(ChangeSearchPoliticFilter(partido: partido)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
