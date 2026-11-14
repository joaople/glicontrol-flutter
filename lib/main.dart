import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';
import 'widgets/shared.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/register_screen.dart';
import 'screens/diet_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const GlicontrolApp());

class GlicontrolApp extends StatelessWidget {
  const GlicontrolApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Glicontrol', debugShowCheckedModeBanner: false, theme: appTheme(),
    locale: const Locale('pt', 'BR'), supportedLocales: const [Locale('pt', 'BR')],
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    initialRoute: '/', routes: {
      '/': (_) => const LoginScreen(), '/cadastro': (_) => const SignupScreen(),
      '/inicio': (_) => const AppShell(),
    },
  );
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}
class _AppShellState extends State<AppShell> {
  int tab = 0;
  static const titles = ['Olá, Maria', 'Histórico', 'Nova medição', 'Alimentação', 'Meu perfil'];
  @override
  Widget build(BuildContext context) => MobileFrame(child: Scaffold(
    appBar: PreferredSize(preferredSize: const Size.fromHeight(108),
      child: Container(decoration: const BoxDecoration(gradient: AppColors.hero),
        child: SafeArea(bottom: false, child: Padding(padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Glicontrol · demonstração', style: TextStyle(color: AppColors.surface)),
            const SizedBox(height: 4), Text(titles[tab],
              style: const TextStyle(color: AppColors.surface, fontSize: 26, fontWeight: FontWeight.w600)),
          ]))),
      )),
    body: IndexedStack(index: tab, children: [
      HomeScreen(onRegister: () => setState(() => tab = 2)),
      const HistoryScreen(), const RegisterScreen(), const DietScreen(), const ProfileScreen(),
    ]),
    bottomNavigationBar: NavigationBar(selectedIndex: tab,
      onDestinationSelected: (i) => setState(() => tab = i),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
        NavigationDestination(icon: Icon(Icons.show_chart), label: 'Histórico'),
        NavigationDestination(icon: Icon(Icons.add_circle_outline), label: 'Registrar'),
        NavigationDestination(icon: Icon(Icons.restaurant_outlined), label: 'Dieta'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
      ]),
  ));
}
