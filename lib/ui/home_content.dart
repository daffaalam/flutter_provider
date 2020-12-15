import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class HomeContent extends StatelessWidget {
  Widget _child(CountProvider count) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () => count.decrement(),
            child: Text('REMOVE'),
            height: double.infinity,
          ),
        ),
        Container(
          color: Colors.grey,
          width: 2.0,
          height: double.infinity,
        ),
        Expanded(
          child: FlatButton(
            onPressed: () => count.increment(),
            child: Text('ADD'),
            height: double.infinity,
          ),
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
        Widget child,
      ) {
        return _child(count);
      },
    );
  }
}
