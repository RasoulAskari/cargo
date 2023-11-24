import 'package:cargo/config/app_router.dart';
import 'package:cargo/config/theme.dart';
import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CargoApp extends StatefulWidget {
  const CargoApp({super.key});

  @override
  State<CargoApp> createState() => _CargoAppState();
}

class _CargoAppState extends State<CargoApp> {
  var lang;

  @override
  void initState() {
    context.read<LanguageCubit>().changeLanguage('en');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            state.language.value == 'fa'
                ? const Locale('fa')
                : const Locale("en")
          ],
          theme: AppThemes.appThemeData[AppTheme.lightTheme],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          title: "Cargo",
        );
      },
    );
  }
}
