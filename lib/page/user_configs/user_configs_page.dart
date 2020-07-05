import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/configuracao.dart';
import '../../core/i18n/i18n.dart';
import '../../widget/text_title.dart';

class UserConfigsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = context.bloc<UserBloc>();
    final user = userBloc.user;
    final configs = user.userConfigs.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 8),
              Center(
                child: TextTitle(CONFIGS),
              ),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, i) => ListTile(
                  title: Text(stringToConfigDescription(configs[i])),
                  trailing: LiteRollingSwitch(
                    value: user.userConfigs[configs[i]],
                    textOn: 'Sim',
                    textOff: 'Não',
                    colorOn: Colors.greenAccent[700],
                    colorOff: Colors.redAccent[700],
                    iconOn: Icons.done,
                    iconOff: Icons.remove,
                    textSize: 16.0,
                    onTap: () => userBloc.add(
                      ChangeUserConfig(
                        user: user,
                        configName: configs[i],
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                separatorBuilder: (_, i) => const Divider(),
                itemCount: configs.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
