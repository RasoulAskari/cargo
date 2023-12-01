import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _storage = const FlutterSecureStorage();

  Future<void> setLanguage(String value) async {
    await _storage.write(key: 'language', value: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.setting_screen,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          InputLabel(label: AppLocalizations.of(context)!.language),
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return CDropdown(
                  hintText: AppLocalizations.of(context)!.language,
                  value: state.language.value,
                  setValue: (value) {
                    setLanguage(value);
                    context.read<LanguageCubit>().changeLanguage(value);
                    Navigator.of(context).pop();
                  },
                  items: [
                    {
                      'value': 'fa',
                      'label': AppLocalizations.of(context)!.persain,
                    },
                    {
                      'value': 'en',
                      'label': AppLocalizations.of(context)!.english,
                    },
                  ]);
            },
          ),
        ]),
      ),
    );
  }
}
