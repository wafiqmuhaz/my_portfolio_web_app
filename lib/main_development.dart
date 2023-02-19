import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web_app/app/app.dart';
import 'package:my_portfolio_web_app/bootstrap.dart';

void main() {
  // ProviderScope(child: App());
  bootstrap(() => const App());
}
