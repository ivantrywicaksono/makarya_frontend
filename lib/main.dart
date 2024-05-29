import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:makarya_frontend/screens/editprofil.dart';
import 'package:makarya_frontend/screens/screens.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'utils/utils.dart';

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

  initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // GoRouter configuration
  final _router = GoRouter(
    // redirect: (context, state) {},
    navigatorKey: _rootNavigatorKey,
    // initialLocation: '/galeri/comments',
    initialLocation: '/komunitas/create',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => DaftarPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
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
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'edit-user',
                builder: (context, state) => EditProfilePage(),
              ),
            ],
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
            builder: (context, state) => GaleriScreen(),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'create',
                builder: (context, state) => CreatePublikasiScreen(
                  title: 'Tambah Publikasi',
                ),
              ),
              GoRoute(
                path: ':publikasiId',
                builder: (context, state) => GaleriScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'edit',
                    builder: (context, state) => UpdatePublikasiScreen(
                      title: 'Ubah Publikasi',
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'comments',
                    builder: (context, state) => CommentsScreen(
                      title: 'Komentar',
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/komunitas',
            builder: (BuildContext context, GoRouterState state) =>
                KomunitasListPage(),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'create',
                builder: (context, state) => CreateEventScreen(
                    title: 'Tambah Acara'), //Create Screen
              ),
              GoRoute(
                path: ':komunitasId',
                builder: (context, state) => DetailKomunitas(), //Read Screen
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'edit',
                    builder: (context, state) => UpdatePublikasiScreen(
                        title: 'Ubah Publikasi'), //Update Screen
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/pengajuan',
            builder: (BuildContext context, GoRouterState state) =>
                LihatPengajuan(),
            routes: <RouteBase>[
              GoRoute(
                path: 'create',
                builder: (context, state) => PengajuanPage(),
              ),
            ],
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
            background: Colors.white,
            seedColor: Utils.primaryColor,
            primary: Utils.primaryColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Utils.primaryColor,
            foregroundColor: Colors.white,
          ),
          dividerTheme: DividerThemeData(
            color: Colors.black,
            space: 0,
          )),
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
            icon: Icon(CupertinoIcons.house_fill),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
            ),
            label: 'Galeri',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_fill),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text_fill),
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
      return 0;
    }
    if (location.startsWith('/galeri')) {
      return 1;
    }
    if (location.startsWith('/komunitas')) {
      return 2;
    }
    if (location.startsWith('/pengajuan')) {
      return 3;
    }
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
