import 'package:flutter/material.dart';

class FlexibleLayout extends StatelessWidget {
  final bool isColumn;
  final List<int> flexList;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry innerPadding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color color;

  FlexibleLayout({
    Key key,
    @required this.flexList,
    @required this.children,
    this.padding,
    this.innerPadding,
    this.color = Colors.white,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.isColumn = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: padding,
      child: isColumn
          ? Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: _layout(),
            )
          : Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: _layout(),
            ),
    );
  }

  List<Widget> _layout() {
    var flexibles = <Widget>[];

    if (flexList.length > children.length) {
      throw Exception('widgets in children are lower than flex list');
    }

    flexibles.addAll(
      flexList.asMap().entries.map(
            (value) => Flexible(
              flex: value.value,
              child: Container(
                padding: innerPadding,
                child: children[value.key] is FlexibleSpace
                    ? null
                    : children[value.key],
              ),
            ),
          ),
    );

    return flexibles;
  }
}

class FlexibleSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Spacer();
  }
}
