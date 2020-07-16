import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/blocs.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/label.dart';
import '../../../core/keys.dart';
import '../../../widget/field_rounded.dart';
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

  @override
  void initState() {
    isOpen = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 1, color: Colors.grey[300]),
        _buildFilter(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 16),
            FieldRounded(
              hintText: SEARCH_HERE,
              width: 240,
              iconPrefix: FontAwesomeIcons.search,
              onChanged: (term) => widget.searchPoliticBloc
                  .add(ChangeSearchPoliticFilter(term: term)),
            ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              child: OutlineButton(
                key: searchPoliticsSlidersIconKey,
                color: Theme.of(context).primaryColor,
                highlightedBorderColor: Theme.of(context).primaryColorDark,
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                padding: EdgeInsets.zero,
                child: FaIcon(
                  FontAwesomeIcons.slidersH,
                  size: 18,
                ),
                onPressed: () => setState(() => isOpen = !isOpen),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildFilter() {
    return AnimatedContainer(
      duration: 300.milliseconds,
      width: 301,
      height: isOpen ? 64 : 0,
      margin: isOpen ? const EdgeInsets.only(top: 8) : EdgeInsets.zero,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              PartidoSelect(
                partidos: widget.partidos,
                initialValue: widget.searchPoliticBloc.partidoPicked,
                onChange: (partido) => widget.searchPoliticBloc
                    .add(ChangeSearchPoliticFilter(partido: partido)),
              ),
              VerticalDivider(
                width: 1,
                color: Colors.grey[350],
              ),
              EstadoSelect(
                initialValue: widget.searchPoliticBloc.statePicked,
                onChange: (estado) => widget.searchPoliticBloc
                    .add(ChangeSearchPoliticFilter(estado: estado)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
