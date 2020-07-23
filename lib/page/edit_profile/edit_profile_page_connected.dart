import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class EditProfilePageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<EditProfileCubit>(
      bloc: EditProfileCubit(
        repository: context.repository<FirebaseEditProfileRepository>(),
        userCubit: context.bloc<UserCubit>(),
      ),
      page: EditProfilePage(
        imagePicker: ImagePicker(),
      ),
    );
  }
}
