import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';

import '../model/politico_model.dart';

class PoliticSuggested extends StatelessWidget {
  PoliticSuggested({this.politico, this.isFollowing, this.onClickFollowButton});

  final PoliticoModel politico;
  final bool isFollowing;
  final VoidCallback onClickFollowButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300],
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(politico.urlFoto),
              ),
            ),
            SizedBox(height: 12),
            Text(
              politico.nomeEleitoral,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Dep. Federal',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 6),
            GFButton(
              type: GFButtonType.outline,
              shape: GFButtonShape.pills,
              color: Colors.grey,
              onPressed: onClickFollowButton,
              child: Text(
                isFollowing ? 'Deixar de seguir' : 'Seguir',
                style: TextStyle(
                  color: isFollowing ? Colors.red : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
