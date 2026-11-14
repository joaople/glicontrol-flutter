# Glicontrol — sete telas em Flutter (Dart)

Entrega de código-fonte de um layout mobile para Android e iOS, inspirado na versão web do projeto. Não é um APK nem um aplicativo publicado. A prévia do Lovable continua sendo a versão web, não executa estes arquivos.

## Telas

1. Entrar
2. Cadastro
3. Início
4. Histórico, com gráfico
5. Registrar medição
6. Alimentação
7. Perfil

## Abrir e executar

Instale o Flutter estável (com Dart 3.4 ou superior), Android Studio ou VS Code e a extensão Flutter. Extraia este ZIP. No terminal, entre na pasta `glicontrol-flutter` e execute:

```sh
flutter doctor
flutter create --platforms=android,ios --project-name glicontrol .
flutter pub get
flutter run
```

O comando `flutter create` gera as pastas nativas Android/iOS e os arquivos de ferramentas que não vêm neste pacote. Se ele atualizar `test/widget_test.dart`, substitua o teste gerado por um teste que importe `GlicontrolApp`, ou remova o teste padrão de contador. O código em `lib/` é o aplicativo entregue. Selecione um emulador ou telefone conectado antes de `flutter run`.

Para iOS, é necessário macOS com Xcode, simulador/dispositivo configurado e assinatura Apple para distribuição. Android pode ser desenvolvido em Windows, Linux ou macOS. Não há integração com serviços externos nem chaves privadas neste pacote.

## Uso demonstrativo

Preencha e-mail e senha para entrar. O cadastro exige campos preenchidos e consentimento. Isso apenas navega entre telas: **não cria conta, não autentica nem implementa conformidade LGPD**. Maria Souza, o e-mail, as medições e as refeições são exemplos fictícios. O gráfico usa o mesmo conjunto de demonstração nos três períodos. Editar/excluir/salvar mostram um aviso e não gravam dados; textos de artigos são apenas títulos. Os campos e seletores têm estado temporário, descartado ao encerrar a sessão.

A faixa 70–140 mg/dL é apenas uma referência demonstrativa, não uma recomendação clínica. Alterar os campos no perfil não muda a classificação nem o gráfico nesta versão. Orientações educativas não substituem acompanhamento profissional. A média exibida (113) corresponde às seis medições de exemplo, arredondada; não há registros reais de sete dias.

## Organização

- `lib/main.dart`: entrada, navegação e menu inferior.
- `lib/theme.dart`: cores e tema Material.
- `lib/screens/`: sete telas.
- `lib/widgets/shared.dart`: campos, áreas roláveis e apresentação comum.
- `lib/models/demo_data.dart`: dados fictícios e classificação demonstrativa.
- `test/`: testes incluídos para execução local.

As telas usam largura limitada em tablets, áreas seguras, listas roláveis e ajustes com teclado. Não há bloqueio de orientação. Fontes são as do sistema, sem downloads externos.

## Verificação local obrigatória

```sh
dart format lib test
flutter analyze
flutter test
```

**Limite da entrega:** o código foi revisado estaticamente, mas não compilado nem testado com Flutter neste ambiente. Os testes estão incluídos, não foram executados aqui. Antes de publicar, confira cada tela em Android/iOS, teclado aberto, modo paisagem e fontes ampliadas; implemente autenticação, armazenamento seguro, validação clínica e privacidade.
