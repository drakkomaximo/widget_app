import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkmode = ref.watch( isDarkmodeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read( isDarkmodeProvider.notifier ).update((isDarkmode) => !isDarkmode);
            }, 
            icon: Icon( isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined )
            )
        ],
      ),
      body: Center(
        child: Text('valor: $clickCounter', style: const TextStyle( fontSize: 40, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          ref.read( counterProvider.notifier ).state++;
        },
      ),
    );
  }
}