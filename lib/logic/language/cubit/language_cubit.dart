import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:equatable/equatable.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void changeLanguage(String value) {
    final language = CString.dirty(value);
    emit(state.copyWith(
      language: language,
    ));
  }
}
