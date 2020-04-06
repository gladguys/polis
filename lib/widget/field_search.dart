import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../i18n/label.dart';

class FieldSearch extends StatelessWidget {
  const FieldSearch({
    @required this.onChanged,
    this.onPressedSuffix,
  }) : assert(onChanged != null);
  final Function onChanged;
  final Function onPressedSuffix;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 36,
          child: TextField(
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.search,
                color: Colors.grey[600],
                size: 16,
              ),
              hintText: SEARCH_HERE,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Positioned(
          right: 3,
          top: 3,
          child: Container(
            width: 40,
            height: 30,
            child: FlatButton(
              padding: EdgeInsets.zero,
              child: FaIcon(
                FontAwesomeIcons.slidersH,
                size: 16,
                color: Colors.black,
              ),
              onPressed: onPressedSuffix,
            ),
          ),
        ),
      ],
    );
  }
}
