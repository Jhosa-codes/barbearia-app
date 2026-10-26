# AGENTS.md

Estado: Estrutura base do Flutter criada e analisada (sem errors, apenas infos de deprecation do Flutter 3.47). Telas: Login, Home, Serviços, Profissionais, Reservas, Feed, Chat, Perfil. Modelos: User, Service, Professional, Booking. Serviço Supabase configurado. Pronto para conectar Supabase e Clerk.

## Stack
- App móvel cliente: Flutter (Android + iOS), Flutter 3.47.8, Dart 3.13.7
- Painel web estabelecimento: Flutter Web
- Plataforma web super-admin: Flutter Web
- Banco: Supabase
- Autenticação: Clerk
- Deploy: Vercel (domínio padrão vercel.app, sem custom domain)
- Provedor de IA: Open Code, modelo nemotron 3.5 super vl free
- Limite: 500 usuários
- Pagamento: QR code ou na loja (sem cartão cadastrado no app)

## Git / repositório
- Git configurado globalmente: `user.name=joao`, `user.email=jhrj.2023@gmail.com`, branch padrão `main`
- Repositório GitHub privado: https://github.com/Jhosa-codes/barbearia-app
- Sem secret keys no código. Chaves apenas em `.env`, nunca commitar
- `.env` já está no `.gitignore`

## Ambiente (verificar antes de buildar)
- Android: `flutter doctor` — cmdline-tools e licenças podem estar faltando (`flutter doctor --android-licenses`, configurar `ANDROID_HOME`)
- iOS: requer macOS + Xcode; build de iOS na nuvem (não nativo no Windows)
- VS Code: extensões Flutter e Dart instaladas

## Comandos úteis
- `flutter doctor` — diagnóstico do ambiente móvel
- `flutter create .` — scaffoldar o projeto Flutter nesta pasta
- `gh auth login` — autenticar no GitHub CLI (já feito)
- `git push -u origin main` — enviar para o repositório privado

## Regras de segurança
- Secret keys: apenas em `.env`, nunca no código, nunca no git
- Coletar logs durante testes
- Revisar codebase antes de cada release
- Monitorar bugs e falhas de segurança após deploy
- Escala e performance: após o MVP 1, durante testes de carga