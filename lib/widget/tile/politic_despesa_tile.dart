import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../card_base.dart';
import '../photo.dart';
import '../tag/tag_despesa.dart';
import '../text_rich.dart';

class PoliticDespesaTile extends StatelessWidget {
  PoliticDespesaTile(this.despesa, {this.clickableImage});

  final DespesaModel despesa;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Divider(height: 1),
        CardBase(
          slotLeft: _buildLeftContent(),
          slotCenter: BlocBuilder<PostBloc, PostState>(
            builder: (_, state) => state.join(
              _mapStateToWidget,
              _mapStateToWidget,
              _mapStateToWidget,
              _mapStateToWidget,
              _mapStateToWidget,
            ),
          ),
          slotBottom: _buildActions(context),
          onTap: () => SimpleRouter.forward(
            PostPageConnected(
              post: despesa,
              postType: PostType.DESPESA,
            ),
            name: POST_PAGE,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: TagDespesa(),
        ),
      ],
    );
  }

  Widget _mapStateToWidget(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTopContent(),
        _buildCenterContent(),
      ],
    );
  }

  Widget _buildLeftContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Photo(url: despesa.fotoPolitico),
        onTap: () => clickableImage
            ? SimpleRouter.forward(
                PoliticProfilePageConnected(despesa.idPolitico),
                name: POLITIC_PROFILE_PAGE,
              )
            : null,
      ),
    );
  }

  Widget _buildTopContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 14),
            Text(
              despesa.nomePolitico,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$POLITIC · ${despesa.siglaPartido} · ${despesa.estadoPolitico}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCenterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        TextRich(
          children: [
            TextSpan(
              text: '${despesa.tipoAtividade.capitalizeUpperCase()}'
                  ' $WITH '
                  '${despesa.tipoDespesa.toLowerCase().removeDot()}'
                  ' $IN_THE_AMOUNT_OF ',
            ),
            TextSpan(
              text: '${despesa.valorLiquido.formatCurrency()}.',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => state.join(
        _mapActionsStateToWidget,
        _mapActionsStateToWidget,
        _mapActionsStateToWidget,
        _mapActionsStateToWidget,
        _mapActionsStateToWidget,
      ),
    );
  }

  Widget _mapActionsStateToWidget(state) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${despesa.dataDocumento.formatDate()}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
