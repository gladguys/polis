import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/abstract/polis_image_picker.dart';
import '../../core/routing/route_names.dart';
import '../../enum/auth_provider.dart';
import '../../i18n/i18n.dart';
import '../../model/models.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/snackbar.dart';
import '../../widget/text_title.dart';
import '../pages.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({@required this.imagePicker}) : assert(imagePicker != null);

  final PolisImagePicker imagePicker;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  GlobalKey<FormState> _formKey;
  String _name;
  String _email;
  File pickedPhoto;

  EditProfileBloc get editProfileBloc => context.bloc<EditProfileBloc>();
  UserModel get user => context.bloc<UserBloc>().user;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(USER_PROFILE_PAGE),
      body: SafeArea(
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (_, state) {
            if (state is UserUpdateSuccess) {
              Snackbar.success(_, USER_UPDATED_WITH_SUCCESS);
            }
            if (state is UserUpdateFailed) {
              Snackbar.success(_, USER_UPDATE_FAILED);
            }
          },
          builder: (_, state) {
            if (state is UpdatingUser) {
              return CenteredLoading();
            } else {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 12),
                  Center(
                    child: TextTitle(EDIT_YOUR_PROFILE),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    height: 120,
                    width: 120,
                    child: Material(
                      borderRadius: BorderRadius.circular(60),
                      elevation: 1,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(60),
                        child: Center(
                          key: const ValueKey('profile-container'),
                          child: getImageContainer(),
                        ),
                        onTap: getImage,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: _getForm(),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 40,
                    width: 220,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: const Text(CONFIRM),
                      color: Colors.amber,
                      onPressed: () {
                        final formState = _formKey.currentState;
                        if (formState.validate()) {
                          formState.save();
                          editProfileBloc.add(
                            UpdateUserInfo(
                              currentUser: user,
                              name: _name,
                              email: _email,
                              pickedPhoto: pickedPhoto,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  user.authProvider == AuthProvider.emailAndPassword
                      ? Container(
                          height: 40,
                          width: 220,
                          child: OutlineButton.icon(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.lock, size: 18),
                            label: const Text(CHANGE_PASSWORD),
                            highlightedBorderColor: Colors.grey,
                            onPressed: () => SimpleRouter.forward(
                              ChangePasswordPageConnected(),
                              name: CHANGE_PASSWORD_PAGE,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const ValueKey('name-field'),
            decoration: const InputDecoration(
              labelText: NAME,
            ),
            initialValue: user.name,
            textInputAction: TextInputAction.next,
            onSaved: (name) => _name = name,
            validator: (name) => name.isEmpty ? REQUIRED_FIELD : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            key: const ValueKey('email-field'),
            decoration: const InputDecoration(
              labelText: EMAIL,
            ),
            initialValue: user.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onSaved: (email) => _email = email,
            validator: (email) => email.isEmpty ? REQUIRED_FIELD : null,
          ),
        ],
      ),
    );
  }

  Widget getImageContainer() {
    if (pickedPhoto != null) {
      return ClipRRect(
        key: const ValueKey('photo-url-file'),
        borderRadius: BorderRadius.circular(60),
        child: Image.file(
          pickedPhoto,
          height: 120,
          width: 120,
          fit: BoxFit.cover,
        ),
      );
    } else if (user.photoUrl != null) {
      return ClipRRect(
        key: const ValueKey('photo-url-user'),
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          user.photoUrl,
          height: 120,
          width: 120,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.camera,
            color: Theme.of(context).accentColor,
            size: 40,
          ),
          const SizedBox(height: 4),
          Text(
            CHOICE_PHOTO,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).accentColor,
            ),
          ),
          const SizedBox(height: 4),
        ],
      );
    }
  }

  Future<void> getImage() async {
    var image = await widget.imagePicker.getImage();
    setState(() => pickedPhoto = image);
  }
}
