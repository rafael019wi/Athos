import 'package:flutter/material.dart';
import '../components/client_theme.dart';
import '../components/dashboard_components.dart';

class SecondaryPageView extends StatelessWidget {
  const SecondaryPageView({super.key, required this.title, required this.index}); final String title; final int index;
  @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: ink, fontSize: 28, fontWeight: FontWeight.w600)), const SizedBox(height: 7), const Text('Seu espaço para cuidar de cada detalhe da sua jornada.', style: TextStyle(color: muted, fontSize: 13)), const SizedBox(height: 25), ContentCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon([Icons.restaurant_menu, Icons.show_chart, Icons.people_alt_outlined][index - 1], color: gold, size: 24), const SizedBox(height: 15), Text(['Registre e acompanhe suas refeições','Acompanhe sua evolução','Encontre sua comunidade'][index - 1], style: const TextStyle(color: ink, fontSize: 17, fontWeight: FontWeight.w600)), const SizedBox(height: 8), const Text('Em breve, uma experiência completa e personalizada para você.', style: TextStyle(color: muted, fontSize: 12)), const SizedBox(height: 19), FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: ink), child: Text(index == 1 ? 'Registrar refeição' : 'Explorar'))]))]);
}




