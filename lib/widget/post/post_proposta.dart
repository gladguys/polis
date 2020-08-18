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
import '../button_action_card.dart';
import '../card_base.dart';
import '../general/proposal_authors.dart';
import '../image/photo_image.dart';
import '../label_value.dart';
import '../photo.dart';
import '../text_rich.dart';
import '../text_title.dart';
import 'go_to_post_comments_button.dart';

class PostProposta extends StatelessWidget {
  PostProposta(this.proposta,
      {@required this.screenshotController, this.isPostPreview = false})
      : assert(proposta != null),
        assert(screenshotController != null);

  final PropostaModel proposta;
  final ScreenshotController screenshotController;
  final bool isPostPreview;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: context.baseBackgroundColor,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            if (isPostPreview) ...[
              TextTitle(COMMENTS),
              const SizedBox(height: 8),
            ],
            CardBase(
              slotLeft: _buildLeftContent(),
              slotCenter: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTopContent(context),
                  _buildCenterContent(context),
                ],
              ),
              slotBottom: isPostPreview
                  ? const SizedBox.shrink()
                  : _buildActions(context),
            ),
          ],
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

  Widget _buildTopContent(BuildContext context) {
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
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
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
              maxLines: isPostPreview ? 4 : null,
              children: [
                TextSpan(
                  text: '${proposta.descricaoTipo}: ',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '${proposta.ementa ?? NOT_INFORMED_FEMALE}'),
              ],
            ),
          if (!isPostPreview) ...[
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
                      icon:
                          const FaIcon(FontAwesomeIcons.exchangeAlt, size: 18),
                      label: Text(
                        TRAMITATIONS.toUpperCase(),
                        style: const TextStyle(fontSize: 13),
                      ),
                      color: Theme.of(context).primaryColor,
                      highlightedBorderColor:
                          Theme.of(context).primaryColorDark,
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
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
                        icon: const FaIcon(FontAwesomeIcons.file, size: 18),
                        label: Text(
                          DOCUMENT.toUpperCase(),
                          style: const TextStyle(fontSize: 13),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.black,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                LikePostButton(post: proposta),
                const SizedBox(width: 24),
                UnlikePostButton(post: proposta),
                const SizedBox(width: 24),
                ButtonActionCard(
                  icon: FontAwesomeIcons.comment,
                  iconColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[700]
                      : Colors.grey[500],
                  text: '0',
                  textColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[700]
                      : Colors.grey[500],
                  onTap: () async {},
                ),
                const Spacer(),
                ButtonActionCard(
                  isIconOnly: true,
                  icon: FontAwesomeIcons.shareAlt,
                  iconColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[700]
                      : Colors.grey[500],
                  onTap: () async {
                    final postImage = await screenshotController.capture();
                    context
                        .bloc<PostBloc>()
                        .add(SharePost(postImage: postImage));
                  },
                ),
                const SizedBox(width: 8),
                ButtonActionCard(
                  isIconOnly: true,
                  icon: context.bloc<PostBloc>().isPostFavorite
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  iconColor: context.bloc<PostBloc>().isPostFavorite
                      ? Colors.yellow
                      : Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[700]
                          : Colors.grey[500],
                  onTap: () => context.bloc<PostBloc>().add(
                        FavoritePostForUser(
                          post: proposta.toJson(),
                          user: context.bloc<UserBloc>().user,
                        ),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GoToPostCommentsButton(proposta),
          ],
        ),
      ),
    );
  }
}
