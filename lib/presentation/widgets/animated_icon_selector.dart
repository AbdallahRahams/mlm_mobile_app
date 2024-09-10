import 'package:flutter/material.dart';

class AnimatedIconSelector extends StatefulWidget {
  final List<IconData> icons;
  final void Function(int) onIconSelected;

  AnimatedIconSelector({
    required this.icons,
    required this.onIconSelected,
  });

  @override
  _AnimatedIconSelectorState createState() => _AnimatedIconSelectorState();
}

class _AnimatedIconSelectorState extends State<AnimatedIconSelector> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.icons.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onIconSelected(index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icons[index],
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        );
      }),
    );
  }
}
