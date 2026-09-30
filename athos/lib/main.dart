import 'package:flutter/material.dart';
import 'controllers/client_controller.dart';
import 'views/dashboard_view.dart';
import 'views/secondary_page_view.dart';
import 'components/navigation_components.dart';
import 'components/client_theme.dart';

void main() => runApp(const AthosApp());

class AthosApp extends StatelessWidget {
  const AthosApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ATHOS — Saúde & Performance',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: ClientTheme.canvas,
          colorScheme: ColorScheme.fromSeed(seedColor: ClientTheme.ink, surface: ClientTheme.canvas),
          fontFamily: 'Arial',
        ),
        home: const AthosHome(),
      );
}

class AthosHome extends StatefulWidget {
  const AthosHome({super.key});
  @override
  State<AthosHome> createState() => AthosHomeState();
}

class AthosHomeState extends State<AthosHome> {
  final controller = ClientController();
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    return Scaffold(
      body: Row(children: [
        if (wide)
          Sidebar(
            client: controller.client,
            selected: controller.selectedIndex,
            onSelect: (i) => setState(() => controller.selectPage(i)),
          ),
        Expanded(child: Column(children: [
          Topbar(wide: wide),
          Expanded(child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(wide ? 44 : 20, 28, wide ? 44 : 20, 36),
            child: Center(child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: controller.selectedIndex == 0
                  ? const DashboardView()
                  : SecondaryPageView(
                      title: ClientController.pages[controller.selectedIndex],
                      index: controller.selectedIndex,
                    ),
            )),
          )),
        ])),
      ]),
      bottomNavigationBar: wide ? null : BottomNav(selected: controller.selectedIndex, onSelect: (i) => setState(() => controller.selectPage(i))),
    );
  }
}
