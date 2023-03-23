import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/Screens.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(
          //   create: (ctx) => ProductsManager(),
          // ),
          ChangeNotifierProvider(
            create: (ctx) => AuthManager(),
          ),
          ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
            create: (ctx) => ProductsManager(),
            update: (ctx, authManager, productsManager) {
              productsManager!.authToken = authManager.authToken;
              return productsManager;
            },
          ),
          ChangeNotifierProvider(
            create: (ctx) => CartManager(),
          ),
          // ChangeNotifierProvider(
          //   create: (ctx) => OrdersManager(),
          // ),
        ],
        child: Consumer<AuthManager>(builder: (context, authManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App order',
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: TextStyle(color: ksecondaryColor),
                bodyText2: TextStyle(color: ksecondaryColor),
              ),
            ),
            //home: UserProductsScreen(),
            home: WelcomeScreen(),
            routes: {
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              // User
            },
            onGenerateRoute: (settings) {
              if (settings.name == EditProductScreen.routeName) {
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditProductScreen(
                      productId != null
                          ? ctx.read<ProductsManager>().findById(productId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },

            // home: authManager.isAuth
            //     ? HomeScreen()
            //     : FutureBuilder(
            //         future: authManager.tryAutoLogin(),
            //         builder: (context, snapshot) {
            //           return snapshot.connectionState == ConnectionState.waiting
            //               ? const SplashScreen()
            //               : HomeScreen();
            //         },
            //       ),
          );
        }));
  }
}
