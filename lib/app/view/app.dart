import 'package:flutter/material.dart';
import 'package:my_portfolio_web_app/counter/counter.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
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
          color: Colors.blueAccent, //kBackgroundColor,
        ),
      ),
      home: const CounterPage(),
    );
  }
}
