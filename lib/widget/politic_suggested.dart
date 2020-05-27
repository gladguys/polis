import 'package:flutter/material.dart';

import '../i18n/i18n.dart';
import '../model/models.dart';
import 'image/photo_image.dart';

class PoliticSuggested extends StatelessWidget {
  PoliticSuggested({this.politico, this.isFollowing, this.onClickFollowButton});

  final PoliticoModel politico;
  final bool isFollowing;
  final VoidCallback onClickFollowButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: PhotoImage(
              url: politico.urlFoto,
              size: 80,
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              politico.nomeEleitoral,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              '${politico.siglaPartido} · ${politico.siglaUf}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            POLITIC,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          const SizedBox(height: 8),
          Container(
            height: 28,
            width: 140,
            child: OutlineButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey[350],
              onPressed: onClickFollowButton,
              child: Text(
                isFollowing ? STOP_FOLLOWING : FOLLOW,
                style: TextStyle(
                  fontSize: 12,
                  color: isFollowing ? Colors.red : Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
