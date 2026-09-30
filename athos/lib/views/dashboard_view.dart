import 'package:flutter/material.dart';

import '../components/client_theme.dart';
import '../components/dashboard_components.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUARTA-FEIRA, 30 SET',
                    style: TextStyle(
                      color: muted,
                      fontSize: 10,
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    'Bom dia, Marina',
                    style: TextStyle(
                      color: ink,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Um passo de cada vez. Você está no caminho certo.',
                    style: TextStyle(color: Color(0xFF777A7E), fontSize: 13),
                  ),
                ],
              ),
            ),
            if (MediaQuery.sizeOf(context).width >= 980)
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Registrar refeição'),
                style: FilledButton.styleFrom(
                  backgroundColor: ink,
                  foregroundColor: Colors.white,
                ),
              ),
          ],
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 760 ? 3 : 1;
            return GridView.count(
              crossAxisCount: columns,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: columns == 3 ? 1.27 : 1.38,
              children: const [CaloriesCard(), MacrosCard(), WaterCard()],
            );
          },
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 780) {
              return const Column(
                children: [
                  ProgressCard(),
                  SizedBox(height: 18),
                  TodayCard(),
                ],
              );
            }
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: ProgressCard()),
                SizedBox(width: 18),
                Expanded(flex: 4, child: TodayCard()),
              ],
            );
          },
        ),
        const SizedBox(height: 28),
        const SectionHeading(
          title: 'Sua semana',
          subtitle: 'Consistência é o que transforma resultados.',
        ),
        const SizedBox(height: 13),
        const WeekStrip(),
        const SizedBox(height: 25),
        const AiBanner(),
      ],
    );
  }
}
