import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
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
        imagePicker: ImagePicker(),
      ),
    );
  }
}
