// ignore_for_file: unused_import, always_use_package_imports, prefer_const_constructors, lines_longer_than_80_chars

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web_app/counter/counter.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../lang/lang.dart';
import '../../portfolio/pages/home/home.dart';
import '../../portfolio/provider/theme.dart';
import '../../portfolio/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConfigCubit(),
        )
      ],
      child: ProviderScope(
        child: Consumer(
          builder: (context, ref, _) {
            return ThemeProvider(
              initTheme: ref.watch(themeProvider).isDarkMode
                  ? MyThemes.darkTheme
                  : MyThemes.lightTheme,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: kPrimaryColor,
                  primarySwatch: Colors.yellow,
                ),
                // theme: ThemeData(
                //   appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
                //   colorScheme: ColorScheme.fromSwatch(
                //     accentColor: const Color(0xFF13B9FF),
                //   ),
                // ),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                locale: context.watch<ConfigCubit>().state.currentLocale,
                supportedLocales: AppLocalizations.supportedLocales,
                builder: (context, widget) => ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, widget ?? Container()),
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(450, name: MOBILE),
                    const ResponsiveBreakpoint.resize(800, name: TABLET),
                    const ResponsiveBreakpoint.resize(1000, name: TABLET),
                    const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                    const ResponsiveBreakpoint.resize(2460, name: '4K'),
                  ],
                  background: Container(
                    color: kBackgroundColor,
                  ),
                ),
                home: Home(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// MaterialApp(
//       // theme: ThemeData(
//       //   appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//       //   colorScheme: ColorScheme.fromSwatch(
//       //     accentColor: const Color(0xFF13B9FF),
//       //   ),
//       // ),
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       builder: (context, widget) => ResponsiveWrapper.builder(
//         ClampingScrollWrapper.builder(context, widget ?? Container()),
//         defaultScale: true,
//         breakpoints: [
//           const ResponsiveBreakpoint.resize(450, name: MOBILE),
//           const ResponsiveBreakpoint.resize(800, name: TABLET),
//           const ResponsiveBreakpoint.resize(1000, name: TABLET),
//           const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
//           const ResponsiveBreakpoint.resize(2460, name: '4K'),
//         ],
//         background: Container(
//           color: Colors.blueAccent, //kBackgroundColor,
//         ),
//       ),
//       home: Home(),
//     );
