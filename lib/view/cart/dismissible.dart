import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  const DismissibleWidget(
      {Key? key,
      required this.child,
      required this.item,
      required this.onDismissed})
      : super(key: key);
  final Widget child;
  final T item;
  final Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ObjectKey(item),
      onDismissed: onDismissed,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(
          Icons.delete_forever,
          size: 30,
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }
}
