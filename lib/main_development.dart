import 'package:firebase_core/firebase_core.dart';
import 'package:my_portfolio_web_app/app/app.dart';
import 'package:my_portfolio_web_app/bootstrap.dart';
import 'package:my_portfolio_web_app/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // ProviderScope(child: App());
  );
  await bootstrap(() => const App());
}
