class Client {
  const Client({required this.name, required this.plan});

  final String name;
  final String plan;

  String get initial => name.isEmpty ? '?' : name[0].toUpperCase();
}
