# ATHOS

Aplicação Flutter de saúde e performance.

## Executar

Abra um terminal na pasta `athos` (a pasta que contém `pubspec.yaml`) e execute:

```bash
flutter pub get
flutter devices
flutter run
```

Para escolher um dispositivo específico, use `flutter run -d <id>`. Para executar no navegador Chrome, use `flutter run -d chrome`.

## Testes

```bash
flutter test
```

## Estrutura do cliente

- `lib/models`: dados e entidades do cliente.
- `lib/controllers`: estado e ações da navegação do cliente.
- `lib/views`: dashboard e páginas da interface.
- `lib/components`: componentes reutilizáveis, navegação e tema.
- `lib/main.dart`: inicialização do app.
