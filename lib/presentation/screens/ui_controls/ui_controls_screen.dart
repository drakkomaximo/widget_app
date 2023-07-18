import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  void setSelectedTransportationDynamic(value) {
    setState(() {
      selectedTransportation = value;
    });
  }

  String capitaliceString(value) {
    return StringUtils.capitalize(value);
    /* return StringUtils.capitalize(); */
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text(
              'Selecionaste: ${capitaliceString(selectedTransportation.toString().split('.').last)}'),
          children: [
            ...Transportation.values.map(
              (transportationValue) => RadioListTile(
                title: Text(
                    'By ${capitaliceString(transportationValue.toString().split('.').last)}'),
                subtitle: Text(
                    'Viajar por ${capitaliceString(transportationValue.toString().split('.').last)}'),
                value: transportationValue,
                groupValue: selectedTransportation,
                onChanged: setSelectedTransportationDynamic,
              ),
            )
          ],
        ),
      CheckboxListTile(
        title: const Text('¿Desayuno?'),
        value: wantsBreakfast, 
        onChanged: (value) => setState(() {
          wantsBreakfast = !wantsBreakfast;
        })),
      CheckboxListTile(
        title: const Text('Almuerzo?'),
        value: wantsDinner, 
        onChanged: (value) => setState(() {
          wantsDinner = !wantsDinner;
        })),
      CheckboxListTile(
        title: const Text('Cena?'),
        value: wantsLunch, 
        onChanged: (value) => setState(() {
          wantsLunch = !wantsLunch;
        })),
      ],
    );
  }
}
