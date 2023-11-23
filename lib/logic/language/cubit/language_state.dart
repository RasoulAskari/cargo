part of 'language_cubit.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LanguageState extends Equatable {
  final CString language;

  const LanguageState({
    this.language = const CString.pure(),
  });

  @override
  List<Object> get props => [
        language,
      ];

  LanguageState copyWith({
    CString? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }
}

final class LanguageInitial extends LanguageState {}
