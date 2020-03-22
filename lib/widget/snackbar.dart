import 'package:flutter/material.dart';
import '../page/theme/main_theme.dart';

class Snackbar {
  Snackbar(
    this.context,
    this.message,
  ) {
    _buildSnackbar();
  }

  Snackbar.success(
    this.context,
    this.message,
  ) {
    _buildSnackbar(backgroundColor: Colors.green[700]);
  }

  Snackbar.error(
    this.context,
    this.message,
  ) {
    _buildSnackbar(backgroundColor: theme.errorColor);
  }

  Snackbar.warning(
    this.context,
    this.message,
  ) {
    _buildSnackbar(
      textColor: Colors.grey[850],
      backgroundColor: Colors.yellow[700],
    );
  }

  final BuildContext context;
  final String message;

  _buildSnackbar({Color textColor, Color backgroundColor}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
