import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time/product_list_tab.dart';

import 'model/app_state_model.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final LatoLicense =
        await rootBundle.loadString("google_fonts/Lato-OFL.txt");
    final PlayfairLicense =
        await rootBundle.loadString("google_fonts/Playfair-OFL.txt");
    yield LicenseEntryWithLineBreaks(['google_fonts'], LatoLicense);
  });
  runApp(ChangeNotifierProvider<AppStateModel>(
    create: (_) => AppStateModel(),
    child: const MyApp(),  
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Time',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.darkBackgroundGray,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.clock)),
      ],),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ProductListTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ShoppingCartTab(),
              );
            });
            break;
        }
        return returnValue;
      },  
    )    
  }
}
