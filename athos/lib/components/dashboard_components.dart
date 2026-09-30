import 'package:flutter/material.dart';
import 'client_theme.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key, required this.child, this.padding = const EdgeInsets.all(20)}); final Widget child; final EdgeInsets padding;
  @override Widget build(BuildContext context) => Container(padding: padding, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xFFE9E9E6))), child: child);
}
class CaloriesCard extends StatelessWidget {
  const CaloriesCard({super.key});
  @override Widget build(BuildContext context) => ContentCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const CardTitle(icon: Icons.local_fire_department_outlined, title: 'Calorias', trailing: 'HOJE'), const Spacer(), Row(crossAxisAlignment: CrossAxisAlignment.end, children: [const Text('1.284', style: TextStyle(color: ink, fontSize: 29, fontWeight: FontWeight.w600, letterSpacing: -1)), const Padding(padding: EdgeInsets.only(left: 5, bottom: 5), child: Text('kcal', style: TextStyle(color: muted, fontSize: 12))), const Spacer(), const Text('de 2.100', style: TextStyle(color: muted, fontSize: 11))]), const SizedBox(height: 12), const ProgressLine(value: .61, color: ink), const SizedBox(height: 9), const Text('816 kcal restantes', style: TextStyle(color: muted, fontSize: 11))]));
}
class MacrosCard extends StatelessWidget {
  const MacrosCard({super.key});
  @override Widget build(BuildContext context) => ContentCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const CardTitle(icon: Icons.donut_small_outlined, title: 'Macronutrientes', trailing: 'OBJETIVO'), const Spacer(), const MacroLine(name: 'Proteína', amount: '86 / 140 g', value: .61, color: Color(0xFF263C55)), const SizedBox(height: 10), const MacroLine(name: 'Carboidratos', amount: '142 / 230 g', value: .62, color: Color(0xFFC7A565)), const SizedBox(height: 10), const MacroLine(name: 'Gorduras', amount: '41 / 70 g', value: .58, color: Color(0xFF8A9A8C))]));
}
class WaterCard extends StatelessWidget {
  const WaterCard({super.key});
  @override Widget build(BuildContext context) => ContentCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const CardTitle(icon: Icons.water_drop_outlined, title: 'Hidratação', trailing: 'META DIÁRIA'), const Spacer(), Row(crossAxisAlignment: CrossAxisAlignment.end, children: [const Text('1,4', style: TextStyle(color: ink, fontSize: 29, fontWeight: FontWeight.w600, letterSpacing: -1)), const Padding(padding: EdgeInsets.only(left: 5, bottom: 5), child: Text('L', style: TextStyle(color: muted, fontSize: 12))), const Spacer(), const Text('de 2,5 L', style: TextStyle(color: muted, fontSize: 11))]), const SizedBox(height: 12), const ProgressLine(value: .56, color: Color(0xFF607F94)), const SizedBox(height: 9), Row(children: [const Text('Faltam 1,1 L', style: TextStyle(color: muted, fontSize: 11)), const Spacer(), InkWell(onTap: () {}, child: const Text('+ Adicionar', style: TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)))]),]));
}
class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.icon, required this.title, required this.trailing}); final IconData icon; final String title, trailing;
  @override Widget build(BuildContext context) => Row(children: [Icon(icon, size: 17, color: const Color(0xFF6F7276)), const SizedBox(width: 8), Expanded(child: Text(title, style: const TextStyle(color: ink, fontSize: 12, fontWeight: FontWeight.w600))), Text(trailing, style: const TextStyle(color: muted, fontSize: 8, letterSpacing: 1.1, fontWeight: FontWeight.w700))]);
}
class ProgressLine extends StatelessWidget {
  const ProgressLine({super.key, required this.value, required this.color}); final double value; final Color color;
  @override Widget build(BuildContext context) => ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: value, minHeight: 6, backgroundColor: const Color(0xFFEDEDEA), color: color));
}
class MacroLine extends StatelessWidget {
  const MacroLine({super.key, required this.name, required this.amount, required this.value, required this.color}); final String name, amount; final double value; final Color color;
  @override Widget build(BuildContext context) => Column(children: [Row(children: [Text(name, style: const TextStyle(color: Color(0xFF52555A), fontSize: 10)), const Spacer(), Text(amount, style: const TextStyle(color: ink, fontSize: 10, fontWeight: FontWeight.w600))]), const SizedBox(height: 5), ProgressLine(value: value, color: color)]);
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});
  @override Widget build(BuildContext context) => ContentCard(padding: const EdgeInsets.fromLTRB(21, 19, 21, 17), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SectionHeading(title: 'Progresso de hoje', subtitle: 'Quarta-feira, 30 de setembro'), const SizedBox(height: 21), Row(crossAxisAlignment: CrossAxisAlignment.center, children: [SizedBox(width: 138, height: 138, child: Stack(alignment: Alignment.center, children: [SizedBox.expand(child: CircularProgressIndicator(value: .68, strokeWidth: 9, strokeCap: StrokeCap.round, backgroundColor: const Color(0xFFECECE8), color: gold)), const Column(mainAxisSize: MainAxisSize.min, children: [Text('68%', style: TextStyle(color: ink, fontSize: 27, fontWeight: FontWeight.w600, letterSpacing: -1)), SizedBox(height: 2), Text('DA META', style: TextStyle(color: muted, fontSize: 8, letterSpacing: 1.3, fontWeight: FontWeight.w700))])])), const SizedBox(width: 25), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Muito bem, Marina!', style: TextStyle(color: ink, fontSize: 14, fontWeight: FontWeight.w600)), SizedBox(height: 6), Text('Você está mantendo um ótimo ritmo. Continue assim para alcançar sua meta.', style: TextStyle(color: muted, fontSize: 11, height: 1.5)), SizedBox(height: 17), Row(children: [Icon(Icons.local_fire_department_outlined, color: gold, size: 17), SizedBox(width: 6), Text('7 dias de sequência', style: TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600))])]))]), const SizedBox(height: 18), const Divider(height: 1, color: Color(0xFFECECE8)), const SizedBox(height: 13), Row(children: [const Icon(Icons.emoji_events_outlined, color: gold, size: 17), const SizedBox(width: 7), const Text('Missão de hoje', style: TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)), const Spacer(), const Text('+ 40 XP', style: TextStyle(color: Color(0xFF9A7839), fontSize: 10, fontWeight: FontWeight.w700))]), const SizedBox(height: 7), const Text('Registre todas as refeições do dia', style: TextStyle(color: muted, fontSize: 11))]));
}

class TodayCard extends StatelessWidget {
  const TodayCard({super.key});
  @override Widget build(BuildContext context) => ContentCard(padding: const EdgeInsets.fromLTRB(20, 19, 20, 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SectionHeading(title: 'Diário alimentar', subtitle: 'Seu dia, refeição por refeição'), const SizedBox(height: 12), const MealRow(icon: Icons.wb_sunny_outlined, title: 'Café da manhã', details: '08:15 · 420 kcal', state: 'Registrado', done: true), const Divider(height: 1, color: Color(0xFFECECE8)), const MealRow(icon: Icons.lunch_dining_outlined, title: 'Almoço', details: '12:30 · 640 kcal', state: 'Registrado', done: true), const Divider(height: 1, color: Color(0xFFECECE8)), const MealRow(icon: Icons.local_cafe_outlined, title: 'Lanche', details: 'Adicionar refeição', state: '', done: false), const Divider(height: 1, color: Color(0xFFECECE8)), const MealRow(icon: Icons.nights_stay_outlined, title: 'Jantar', details: 'Adicionar refeição', state: '', done: false)]));
}
class MealRow extends StatelessWidget {
  const MealRow({super.key, required this.icon, required this.title, required this.details, required this.state, required this.done}); final IconData icon; final String title, details, state; final bool done;
  @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Row(children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: done ? const Color(0xFFF1F0EC) : const Color(0xFFF7F7F4), borderRadius: BorderRadius.circular(9)), child: Icon(icon, size: 16, color: done ? ink : muted)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)), const SizedBox(height: 3), Text(details, style: const TextStyle(color: muted, fontSize: 9))])), if (done) const Icon(Icons.check_circle, color: Color(0xFF829281), size: 16) else const Icon(Icons.add_circle_outline, color: Color(0xFF96989A), size: 17)]));
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, required this.subtitle}); final String title, subtitle;
  @override Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: ink, fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.2)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: muted, fontSize: 10))]);
}
class WeekStrip extends StatelessWidget {
  const WeekStrip({super.key});
  @override
  Widget build(BuildContext context) {
    const days = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB', 'DOM'];
    const List<double> progress = [1, 1, .68, 0, 0, 0, 0];

    return ContentCard(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 17),
      child: Row(
        children: List.generate(
          days.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index == days.length - 1 ? 0 : 10),
              child: Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(
                      color: index == 2 ? ink : muted,
                      fontSize: 8,
                      letterSpacing: .8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 11),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: CircularProgressIndicator(
                          value: progress[index] == 0 ? .08 : progress[index],
                          strokeWidth: 3,
                          backgroundColor: const Color(0xFFECECE8),
                          color: index == 2 ? gold : ink,
                        ),
                      ),
                      if (progress[index] == 1)
                        const Icon(Icons.check, size: 13, color: ink)
                      else if (index == 2)
                        const Text(
                          '68',
                          style: TextStyle(
                            color: ink,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      else
                        Text(
                          '${19 + index}',
                          style: const TextStyle(color: muted, fontSize: 9),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index == 2 ? ink : muted,
                      fontSize: 10,
                      fontWeight: index == 2 ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AiBanner extends StatelessWidget {
  const AiBanner({super.key});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(15)), child: Row(children: [Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFF292A2C), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.auto_awesome, color: gold, size: 20)), const SizedBox(width: 14), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Uma escolha inteligente para o seu jantar', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)), SizedBox(height: 5), Text('Com base nas suas metas, a ATHOS AI tem uma sugestão para você.', style: TextStyle(color: Color(0xFFAFB0B2), fontSize: 10))])), TextButton(onPressed: () {}, style: TextButton.styleFrom(foregroundColor: gold), child: const Row(children: [Text('Ver sugestão', style: TextStyle(fontSize: 11)), SizedBox(width: 5), Icon(Icons.arrow_forward, size: 14)]))]));
}






