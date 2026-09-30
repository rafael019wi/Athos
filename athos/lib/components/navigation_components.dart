import 'package:flutter/material.dart';
import '../models/client.dart';
import 'client_theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.client, required this.selected, required this.onSelect});
  final Client client;
  final int selected;
  final ValueChanged<int> onSelect;
  @override
  Widget build(BuildContext context) => Container(
        width: 244,
        color: ink,
        padding: const EdgeInsets.fromLTRB(24, 28, 18, 22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Brand(light: true),
          const SizedBox(height: 52),
          const Text('MENU PRINCIPAL', style: TextStyle(color: Color(0xFF77797C), fontSize: 10, letterSpacing: 1.6, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          for (var i = 0; i < 4; i++) NavItem(index: i, selected: selected == i, onTap: () => onSelect(i)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF1C1D1F), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF303133))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.auto_awesome, color: gold, size: 18),
              const SizedBox(height: 12),
              const Text('Seu próximo nível começa aqui.', style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4, fontWeight: FontWeight.w600)),
              const SizedBox(height: 7),
              const Text('Desbloqueie todo o seu potencial.', style: TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 14),
              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(foregroundColor: gold, side: const BorderSide(color: gold), visualDensity: VisualDensity.compact), child: const Text('Conhecer ATHOS+'))),
            ]),
          ),
          const SizedBox(height: 22),
          Row(children: [
            CircleAvatar(radius: 17, backgroundColor: const Color(0xFF323438), child: Text(client.initial, style: const TextStyle(color: Colors.white, fontSize: 13))),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(client.name, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)), const SizedBox(height: 3), Text(client.plan, style: const TextStyle(color: muted, fontSize: 10))])),
            const Icon(Icons.more_horiz, color: muted, size: 19),
          ])
        ]),
      );
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.index, required this.selected, required this.onTap});
  final int index; final bool selected; final VoidCallback onTap;
  static const labels = ['Visão geral', 'Nutrição', 'Evolução', 'Comunidade'];
  static const icons = [Icons.grid_view_rounded, Icons.restaurant_menu_rounded, Icons.show_chart_rounded, Icons.people_alt_outlined];
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 5), child: Material(color: selected ? const Color(0xFF252629) : Colors.transparent, borderRadius: BorderRadius.circular(10), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(10), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), child: Row(children: [Icon(icons[index], size: 18, color: selected ? gold : const Color(0xFF929498)), const SizedBox(width: 12), Text(labels[index], style: TextStyle(color: selected ? Colors.white : const Color(0xFFB0B1B4), fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400)), if (index == 1) ...[const Spacer(), Container(width: 6, height: 6, decoration: const BoxDecoration(color: gold, shape: BoxShape.circle))]])))));
}

class Topbar extends StatelessWidget {
  const Topbar({super.key, required this.wide}); final bool wide;
  @override
  Widget build(BuildContext context) => Container(height: 76, padding: EdgeInsets.symmetric(horizontal: wide ? 42 : 20), decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Color(0xFFE8E8E5)))), child: Row(children: [if (!wide) const Brand(light: false), if (wide) const Text('QUARTA-FEIRA, 30 DE SETEMBRO', style: TextStyle(color: muted, fontSize: 10, letterSpacing: 1.3, fontWeight: FontWeight.w700)), const Spacer(), if (wide) ...[Container(width: 230, height: 38, padding: const EdgeInsets.symmetric(horizontal: 12), decoration: BoxDecoration(color: canvas, borderRadius: BorderRadius.circular(9)), child: const Row(children: [Icon(Icons.search, size: 17, color: muted), SizedBox(width: 8), Text('Buscar...', style: TextStyle(color: muted, fontSize: 12)), Spacer(), Text('⌘ K', style: TextStyle(color: muted, fontSize: 10))])), const SizedBox(width: 14)], IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded, color: ink)), const SizedBox(width: 4), const CircleAvatar(radius: 17, backgroundColor: ink, child: Text('M', style: TextStyle(color: Colors.white, fontSize: 12))), if (!wide) const SizedBox(width: 2)]));
}

class Brand extends StatelessWidget {
  const Brand({super.key, required this.light}); final bool light;
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
        CustomPaint(size: const Size(29, 29), painter: LogoPainter(color: light ? Colors.white : ink)),
        const SizedBox(width: 9), Text('ATHOS', style: TextStyle(color: light ? Colors.white : ink, fontSize: 16, letterSpacing: 4.4, fontWeight: FontWeight.w500)),
      ]);
}
class LogoPainter extends CustomPainter {
  LogoPainter({required this.color}); final Color color;
  @override
  void paint(Canvas canvas, Size s) { final p = Paint()..color = color; final left = Path()..moveTo(1, s.height * .9)..lineTo(s.width * .49, 1)..lineTo(s.width * .65, s.height * .31)..lineTo(s.width * .42, s.height * .76)..quadraticBezierTo(s.width * .32, s.height * .94, 1, s.height * .9)..close(); final right = Path()..moveTo(s.width * .55, s.height * .48)..lineTo(s.width * .98, s.height * .9)..quadraticBezierTo(s.width * .72, s.height * .99, s.width * .62, s.height * .77)..lineTo(s.width * .5, s.height * .59)..close(); canvas.drawPath(left, p); canvas.drawPath(right, p); }
  @override bool shouldRepaint(covariant LogoPainter oldDelegate) => oldDelegate.color != color;
}

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.selected, required this.onSelect}); final int selected; final ValueChanged<int> onSelect;
  @override Widget build(BuildContext context) { const icons = [Icons.grid_view_rounded, Icons.restaurant_menu_rounded, Icons.show_chart_rounded, Icons.people_alt_outlined]; return NavigationBar(height: 68, selectedIndex: selected, onDestinationSelected: onSelect, backgroundColor: Colors.white, indicatorColor: const Color(0xFFF0EEE8), destinations: List.generate(4, (i) => NavigationDestination(icon: Icon(icons[i]), label: const ['Início', 'Nutrição', 'Evolução', 'Social'][i]))); }
}


