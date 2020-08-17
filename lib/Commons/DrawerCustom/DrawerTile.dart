import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Screens/PageManager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {

  final IconData iconData;
  final String title;
  final int page;

  DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 20),
              child: Icon(
                iconData,
                color: this.page == curPage ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
                title,
                style: TextStyle(
                  color: curPage == page ? primaryColor : Colors.grey[700],
                  fontSize: 20
                ),
            )
          ],
        ),
      ),
    );
  }
}
