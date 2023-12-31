import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show IterableExtension;
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:intl_phone_number_input/src/models/country_list.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';

/// Type of phone numbers.
enum PhoneNumberType {
  // ignore: constant_identifier_names
  FIXED_LINE, // : 0,
  // ignore: constant_identifier_names
  MOBILE, //: 1,
  // ignore: constant_identifier_names
  FIXED_LINE_OR_MOBILE, //: 2,
  // ignore: constant_identifier_names
  TOLL_FREE, //: 3,
  // ignore: constant_identifier_names
  PREMIUM_RATE, //: 4,
  // ignore: constant_identifier_names
  SHARED_COST, //: 5,
  // ignore: constant_identifier_names
  VOIP, //: 6,
  // ignore: constant_identifier_names
  PERSONAL_NUMBER, //: 7,
  // ignore: constant_identifier_names
  PAGER, //: 8,
  // ignore: constant_identifier_names
  UAN, //: 9,
  // ignore: constant_identifier_names
  VOICEMAIL, //: 10,
  // ignore: constant_identifier_names
  UNKNOWN, //: -1
}

/// [PhoneNumber] contains detailed information about a phone number
class PhoneNumber extends Equatable {
  /// Either formatted or unformatted String of the phone number
  final String phoneNumber;

  /// The Country [dialCode] of the phone number
  final String? dialCode;

  /// Country [isoCode] of the phone number
  final String? isoCode;

  /// [_hash] is used to compare instances of [PhoneNumber] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [PhoneNumber]
  int get hash => _hash;

  @override
  List<Object?> get props => [phoneNumber, isoCode, dialCode];

  const PhoneNumber({
    this.phoneNumber = '',
    this.dialCode,
    this.isoCode,
  }) : _hash = 10000000;

  @override
  String toString() {
    return 'PhoneNumber(phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode)';
  }

  /// Returns [PhoneNumber] which contains region information about
  /// the [phoneNumber] and [isoCode] passed.
  static Future<PhoneNumber> getRegionInfoFromPhoneNumber(
    String phoneNumber, [
    String isoCode = '',
  ]) async {
    RegionInfo regionInfo = await PhoneNumberUtil.getRegionInfo(
        phoneNumber: phoneNumber, isoCode: isoCode);

    String? internationalPhoneNumber =
        await PhoneNumberUtil.normalizePhoneNumber(
      phoneNumber: phoneNumber,
      isoCode: regionInfo.isoCode ?? isoCode,
    );

    return PhoneNumber(
      phoneNumber: internationalPhoneNumber ?? '',
      dialCode: regionInfo.regionPrefix,
      isoCode: regionInfo.isoCode,
    );
  }

  /// Accepts a [PhoneNumber] object and returns a formatted phone number String
  static Future<String> getParsableNumber(PhoneNumber phoneNumber) async {
    if (phoneNumber.isoCode != null) {
      PhoneNumber number = await getRegionInfoFromPhoneNumber(
        phoneNumber.phoneNumber,
        phoneNumber.isoCode!,
      );
      String? formattedNumber = await PhoneNumberUtil.formatAsYouType(
        phoneNumber: number.phoneNumber,
        isoCode: number.isoCode!,
      );

      return formattedNumber!.replaceAll(
        RegExp('^([\\+]?${number.dialCode}[\\s]?)'),
        '',
      );
    } else {
      throw Exception('ISO Code is "${phoneNumber.isoCode}"');
    }
  }

  /// Returns a String of [phoneNumber] without [dialCode]
  String parseNumber() {
    return phoneNumber.replaceAll("$dialCode", '');
  }

  /// For predefined phone number returns Country's [isoCode] from the dial code,
  /// Returns null if not found.
  static String? getISO2CodeByPrefix(String prefix) {
    if (prefix.isNotEmpty) {
      prefix = prefix.startsWith('+') ? prefix : '+$prefix';
      var country = Countries.countryList
          .firstWhereOrNull((country) => country['dial_code'] == prefix);
      if (country != null && country['alpha_2_code'] != null) {
        return country['alpha_2_code'];
      }
    }
    return null;
  }

  /// Returns [PhoneNumberType] which is the type of phone number
  /// Accepts [phoneNumber] and [isoCode] and r
  static Future<PhoneNumberType> getPhoneNumberType(
      String phoneNumber, String isoCode) async {
    PhoneNumberType type = (await PhoneNumberUtil.getNumberType(
        phoneNumber: phoneNumber, isoCode: isoCode)) as PhoneNumberType;

    return type;
  }
}
