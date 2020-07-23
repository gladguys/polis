import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/enum/configuracao.dart';
import '../../core/i18n/i18n.dart';
import '../../widget/text_title.dart';
import 'fancy_switcher.dart';

class UserConfigsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.bloc<UserCubit>();
    final user = userCubit.user;
    final userConfigs = user.userConfigs ?? {};
    final allConfigs = Configuracao.values;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 8),
              Center(
                child: TextTitle(PREFERENCES),
              ),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, i) => ListTile(
                  title: Text(configToDescription(allConfigs[i])),
                  trailing: FancySwitcher(
                    value: userConfigs[configToStringKey(allConfigs[i])] ??
                        getConfigDefaultValue(allConfigs[i]),
                    textOn: YES,
                    textOff: NO,
                    colorOn: Colors.greenAccent[700],
                    colorOff: Colors.redAccent[700],
                    iconOn: FontAwesomeIcons.check,
                    iconOff: FontAwesomeIcons.times,
                    textSize: 16.0,
                    onChanged: (value) => userCubit.changeUserConfig(
                      currentUser: user,
                      config: allConfigs[i],
                      configValue: value,
                    ),
                  ),
                ),
                separatorBuilder: (_, i) => const Divider(height: 8),
                itemCount: allConfigs.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
