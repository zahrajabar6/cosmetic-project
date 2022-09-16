import 'package:flutter/material.dart';
import 'package:cosmetic_project/controllers/colors.dart';

class MyFiltering extends StatefulWidget {
  const MyFiltering({
    Key? key,
    required this.items,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);
  final List<String> items;
  final String? selectedItem;
  final Function(String?)? onChanged;

  @override
  State<MyFiltering> createState() => _MyFilteringState();
}

class _MyFilteringState extends State<MyFiltering> {
  //final List<String> Items = ["Price", "Rate"];
  //String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 40,
      decoration:
          BoxDecoration(color: green, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: widget.selectedItem,
        onChanged: widget.onChanged,
        hint: const Center(
            child: Text('Filtering',
                style: TextStyle(color: Colors.white, fontSize: 18))),
        // Hide the default underline
        underline: Container(),
        // set the color of the dropdown menu
        dropdownColor: Colors.white,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
          size: 20,
        ),
        isExpanded: true,
        elevation: 5,

        // The list of options
        items: widget.items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 18, color: grey),
                    ),
                  ),
                ))
            .toList(),

        // Customize the selected item
        selectedItemBuilder: (BuildContext context) => widget.items
            .map((e) => Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
