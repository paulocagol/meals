import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final settings;
  final Function(Settings) onSettingsChange;

  const SettingsScreen({
    Key key,
    this.onSettingsChange,
    this.settings,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    this.settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChange(settings);
      },
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch('Sem Glutém', 'Só exibe informações sem glutém!', settings.isGlutenFree, (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                  });
                }),
                _createSwitch('Sem Lactose', 'Só exibe informações sem lactose!', settings.isLactoseFree, (value) {
                  setState(() {
                    settings.isLactoseFree = value;
                  });
                }),
                _createSwitch('Vegana', 'Só exibe informações vegana!', settings.isVegan, (value) {
                  setState(() {
                    settings.isVegan = value;
                  });
                }),
                _createSwitch('Vegetariana', 'Só exibe informações vegetariana!', settings.isVegetarian, (value) {
                  setState(() {
                    settings.isVegetarian = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
