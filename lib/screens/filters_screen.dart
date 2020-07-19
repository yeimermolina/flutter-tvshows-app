import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isOnNetflix = false;
  bool isOnPrime = false;
  bool isOnHbo = false;

  @override
  void initState() {
    setState(() {
      isOnNetflix = widget.filters['netflix'];
      isOnPrime = widget.filters['prime'];
      isOnHbo = widget.filters['hbo'];
    });
    super.initState();
  }

  void _applyFilters() {
    final _selectedFilters = {
    'netflix': isOnNetflix,
    'prime': isOnPrime,
    'hbo': isOnPrime,
  };
    widget.saveFilters(_selectedFilters);
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _applyFilters,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your shows',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Netflix shows',
                  'Shows available only on netflix',
                  isOnNetflix,
                  (currentValue) {
                    setState(() {
                      isOnNetflix = currentValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Prime Shows',
                  'Shows available only on Amazon Prime',
                  isOnPrime,
                  (currentValue) {
                    setState(
                      () {
                        isOnPrime = currentValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'HBO Shows',
                  'Shows available only on HBO',
                  isOnHbo,
                  (currentValue) {
                    setState(
                      () {
                        isOnHbo = currentValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
