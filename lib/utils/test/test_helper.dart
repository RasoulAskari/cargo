class TestHelper {
  // ignore: constant_identifier_names
  static const String TextInputKeyValue = 'intl_text_input_key';
  // ignore: constant_identifier_names
  static const String DropdownButtonKeyValue = 'intl_dropdown_key';
  // ignore: constant_identifier_names
  static const String CountrySearchInputKeyValue = 'intl_search_input_key';
  static String Function(String? isoCode) countryItemKeyValue =
      (String? isoCode) => 'intl_country_${isoCode!.toUpperCase()}_key';
}
