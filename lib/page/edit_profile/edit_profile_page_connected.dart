import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/abstract/polis_image_picker.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class EditProfilePageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<EditProfileBloc>(
      bloc: EditProfileBloc(
        repository: context.repository<FirebaseEditProfileRepository>(),
        userBloc: context.bloc<UserBloc>(),
      ),
      page: EditProfilePage(
        imagePicker: PolisImagePicker(),
      ),
    );
  }
}
