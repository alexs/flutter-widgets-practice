import 'package:flutter/material.dart';
import 'package:flutter_widgets_practice/config/menu/menu_item.dart';
import 'package:flutter_widgets_practice/presentation/screens/cards/cards_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wigdets miscellaneous'),        
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget{
  const _HomeView();

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);        
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   )
        // );
        // Navigator.pushNamed(context, menuItem.link);
        context.pushNamed(CardsScreen.name)
      },
    );
  }
}