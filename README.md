# Barbearia App

Aplicativo Flutter em desenvolvimento para organizar a experiência digital de uma barbearia. A estrutura atual reúne telas de autenticação, início, serviços, profissionais, reservas, feed, chat e perfil, além de modelos e serviços de integração.

> **Transparência sobre o processo:** este projeto foi criado com **vibe coding**, usando assistência de IA durante a implementação. O código e as integrações precisam de revisão humana, validação funcional e configuração do ambiente antes de qualquer uso em produção.

## Estado do projeto

O repositório contém a estrutura do aplicativo e pontos de integração com Supabase e autenticação. A presença das telas e serviços no código não significa que o fluxo completo esteja configurado ou validado. Credenciais e serviços externos precisam ser fornecidos pelo ambiente de desenvolvimento.

## Stack

- Flutter e Dart
- Supabase (`supabase_flutter`)
- Variáveis de ambiente com `flutter_dotenv`
- Cliente HTTP

## Pré-requisitos

- Flutter instalado e configurado (`flutter doctor`)
- Dart compatível com a restrição declarada em `pubspec.yaml`
- Credenciais e projeto Supabase próprios, se for habilitar a integração

## Configuração local

1. Clone o repositório e instale as dependências:

   ```bash
   git clone https://github.com/Jhosa-codes/barbearia-app.git
   cd barbearia-app
   flutter pub get
   ```

2. Copie `.env.example` para `.env` e preencha somente com valores de desenvolvimento.

3. Execute verificadores e inicie o app:

   ```bash
   flutter analyze
   flutter test
   flutter run
   ```

Os comandos devem ser executados após configurar o ambiente; os resultados podem depender dos serviços externos utilizados.

## Organização do código

```text
lib/
├── main.dart
└── src/
    ├── core/
    │   ├── models/       # Usuário, serviço, profissional e reserva
    │   ├── services/     # Inicialização, autenticação e repositório Supabase
    │   └── theme/        # Tema visual
    └── features/         # Telas por área do aplicativo
```

## Segurança

- Nunca publique chaves privadas, tokens ou arquivos `.env`.
- Use chaves apropriadas para cliente e políticas de acesso no Supabase.
- Revise dependências, permissões e regras do banco antes de disponibilizar builds.
- Não considere a configuração de exemplo como credencial funcional.

## Próximos passos

- Configurar e documentar o esquema e as políticas do Supabase.
- Validar os fluxos de autenticação e reserva ponta a ponta.
- Adicionar evidências visuais e instruções de build por plataforma.
- Revisar o código com análise estática, testes e revisão manual.

## Licença

Nenhuma licença foi identificada neste repositório. Consulte o autor antes de reutilizar ou redistribuir o código.
