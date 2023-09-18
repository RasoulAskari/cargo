import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/utils/selector_config.dart';
import 'package:intl_phone_number_input/src/utils/test/test_helper.dart';
import 'package:intl_phone_number_input/src/widgets/countries_search_list_widget.dart';
import 'package:intl_phone_number_input/src/widgets/input_widget.dart';
import 'package:intl_phone_number_input/src/widgets/item.dart';
import 'package:intl_phone_number_input/src/widgets/bottom_sheet.dart';

/// [SelectorButton]
class SelectorButton extends StatelessWidget {
  final List<Country> countries;
  final Country? country;
  final SelectorConfig selectorConfig;
  final TextStyle? selectorTextStyle;
  final InputDecoration? searchBoxDecoration;
  final bool autoFocusSearchField;
  final String? locale;
  final bool isEnabled;
  final bool isScrollControlled;

  final ValueChanged<Country?> onCountryChanged;

  const SelectorButton({
    Key? key,
    required this.countries,
    required this.country,
    required this.selectorConfig,
    required this.selectorTextStyle,
    required this.searchBoxDecoration,
    required this.autoFocusSearchField,
    required this.locale,
    required this.onCountryChanged,
    required this.isEnabled,
    required this.isScrollControlled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: const Key(TestHelper.DropdownButtonKeyValue),
      padding: EdgeInsets.zero,
      minWidth: 0,
      onPressed: countries.isNotEmpty && countries.length > 1 && isEnabled
          ? () async {
              Country? selected;
              if (selectorConfig.selectorType == PhoneInputSelectorType.bottomSheet) {
                selected = await showCountrySelectorBottomSheet(context, countries);
              }

              if (selected != null) {
                onCountryChanged(selected);
              }
            }
          : null,
      child: Item(
        country: country,
        showFlag: selectorConfig.showFlags,
        useEmoji: selectorConfig.useEmoji,
        leadingPadding: selectorConfig.leadingPadding,
        trailingSpace: selectorConfig.trailingSpace,
        textStyle: selectorTextStyle,
      ),
    );
  }

  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(List<Country> countries) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Item(
          key: Key(TestHelper.countryItemKeyValue(country.alpha2Code)),
          country: country,
          showFlag: selectorConfig.showFlags,
          useEmoji: selectorConfig.useEmoji,
          textStyle: selectorTextStyle,
          withCountryNames: false,
          trailingSpace: selectorConfig.trailingSpace,
        ),
      );
    }).toList();
  }

  /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.bottomSheet] is selected
  Future<Country?> showCountrySelectorBottomSheet(BuildContext inheritedContext, List<Country> countries) {
    return showModalBottomSheet(
      context: inheritedContext,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return BottomSheetStyle(
          children: [
            Directionality(
              textDirection:
                  Localizations.localeOf(context).languageCode == 'fa' ? TextDirection.rtl : TextDirection.ltr,
              child: Container(
                decoration: ShapeDecoration(
                  color: Theme.of(context).canvasColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 380,
                  child: CountrySearchListWidget(
                    countries,
                    locale,
                    searchBoxDecoration: searchBoxDecoration,
                    // scrollController: controller,
                    showFlags: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    autoFocus: autoFocusSearchField,
                  ),
                ),
              ),
            )
          ],
        );
      },
      // builder: (BuildContext context) {
      //   return Stack(
      //     children: [
      //       GestureDetector(
      //         onTap: () => Navigator.pop(context),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      //         child: DraggableScrollableSheet(
      //           builder: (BuildContext context, ScrollController controller) {
      //             return Directionality(
      //               textDirection:
      //                   Localizations.localeOf(context).languageCode == 'fa' ? TextDirection.rtl : TextDirection.ltr,
      //               child: Container(
      //                 decoration: ShapeDecoration(
      //                   color: Theme.of(context).canvasColor,
      //                   shape: const RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(12),
      //                       topRight: Radius.circular(12),
      //                     ),
      //                   ),
      //                 ),
      //                 child: CountrySearchListWidget(
      //                   countries,
      //                   locale,
      //                   searchBoxDecoration: searchBoxDecoration,
      //                   scrollController: controller,
      //                   showFlags: selectorConfig.showFlags,
      //                   useEmoji: selectorConfig.useEmoji,
      //                   autoFocus: autoFocusSearchField,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   );
      // },
    );
  }
}
