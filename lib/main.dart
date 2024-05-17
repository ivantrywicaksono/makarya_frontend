import 'package:makarya_frontend/screens/screens.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // GoRouter configuration
  final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Home(child: child);
        },
        routes: <RouteBase>[
          /// The first screen to display in the bottom navigation bar.
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
            // routes: <RouteBase>[
            //   // The details screen to display stacked on the inner Navigator.
            //   // This will cover screen A but not the application shell.
            //   GoRoute(
            //     path: 'details',
            //     builder: (BuildContext context, GoRouterState state) {
            //       // return const DetailsScreen();
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: '/galeri',
            builder: (BuildContext context, GoRouterState state) =>
                Text("Galeri"),
          ),
          GoRoute(
            path: '/komunitas',
            builder: (BuildContext context, GoRouterState state) =>
                Text("Komunitas"),
          ),
          GoRoute(
            path: '/pengajuan',
            builder: (BuildContext context, GoRouterState state) =>
                PengajuanPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Makarya",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(58, 24, 5, 1),
          primary: Color.fromRGBO(58, 24, 5, 1),
        ),
      ),
      routerConfig: _router,
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Galeri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'Pengajuan',
          ),
        ],
        // currentIndex: _calculateSelectedIndex(context),
        currentIndex: _selectedIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    print(location);
    if (location.startsWith('/')) {
      print('location 0');
      return 0;
    }
    if (location.startsWith('/galeri')) {
      print('location 1');
      return 1;
    }
    if (location.startsWith('/komunitas')) {
      print('location 2');
      return 2;
    }
    if (location.startsWith('/pengajuan')) {
      print('location 3');
      return 3;
    }
    print('${location} not found');
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          GoRouter.of(context).go('/');
        case 1:
          GoRouter.of(context).go('/galeri');
        case 2:
          GoRouter.of(context).go('/komunitas');
        case 3:
          GoRouter.of(context).go('/pengajuan');
      }
    });
  }
}
