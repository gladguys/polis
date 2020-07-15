import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
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
import '../image/photo_image.dart';
import '../label_value.dart';
import '../photo.dart';
import '../text_rich.dart';

class PostDespesa extends StatelessWidget {
  PostDespesa(this.despesa, {@required this.screenshotController})
      : assert(despesa != null),
        assert(screenshotController != null);

  final DespesaModel despesa;
  final ScreenshotController screenshotController;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: context.baseBackgroundColor,
        child: CardBase(
          slotLeft: _buildLeftContent(),
          slotCenter: BlocBuilder<PostBloc, PostState>(
            builder: (_, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTopContent(),
                _buildCenterContent(_),
              ],
            ),
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
          child: Photo(url: despesa.fotoPolitico),
          onTap: () => SimpleRouter.forward(
            PoliticProfilePageConnected(despesa.idPolitico),
            name: POLITIC_PROFILE_PAGE,
          ),
        ),
        Positioned(
          right: 0,
          bottom: -10,
          child: PhotoImage(
            url: despesa.urlPartidoLogo,
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
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: <Widget>[
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
          LabelValue(
            label: DOCUMENT_DATE,
            value: despesa.dataDocumento.formatDate(),
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: DOCUMENT_VALUE,
            value: despesa.valorDocumento.formatCurrency(),
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: GLOSS_VALUE,
            value: despesa.valorGlosa.formatCurrency(),
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: PORTION,
            value: despesa.parcela == '0' ? IN_CASH : despesa.parcela,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: PROVIDER_NAME,
            value: despesa.nomeFornecedor,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: CNPJ_CPF_PROVIDER,
            value: despesa.cnpjCpfFornecedor,
            emptyValue: NOT_INFORMED,
          ),
          if (despesa.urlDocumento != null)
            Row(
              children: <Widget>[
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 8),
                  child: FlatButton.icon(
                    key: despesaImageIconKey,
                    icon: FaIcon(FontAwesomeIcons.file, size: 18),
                    label: Text(
                      DOCUMENT.toUpperCase(),
                      style: const TextStyle(fontSize: 13),
                    ),
                    color: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () => context.bloc<DocumentBloc>().add(
                          OpenDocumentImage(despesa.urlDocumento),
                        ),
                  ),
                ),
              ],
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
            LikePostButton(post: despesa),
            const SizedBox(width: 24),
            UnlikePostButton(post: despesa),
            const Spacer(),
            ButtonActionCard(
              isIconOnly: true,
              icon: FontAwesomeIcons.shareAlt,
              iconColor: Colors.grey[700],
              onTap: () async {
                final postImage = await screenshotController.capture();
                context.bloc<PostBloc>().add(SharePost(postImage: postImage));
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
                  : Colors.grey[700],
              onTap: () => context.bloc<PostBloc>().add(
                    FavoritePostForUser(
                      post: {
                        'id': despesa.id,
                        ...despesa.toJson(),
                      },
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
