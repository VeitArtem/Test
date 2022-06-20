import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/constants.dart';
import 'package:flutter_test_task/screens/tansactions_history/components/list_picker_dialog.dart';

class ListPickerField extends StatelessWidget {
  final String label;
  final List<String> items;
  final TextEditingController? controller;
  final String? initialValue;
  final TextEditingController _controller;

  ListPickerField({
    Key? key,
    required this.label,
    required this.items,
    this.controller,
    this.initialValue,
  })  : assert(
          controller == null || initialValue == null,
          'Cannot provide both initialValue and controller.',
        ),
        _controller = controller ?? TextEditingController(text: initialValue),
        super(key: key);

  String get value => _controller.text;
  bool get empty => _controller.text.isEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: kSecondaryTextColor),
      readOnly: true,
      controller: _controller,
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());

        String? selectedValue = await showDialog(
          context: context,
          builder: (context) => ListPickerDialog(
            label: label,
            items: items,
          ),
        );

        if (selectedValue != null) {
          _controller.text = selectedValue;
        }
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kSecondaryTextColor),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: kSecondaryTextColor,
        ),
        labelText: label,
      ),
    );
  }
}
