import 'package:flutter/material.dart';

class DropDownn extends StatefulWidget {
  @override
  _DropDownnState createState() => _DropDownnState();
}

class _DropDownnState extends State<DropDownn> {
  final List<String> items = <String>['Select Your Type', 'Client', 'Mershant'];
  String selectedItem = 'Select Your Type';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      onChanged: (String string) => setState(() => selectedItem = string),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((String item) {
          return Text(item);
        }).toList();
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          child: Text('$item'),
          value: item,
        );
      }).toList(),
    );
  }
}
