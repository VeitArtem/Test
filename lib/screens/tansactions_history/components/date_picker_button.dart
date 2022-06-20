import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? initialValue;
  final TextEditingController _controller;

  DatePickerField({
    Key? key,
    required this.label,
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
      readOnly: true,
      controller: _controller,
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () async {
        // Remove focus from the field.
        FocusScope.of(context).requestFocus(FocusNode());

        var selectedValue = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021, 6, 16),
            lastDate: DateTime(2022, 6, 20));

        if (selectedValue != null) {
          _controller.text =
              "${selectedValue.day}.${selectedValue.month}.${selectedValue.year}";
        }
      },
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
          ],
        ),
        labelText: label,
      ),
    );
  }
}
