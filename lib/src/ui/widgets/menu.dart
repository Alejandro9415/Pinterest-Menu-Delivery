import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Button {
  final Function onPressed;
  final IconData icon;
  Button({@required this.onPressed, @required this.icon});
}

class MenuWidget extends StatelessWidget {
  final List<Button> items = [
    Button(icon: Icons.home, onPressed: () async{
      const url = 'https://www.google.com/maps/search/?api=1&query=2.9477069,-75.2933061';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
    }),
    //Button( icon: Icons.search, onPressed: ()=> print('search')),
    Button(icon: Icons.restaurant_menu, onPressed: () => print('noti')),
    Button(icon: Icons.person, onPressed: () => print('super')),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
        child: _MenuBackground(
      child: _MenuItems(items),
    ));
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;
  _MenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 60,
        child: child,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]));
  }
}

class _MenuItems extends StatelessWidget {
  final List<Button> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _MenuButton(i, menuItems[i])));
  }
}

class _MenuButton extends StatelessWidget {
  final int index;
  final Button item;

  const _MenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? Colors.indigoAccent : Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
