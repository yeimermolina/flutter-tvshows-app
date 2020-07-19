import 'package:flutter/material.dart';
import './data/data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/show_detail_screen.dart';
import './screens/category_shows_screen.dart';
import './screens/categories_screen.dart';
import './models/show.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'netflix': false,
    'prime': false,
    'hbo': false,
  };

  List<Show> _availableShows = SHOWS;

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableShows = SHOWS.where((show) {
        if(_filters['netflix'] == true && !show.isOnNetflix) {
          return false;
        }

        if(_filters['prime'] == true && !show.isOnPrime) {
          return false;
        }

        if(_filters['hbo'] == true && !show.isOnHbo) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TVshows',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.grey,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryShowsScreen.routeName: (ctx) => CategoryShowsScreen(_availableShows),
        ShowDetailScreen.routeName: (ctx) => ShowDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   // sends you back if trying to access a route that does not exist on routes
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//     @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TVshows App'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
