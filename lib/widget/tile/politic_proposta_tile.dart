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
import '../tag/tag_proposta.dart';
import '../text_rich.dart';

class PoliticPropostaTile extends StatelessWidget {
  PoliticPropostaTile(this.proposta, {this.clickableImage});

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Divider(height: 1),
        CardBase(
          slotLeft: _buildLeftContent(),
          slotCenter: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopContent(),
              _buildCenterContent(),
            ],
          ),
          slotBottom: _buildActions(context),
          onTap: () => SimpleRouter.forward(
            PostPageConnected(
              post: proposta,
              postType: PostType.PROPOSICAO,
            ),
            name: POST_PAGE,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: TagProposta(proposta),
        ),
      ],
    );
  }

  Widget _buildLeftContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Photo(url: proposta.fotoPolitico),
        onTap: () => clickableImage
            ? SimpleRouter.forward(
                PoliticProfilePageConnected(proposta.idPoliticoAutor),
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
              proposta.nomePolitico,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$POLITIC'
              ' · ${proposta.siglaPartido}'
              ' · ${proposta.estadoPolitico}',
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
        if (proposta.descricaoTipo == PLENARY_AMENDMENT)
          Text('${proposta.descricaoTipo}')
        else
          TextRich(
            maxLines: 4,
            children: [
              TextSpan(
                text: '${proposta.descricaoTipo}: ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(text: '${proposta.ementa}'),
            ],
          ),
        if (proposta.foiAtualizada)
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 4),
            child: TextRich(
              maxLines: 4,
              children: [
                const TextSpan(
                  text: 'Atualização: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '${proposta.despacho}'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Padding(
        padding: const EdgeInsets.only(right: 4, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              proposta.dataAtualizacao.formatDate() ?? NOT_INFORMED_FEMALE,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
