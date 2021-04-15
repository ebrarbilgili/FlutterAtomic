import 'package:atomic_widgets/Containers/random_color_container.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: RandomColorContainer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Atomic Drawer Widget')),
            buildListTileWidget('Page 1', () {}),
            buildListTileWidget('Page 2', () {}),
            buildListTileWidget('Page 3', () {}),
            buildListTileWidget('Page 4', () {}),
          ],
        ),
      ),
    );
  }

  ListTile buildListTileWidget(String title, Function() onTap) {
    return ListTile(title: Text(title), onTap: onTap);
  }
}
