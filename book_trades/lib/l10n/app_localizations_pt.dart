// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get login_page => 'Página de Login';

  @override
  String get username => 'Usuário';

  @override
  String get password => 'Senha';

  @override
  String get login => 'Logar';

  @override
  String get clear => 'Limpar';

  @override
  String get empty => 'Vazio';

  @override
  String get wrong_username => 'Usuário incorreto';

  @override
  String get wrong_password => 'Senha incorreta';

  @override
  String get main_page => 'Página Principal';

  @override
  String get logout => 'Logout';

  @override
  String get some_text_here => 'Algum texto aqui!';

  @override
  String get loading => 'Carregando...';

  @override
  String get view_log_of_login_tries => 'Ver o registro de tentativas de login';

  @override
  String get login_tries_page => 'Página de tentativas de Login';

  @override
  String get login_tries_so_far => 'Tentativas até o momento:';

  @override
  String get navBarHome => 'Trocas';

  @override
  String get navBarMyExchanges => 'Minhas Trocas';

  @override
  String get navBarNewExchange => 'Nova Troca';

  @override
  String get mainPageTitle => 'Trocas';

  @override
  String get myExchangesPageTitle => 'Minhas Trocas';

  @override
  String get mainPageWelcomeMessage => 'Bem-vindo à Página Principal!';

  @override
  String get noExchangesAvailable => 'Nenhuma troca disponível.';

  @override
  String errorLoadingExchanges(Object errorMessage) {
    return 'Erro ao carregar trocas: $errorMessage';
  }

  @override
  String get exchangeState => 'Estado';

  @override
  String get exchangeSearchingFor => 'Buscando por';

  @override
  String get exchangeSuggestions => 'Sugestões';

  @override
  String get exchangeOffers => 'Ofertas';

  @override
  String exchangeOfferItem(Object bookName, Object bookState) {
    return '- $bookName ($bookState)';
  }

  @override
  String get searchBarHint => 'Pesquisar';

  @override
  String noExchangesFoundForQuery(Object query) {
    return 'Nenhuma troca encontrada para \"$query\".';
  }

  @override
  String get newExchangePageTitle => 'Cadastrar troca';

  @override
  String get bookNameHint => 'Nome do livro (obrigatório)';

  @override
  String get bookStateTitle => 'Estado do livro (obrigatório)';

  @override
  String get stateNew => 'Novo';

  @override
  String get stateSemiNew => 'Seminovo';

  @override
  String get statePreserved => 'Conservado';

  @override
  String get stateDamaged => 'Danificado';

  @override
  String get genresTitle => 'Gêneros buscados';

  @override
  String get onlySuggestions => 'Apenas as sugestões de troca';

  @override
  String get genreFantasy => 'Fantasia';

  @override
  String get genreSciFi => 'Ficção científica';

  @override
  String get genreMystery => 'Mistério';

  @override
  String get genreRomance => 'Romance';

  @override
  String get genreHorror => 'Terror';

  @override
  String get genreNonFiction => 'Não ficção';

  @override
  String get suggestionsHint => 'Sugestões de troca';

  @override
  String get registerButton => 'Cadastrar';

  @override
  String get exchangeRegisteredSuccess => 'Troca cadastrada com sucesso!';

  @override
  String get validationRequiredField => 'Este campo é obrigatório.';

  @override
  String get validationSelectState =>
      'Por favor, selecione um estado para o livro.';

  @override
  String get genresOrSuggestionsRequired =>
      'Por favor, selecione pelo menos um gênero ou preencha as sugestões.';

  @override
  String get exchangeRegisteredError => 'Erro ao registrar troca.';

  @override
  String get unknownError => 'Ocorreu um erro desconhecido.';

  @override
  String get exchangeDetailsTitle => 'Detalhes da Troca';

  @override
  String get makeOfferTitle => 'Fazer uma Oferta';

  @override
  String get offeringBookNameHint => 'Nome do livro que você oferece';

  @override
  String get offeringBookStateTitle => 'Estado do seu livro';

  @override
  String get makeOfferButton => 'Fazer Oferta';

  @override
  String get offerMadeSuccessfully => 'Oferta realizada com sucesso!';

  @override
  String get failedToMakeOffer => 'Falha ao fazer oferta.';

  @override
  String get userNotLoggedInError =>
      'Você precisa estar logado para fazer uma oferta.';

  @override
  String get currentOffersTitle => 'Ofertas Atuais para esta Troca';

  @override
  String get offeredBook => 'Livro Ofertado';

  @override
  String get offeredBookState => 'Estado';
}
