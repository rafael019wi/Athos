import '../models/client.dart';

class ClientController {
  ClientController({Client? client})
      : client = client ?? const Client(name: 'Marina Costa', plan: 'Plano gratuito');

  final Client client;
  int selectedIndex = 0;

  static const pages = ['Visão geral', 'Nutrição', 'Evolução', 'Comunidade'];

  void selectPage(int index) {
    if (index < 0 || index >= pages.length) return;
    selectedIndex = index;
  }
}

