import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/proposta_model.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../../page/post/widget/like_post_button.dart';
import '../../page/post/widget/unlike_post_button.dart';
import '../../page/theme/main_theme.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../general/proposal_authors.dart';
import '../image/photo_image.dart';
import '../label_value.dart';
import '../photo.dart';
import '../text_rich.dart';

class PostProposta extends StatelessWidget {
  PostProposta(this.proposta, {@required this.screenshotController})
      : assert(proposta != null),
        assert(screenshotController != null);

  final PropostaModel proposta;
  final ScreenshotController screenshotController;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: context.baseBackgroundColor,
        child: CardBase(
          slotLeft: _buildLeftContent(),
          slotCenter: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopContent(),
              _buildCenterContent(context),
            ],
          ),
          slotBottom: _buildActions(context),
        ),
      ),
    );
  }

  Widget _buildLeftContent() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(24),
          child: Photo(url: proposta.fotoPolitico),
          onTap: () => SimpleRouter.forward(
            PoliticProfilePageConnected(proposta.idPoliticoAutor),
            name: POLITIC_PROFILE_PAGE,
          ),
        ),
        Positioned(
          right: 0,
          bottom: -10,
          child: PhotoImage(
            url: proposta.urlPartidoLogo,
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildTopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          proposta.nomePolitico,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$POLITIC · ${proposta.siglaPartido} · ${proposta.estadoPolitico}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: <Widget>[
          if (proposta.descricaoTipo == PLENARY_AMENDMENT)
            Row(children: [
              Text('${proposta.descricaoTipo}'),
            ])
          else
            TextRich(
              children: [
                TextSpan(
                  text: '${proposta.descricaoTipo}: ',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '${proposta.ementa ?? NOT_INFORMED_FEMALE}'),
              ],
            ),
          if (proposta.foiAtualizada)
            LabelValue(
              label: UPDATE,
              value: proposta.despacho,
            ),
          LabelValue(
            label: TRAMITATION,
            value: proposta.descricaoTramitacao,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: DISPATCH,
            value: proposta.despacho,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: SITUATION,
            value: proposta.descricaoSituacao,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: UPDATE_DATE,
            value: proposta.dataAtualizacao.formatDate(),
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          ProposalAuthors(proposta.nomesAutores),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                Container(
                  height: 30,
                  child: OutlineButton.icon(
                    key: tramitationsIconKey,
                    icon: FaIcon(FontAwesomeIcons.exchangeAlt, size: 18),
                    label: Text(
                      TRAMITATIONS.toUpperCase(),
                      style: const TextStyle(fontSize: 13),
                    ),
                    color: theme.primaryColor,
                    highlightedBorderColor: theme.primaryColorDark,
                    borderSide: BorderSide(color: theme.primaryColor),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () => SimpleRouter.forward(
                      TramitacaoPropostaPageConnected(proposta),
                      name: TRAMITACAO_PROPOSTA_PAGE,
                    ),
                  ),
                ),
                if (proposta.urlInteiroTeor != null)
                  Container(
                    height: 30,
                    child: FlatButton.icon(
                      key: seePropostaDocumentKey,
                      icon: FaIcon(FontAwesomeIcons.file, size: 18),
                      label: Text(
                        DOCUMENT.toUpperCase(),
                        style: const TextStyle(fontSize: 13),
                      ),
                      color: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      onPressed: () => context.bloc<DocumentBloc>().add(
                            OpenDocumentImage(proposta.urlInteiroTeor),
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: <Widget>[
            LikePostButton(post: proposta),
            const SizedBox(width: 16),
            UnlikePostButton(post: proposta),
            ButtonActionCard(
              icon: FontAwesomeIcons.shareAlt,
              text: SHARE,
              fontSize: 14,
              onTap: () async {
                final postImage = await screenshotController.capture();
                context.bloc<PostBloc>().add(SharePost(postImage: postImage));
              },
            ),
            const SizedBox(width: 16),
            ButtonActionCard(
              icon: context.bloc<PostBloc>().isPostFavorite
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              iconColor: context.bloc<PostBloc>().isPostFavorite
                  ? Colors.yellow
                  : null,
              text: context.bloc<PostBloc>().isPostFavorite ? SAVED : SAVE,
              fontSize: 14,
              onTap: () => context.bloc<PostBloc>().add(
                    FavoritePostForUser(
                      post: proposta.toJson(),
                      user: context.bloc<UserBloc>().user,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
