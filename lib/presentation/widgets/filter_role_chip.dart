import 'package:flutter/material.dart';

class FilterRoleChip extends StatelessWidget {
  const FilterRoleChip({
    Key? key,
    required this.itemCount,
    required this.roles,
    required this.selected,
    required this.onSelected,
    this.showCheckmark = true,
    this.disableOnSelected = false,
  }) : super(key: key);

  final int itemCount;
  final List<dynamic> roles;
  final List<String> selected; //.contains(controller.getAllRoles()[0],)
  final Function(bool, int) onSelected;
  final bool showCheckmark;
  final bool disableOnSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: ListView.builder(
        itemCount: itemCount, //controller.getAllRoles().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: FilterChip(
            showCheckmark: showCheckmark,
            checkmarkColor: Colors.red[400],
            label: Text(
              roles[index].toString(),
            ),
            selected: selected.contains(
              roles[index],
            ),
            onSelected:
                disableOnSelected ? null : (value) => onSelected(value, index),
          ),
        ),
      ),
    );
  }
}
