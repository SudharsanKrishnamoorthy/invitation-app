import 'package:flutter/material.dart';
import 'package:invitation/views/pages/index.dart';
import 'package:invitation/views/splash/splash_screen.dart';

class Router {
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String album = '/album';
  static const String details = '/details';
  static const String events = '/events';
  static const String explore = '/explore';
  static const String favourite = '/favourite';
  static const String wishes = '/wishes';
  static const String video = '/video';
  static const String eventDetails = '/eventDetails';

  static String currentPage = initialRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentPage = settings.name;
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case album:
        return MaterialPageRoute(builder: (_) => AlbumPage());

      case details:
        return MaterialPageRoute(builder: (_) => DetailsPage());

      case events:
        return MaterialPageRoute(builder: (_) => EventsPage());

      case explore:
        return MaterialPageRoute(builder: (_) => ExplorePage());

      case favourite:
        return MaterialPageRoute(builder: (_) => FavouritesPage());

      case wishes:
        return MaterialPageRoute(builder: (_) => WishesPage());

      case video:
        return MaterialPageRoute(builder: (_) => VideoPage());

      case eventDetails:
        return MaterialPageRoute(builder: (_) => EventDetailsPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
