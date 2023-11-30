import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar"),
      ),
      body: Column(children: [
        BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return CDropdown(
                value: state.language.value,
                setValue: (value) {
                  context.read<LanguageCubit>().changeLanguage(value);
                },
                items: const [
                  {
                    'value': 'fa',
                    'label': "Persain",
                  },
                  {
                    'value': 'en',
                    'label': "English",
                  },
                ]);
          },
        ),
      ]),
    );
  }
}
