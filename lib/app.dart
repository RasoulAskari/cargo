import 'package:cargo/config/app_router.dart';
import 'package:cargo/config/theme.dart';
import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CargoApp extends StatefulWidget {
  const CargoApp({super.key});

  @override
  State<CargoApp> createState() => _CargoAppState();
}

class _CargoAppState extends State<CargoApp> {
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    final lang = _getLanguage();
    context.read<LanguageCubit>().changeLanguage(lang as String);
    super.initState();
  }

  Future<String?> _getLanguage() async {
    final lang = await _storage.read(key: "language");
    return lang;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.language.value),
          theme: AppThemes.appThemeData[AppTheme.lightTheme],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          title: "Cargo",
        );
      },
    );
  }
}
