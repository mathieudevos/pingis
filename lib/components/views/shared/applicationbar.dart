import 'package:flutter/material.dart';
import 'package:pingis/utils/constants/strings.dart';

class ApplicationBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/pingpong-bw.png',
              fit: BoxFit.contain,
              height: 32,
              color: Colors.white
            ),
            onPressed: () => { /* todo: implement */ },
          ),
          FlatButton(
            padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
            onPressed: () => { /* todo: implement */ },
            child: Text(title, style: Theme.of(context).textTheme.title.copyWith(color: Colors.white)),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => { /* todo: implement */ },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}