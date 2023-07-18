import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Sunt exercitation ut duis ex cillum ipsum amet pariatur. Dolor ex ad ipsum consectetur aliquip aliqua. Eiusmod amet aliqua nulla minim ex in consectetur. Incididunt duis pariatur sit culpa. Veniam laborum amet ut ad enim nostrud sunt magna ad officia incididunt cupidatat. Exercitation sit nostrud labore proident consequat consectetur elit tempor ipsum reprehenderit do eu id velit. Sunt consectetur Lorem aliqua proident nulla voluptate.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Incididunt qui occaecat et dolor incididunt ullamco reprehenderit. Irure in consectetur eu dolore cillum. Laboris minim deserunt duis aliqua. Esse veniam anim cupidatat commodo. Nostrud commodo aute quis nulla fugiat ut adipisicing esse irure. Enim ipsum duis ex amet officia.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostar diálogo'))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
