import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/constants.dart';

class ListPickerDialog extends StatefulWidget {
  final String label;
  final List<String> items;
  final double width;
  final double height;

  const ListPickerDialog({
    Key? key,
    required this.label,
    required this.items,
    this.width = 320.0,
    this.height = 450.0,
  })  : _scrollableHeight = (height - 100.0),
        super(key: key);

  final double? _scrollableHeight;

  @override
  State<ListPickerDialog> createState() => _ListPickerDialogState();
}

class _ListPickerDialogState extends State<ListPickerDialog> {
  late List<String> searchList = widget.items;

  void _onSearchChanged(String value) {
    value = value.toLowerCase().trim();
    setState(() {
      searchList = widget.items
          .where((item) => item.toLowerCase().contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        '${widget.label}',
        style: TextStyle(color: kSecondaryTextColor),
      ),
      content: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: kSecondaryTextColor),
              ),
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchChanged,
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: widget._scrollableHeight,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                children: searchList.map((item) {
                  return ListTile(
                    title: Text(
                      item,
                      style: TextStyle(color: kTextColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    onTap: () => Navigator.of(context).pop(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
