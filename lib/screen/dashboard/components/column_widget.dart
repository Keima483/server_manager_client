import 'package:flutter/material.dart';
import 'package:server_manager_client/utils/ui_style.dart';

// Widget to descibe the column namees
class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 60,
      width: size.width - 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(
          0x40ffffff,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Id',
            style: columnHeadingStyle,
          ),
          Text(
            'Name',
            style: columnHeadingStyle,
          ),
          Text(
            'Language',
            style: columnHeadingStyle,
          ),
          Text(
            'Framwork',
            style: columnHeadingStyle,
          ),
          Text(
            'Actions',
            style: columnHeadingStyle,
          ),
        ],
      ),
    );
  }
}
