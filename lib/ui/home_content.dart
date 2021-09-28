import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  Widget _button({
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _child(CountProvider count) {
    return Row(
      children: <Widget>[
        _button(
          // TODO 4 : Consume Provider, Use Data, Set/Count
          onPressed: () => count.decrement(),
          title: 'INCREMENT',
          icon: Icons.add,
        ),
        const VerticalDivider(),
        _button(
          onPressed: () => count.increment(),
          title: 'DECREMENT',
          icon: Icons.remove,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountProvider>(
      builder: (
        BuildContext context,
        CountProvider count,
        Widget? child,
      ) {
        return _child(count);
      },
    );
  }
}
