import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return CDropdown(
                value: state.language.value,
                setValue: (value) {
                  context.read<LanguageCubit>().changeLanguage(value);
                },
                items: [
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
