import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons flutter examples'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Button disabled')),
            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon( Icons.access_alarm_rounded),
              label: const Text('Elevated Icon')
            ),
            FilledButton(onPressed: (){}, child: const Text('fill')),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.account_tree_sharp),
              label: const Text('Fill Icon Button'),
            ),
            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.turn_slight_left_rounded),
              label: const Text('Outline with icon'),
            ),
            TextButton(
              onPressed: (){}, 
              child: const Text('Simple button'),
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.audio_file_sharp),
              label: const Text('Text Icon')
            ),
            const CustomButton(),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.atm),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.zoom_out_map_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton ({super.key});

  @override
  Widget build(BuildContext context) {    
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          hoverColor: colors.secondary,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('Personalized button', style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}