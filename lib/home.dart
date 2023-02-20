import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:dynamic_theming/theme/theme_collection.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int dropdownvalue = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownvalue = DynamicTheme.of(context)!.themeId;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Text('Select your theme here:'),
          ),
          DropdownButton(
              icon: const Icon(Icons.arrow_downward),
              value: dropdownvalue,
              items: [
                DropdownMenuItem(
                    value: AppThemes.LightBlue,
                    child: Text(AppThemes.toStr(AppThemes.LightBlue))),
                DropdownMenuItem(
                    value: AppThemes.LightRed,
                    child: Text(AppThemes.toStr(AppThemes.LightRed))),
                DropdownMenuItem(
                    value: AppThemes.DarkBlue,
                    child: Text(AppThemes.toStr(AppThemes.DarkBlue))),
                DropdownMenuItem(
                    value: AppThemes.DarkRed,
                    child: Text(AppThemes.toStr(AppThemes.DarkRed))),
              ],
              onChanged: (dynamic themeId) async {
                await DynamicTheme.of(context)!.setTheme(themeId);
                setState(() {
                  dropdownvalue = themeId;
                });
              }),
          Container(
            margin: const EdgeInsets.all(20),
            width: 100,
            height: 200,
            color: theme.primaryColor,
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Container in primary color and primary text theme',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.bodyText2))),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 100,
            height: 100,
            color: theme.colorScheme.secondary,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Container in accent color and with accent text theme',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2),
            )),
          ),
          ElevatedButton(
              onPressed: () {}, child: const Text('Elevated Button')),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notifications"),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
