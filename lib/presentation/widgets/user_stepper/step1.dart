import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/permissions.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/password.dart';
import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/logic/user/model/role_model.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_password_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Step1 extends StatelessWidget {
  final Function next;
  final Function prev;

  Step1({super.key, required this.next, required this.prev});

  @override
  Widget build(BuildContext context) {
    String? getFirstnameError(FirstNameValidationError? error) {
      switch (error) {
        case FirstNameValidationError.empty:
          return AppLocalizations.of(context)!
              .itemCanNotBeEmpty(AppLocalizations.of(context)!.firstname);
        case FirstNameValidationError.min:
          return AppLocalizations.of(context)!
              .itemCanNotBeLessThanMaxCharacters(
            AppLocalizations.of(context)!.firstname,
            6.toString(),
          );
        case FirstNameValidationError.max:
          return AppLocalizations.of(context)!
              .itemCanNotBeMoreThanMaxCharacters(
            AppLocalizations.of(context)!.firstname,
            32.toString(),
          );
        default:
          return null;
      }
    }

    String? getEmailError(EmailValidationError? error) {
      switch (error) {
        case EmailValidationError.empty:
          return AppLocalizations.of(context)!
              .itemCanNotBeEmpty(AppLocalizations.of(context)!.email);
        case EmailValidationError.invalid:
          return AppLocalizations.of(context)!.invalid_email;
        default:
          return null;
      }
    }

    String? getPasswordError(PasswordValidationError? error) {
      switch (error) {
        case PasswordValidationError.empty:
          return AppLocalizations.of(context)!
              .itemCanNotBeEmpty(AppLocalizations.of(context)!.password);
        case PasswordValidationError.min:
          return AppLocalizations.of(context)!
              .itemCanNotBeLessThanMaxCharacters(
            AppLocalizations.of(context)!.password,
            8.toString(),
          );
        case PasswordValidationError.max:
          return AppLocalizations.of(context)!
              .itemCanNotBeMoreThanMaxCharacters(
            AppLocalizations.of(context)!.password,
            32.toString(),
          );
        default:
          return null;
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    _changeRole(String value) {
      List<RoleModel> data = [];

      for (var element1 in myPermissions) {
        for (var element2 in element1.allowRole) {
          if (element2 == value) {
            data.add(RoleModel(
                systemId: element1.systemId,
                systemName: element1.systemName,
                action: element1.action,
                allowRole: element1.allowRole));
          }
        }
      }

      context.read<UserCubit>().permissionChange(data);
      context.read<UserCubit>().roleChange(value);
    }

    final user = context.read<UserCubit>().state.role.value;

    // ignore: prefer_is_empty
    if (user.length > 0) {
      _changeRole(user);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.name.isNotValid
                    ? getFirstnameError(state.name.error)
                    : null,
                hintText: AppLocalizations.of(context)?.firstname,
                value: state.name.value,
                setValue: (value) {
                  context.read<UserCubit>().nameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CTextField(
                hintText: AppLocalizations.of(context)?.email,
                value: state.email.value,
                setValue: (value) {
                  context.read<UserCubit>().emailChange(value);
                },
                errorText: state.email.isNotValid
                    ? getEmailError(state.email.error)
                    : null,
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CPasswordField(
                hintText: AppLocalizations.of(context)?.password,
                value: state.password.value,
                setValue: (value) {
                  context.read<UserCubit>().passwordChange(value);
                },
                errorText: state.password.isNotValid ? getPasswordError(state.password.error) : null,
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CPasswordField(
                hintText: AppLocalizations.of(context)?.confirm_password,
                value: state.confirmPassword.value,
                setValue: (value) {
                  context.read<UserCubit>().confirmPasswordChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CDropdown(
                value: state.role.value,
                hintText: AppLocalizations.of(context)?.role,
                setValue: (value) {
                  _changeRole(value);
                },
                items: [
                  {
                    'value': 'admin',
                    'label': AppLocalizations.of(context)?.admin,
                  },
                  {
                    'value': 'finance_manager',
                    'label': AppLocalizations.of(context)?.finance_manager,
                  },
                  {
                    'value': 'bank_manager',
                    'label': AppLocalizations.of(context)?.bank_manager,
                  },
                ],
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
