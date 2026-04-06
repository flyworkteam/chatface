///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsPt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Bem-vindo ${name}';
	@override String welcome2({required Object appName}) => 'Bem-vindo ao ${appName}';
	@override String get get_started => 'Começar';
	@override String get next => 'Próximo';
	@override String get back => 'Voltar';
	@override String get skip => 'Pular';
	@override String get profile => 'Perfil';
	@override String get kContinue => 'Continuar';
	@override late final _TranslationsTermOfServicePt termOfService = _TranslationsTermOfServicePt._(_root);
	@override String get cookies => 'Política de Cookies';
	@override String get privacy => 'Política de Privacidade';
	@override late final _TranslationsOnboardingPt onboarding = _TranslationsOnboardingPt._(_root);
	@override String get pressBackAgainToExit => 'Pressione voltar novamente para sair';
	@override late final _TranslationsSplashPt splash = _TranslationsSplashPt._(_root);
	@override late final _TranslationsAuthPt auth = _TranslationsAuthPt._(_root);
	@override late final _TranslationsHomePt home = _TranslationsHomePt._(_root);
	@override late final _TranslationsCharactersPt characters = _TranslationsCharactersPt._(_root);
	@override late final _TranslationsNotificationsPt notifications = _TranslationsNotificationsPt._(_root);
	@override late final _TranslationsVideoChatPt videoChat = _TranslationsVideoChatPt._(_root);
	@override late final _TranslationsVoiceChatPt voiceChat = _TranslationsVoiceChatPt._(_root);
	@override late final _TranslationsChatPt chat = _TranslationsChatPt._(_root);
	@override late final _TranslationsEditProfilePt editProfile = _TranslationsEditProfilePt._(_root);
	@override late final _TranslationsSettingsSupportPt settingsSupport = _TranslationsSettingsSupportPt._(_root);
	@override late final _TranslationsDeleteAccountPt deleteAccount = _TranslationsDeleteAccountPt._(_root);
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Excluir';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Editar perfil';
	@override String get settings => 'Configurações';
	@override String get undo => 'Desfazer';
	@override String get successfully => 'Com sucesso';
	@override String get save => 'Salvar';
	@override late final _TranslationsLanguageOptionsPt languageOptions = _TranslationsLanguageOptionsPt._(_root);
}

// Path: termOfService
class _TranslationsTermOfServicePt implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServicePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Ao se inscrever no swipe, você concorda com nossos ';
	@override String get link1 => 'Termos de Serviço';
	@override String get text2 => '. Saiba como processamos seus dados em nossa ';
	@override String get link2 => 'Política de Privacidade';
	@override String get text3 => ' e ';
	@override String get link3 => 'Política de Cookies';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyPt privacyPolicy = _TranslationsTermOfServicePrivacyPolicyPt._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServicePt termsOfService = _TranslationsTermOfServiceTermsOfServicePt._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyPt cookiePolicy = _TranslationsTermOfServiceCookiePolicyPt._(_root);
}

// Path: onboarding
class _TranslationsOnboardingPt implements TranslationsOnboardingEn {
	_TranslationsOnboardingPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep1Pt step1 = _TranslationsOnboardingStep1Pt._(_root);
	@override late final _TranslationsOnboardingStep2Pt step2 = _TranslationsOnboardingStep2Pt._(_root);
	@override late final _TranslationsOnboardingStep3Pt step3 = _TranslationsOnboardingStep3Pt._(_root);
	@override late final _TranslationsOnboardingStep4Pt step4 = _TranslationsOnboardingStep4Pt._(_root);
	@override late final _TranslationsOnboardingStep5Pt step5 = _TranslationsOnboardingStep5Pt._(_root);
	@override late final _TranslationsOnboardingLoadingPt loading = _TranslationsOnboardingLoadingPt._(_root);
	@override String get allowAccess => 'Permitir acesso';
	@override String get iUnderstand => 'Entendi';
}

// Path: splash
class _TranslationsSplashPt implements TranslationsSplashEn {
	_TranslationsSplashPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Pt screen1 = _TranslationsSplashScreen1Pt._(_root);
	@override late final _TranslationsSplashScreen2Pt screen2 = _TranslationsSplashScreen2Pt._(_root);
}

// Path: auth
class _TranslationsAuthPt implements TranslationsAuthEn {
	_TranslationsAuthPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get google => 'Continuar com o Google';
	@override String get facebook => 'Continuar com o Facebook';
	@override String get apple => 'Continuar com o Apple';
	@override String get guest => 'Continuar como convidado';
	@override String signInFailed({required Object error}) => 'Falha no login: ${error}';
}

// Path: home
class _TranslationsHomePt implements TranslationsHomeEn {
	_TranslationsHomePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Ver tudo';
	@override String get more => 'Mais';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override late final _TranslationsHomePlaceholdersPt placeholders = _TranslationsHomePlaceholdersPt._(_root);
}

// Path: characters
class _TranslationsCharactersPt implements TranslationsCharactersEn {
	_TranslationsCharactersPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get all => 'Todos';
	@override String get favorites => 'Favoritos';
	@override String get recent => 'Recentes';
	@override String get characters => 'Personagens';
	@override String get placeholderSubtitle => 'Designer de produto focado em simplicidade e usabilidade.';
	@override late final _TranslationsCharactersCharacterDetailsPt characterDetails = _TranslationsCharactersCharacterDetailsPt._(_root);
}

// Path: notifications
class _TranslationsNotificationsPt implements TranslationsNotificationsEn {
	_TranslationsNotificationsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get today => 'Hoje';
	@override String get yesterday => 'Ontem';
	@override String weekAgo({required Object week}) => 'há ${week} semana(s)';
	@override String monthAgo({required Object month}) => 'há ${month} mês(es)';
	@override String yearAgo({required Object year}) => 'há ${year} ano(s)';
	@override String get noNotifications => 'Ainda não há notificações.';
	@override String get noNotificationsSubtitle => 'Não se esqueça de verificar novamente quando receber uma notificação.';
	@override String get allDeleted => 'Todas as notificações foram excluídas com sucesso';
}

// Path: videoChat
class _TranslationsVideoChatPt implements TranslationsVideoChatEn {
	_TranslationsVideoChatPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Conectando...';
	@override String get callEnded => 'Chamada encerrada';
	@override String callFailed({required Object error}) => 'Chamada falhou: ${error}';
	@override String get mute => 'Mudo';
	@override String get unmute => 'Ativar som';
	@override String get endCall => 'Encerrar chamada';
	@override String get swipeToChat => 'Arraste para conversar';
	@override String get male => 'Masculino';
	@override String get female => 'Feminino';
	@override String get country => 'País';
	@override String get follow => 'Seguir';
	@override String get unfollow => 'Deixar de seguir';
	@override String get callEndedMessage => 'A chamada de vídeo terminou.';
	@override String get swipeForNewChat => 'Arraste para um novo chat';
}

// Path: voiceChat
class _TranslationsVoiceChatPt implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Conectando...';
	@override String get callEnded => 'Chamada encerrada';
	@override String callFailed({required Object error}) => 'Chamada falhou: ${error}';
	@override String get calling => 'Chamando...';
}

// Path: chat
class _TranslationsChatPt implements TranslationsChatEn {
	_TranslationsChatPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get message => 'Mensagem';
	@override String get history => 'Histórico';
	@override String get noMessages => 'Ainda não há mensagens.';
	@override String get noMessagesSubtitle => 'Comece uma conversa enviando uma mensagem.';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override String get gallery => 'Galeria';
	@override String get camera => 'Câmera';
	@override String get typeAMessage => 'Digite uma mensagem...';
	@override String get pleaseUpgrade => 'Por favor, atualize para a versão Pro.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Voice call ended';
	@override String get videoCallEnded => 'Video call ended';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfilePt implements TranslationsEditProfileEn {
	_TranslationsEditProfilePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Sobre mim';
	@override String get aboutMeHint => 'Escreva algo sobre você';
	@override String get fullName => 'Nome completo';
	@override String get gender => 'Gênero';
	@override String get male => 'Masculino';
	@override String get female => 'Feminino';
	@override String get dontWantToMention => 'Prefiro não mencionar.';
	@override String get country => 'País';
	@override String get languagePreferences => 'Preferências de idioma';
	@override String get selectLanguage => 'Adicione seu idioma preferido';
	@override String get saved => 'Salvo';
	@override String get changesSaved => 'As alterações foram salvas.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportPt implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configurações & Suporte';
	@override String get premiumTitle => 'Acesso ilimitado a todos os recursos';
	@override String get getPremium => 'Obter Premium';
	@override String get settingsHub => 'Central de configurações';
	@override String get shareTheApp => 'Compartilhar o app';
	@override String get rateUs => 'Avalie-nos';
	@override String get version => 'Versão';
	@override String get notifications => 'Notificações';
	@override String get accountManagement => 'Gerenciamento de conta';
	@override String get deleteAccount => 'Excluir conta';
	@override String get logOut => 'Sair';
	@override String get logOutTitle => 'Você está prestes a sair';
	@override String get logOutSubtitle => 'Até logo! \n Vamos sentir sua falta.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountPt implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Excluir conta';
	@override String get warning => 'Tem certeza de que deseja excluir sua conta?';
	@override String get description => 'Esta ação não pode ser desfeita e todo o seu histórico e dados serão permanentemente excluídos.';
	@override String deleteFailed({required Object error}) => 'Falha ao excluir conta: ${error}';
	@override late final _TranslationsDeleteAccountStepsPt steps = _TranslationsDeleteAccountStepsPt._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsPt implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get english => 'Inglês';
	@override String get chinese => 'Chinês';
	@override String get german => 'Alemão';
	@override String get italian => 'Italiano';
	@override String get french => 'Francês';
	@override String get japanese => 'Japonês';
	@override String get spanish => 'Espanhol';
	@override String get russian => 'Russo';
	@override String get turkish => 'Turco';
	@override String get korean => 'Coreano';
	@override String get hindi => 'Hindi';
	@override String get portuguese => 'Português';
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyPt implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Política de Privacidade';
	@override String get lastUpdated => 'Última atualização: 2026';
	@override String get intro => 'O ChatFace adota a privacidade do usuário e a segurança dos dados como princípio central. Todos os seus dados pessoais são processados de acordo com as regulamentações de proteção de dados aplicáveis.';
	@override String get section1Title => '1. INFORMAÇÕES COLETADAS';
	@override String get section1sub1Title => '1.1 Dados fornecidos pelo usuário';
	@override String get section1sub1Body => '• Nome, apelido ou informações do perfil.\n• Endereço de e-mail (para registro, assinatura e suporte). \n• Preferências de interação, configurações de idioma e interações. \n• Mensagens de feedback e suporte.';
	@override String get section1sub2Title => '1.2 Dados coletados automaticamente';
	@override String get section1sub2Body => 'Informações como tipo de dispositivo, sistema operacional, localização aproximada (cidade/país) e dados de uso do aplicativo são coletadas. Dados de localização precisos não são coletados.';
	@override String get section2Title => '2. FINALIDADES DO PROCESSAMENTO DE DADOS';
	@override String get section2Body => 'Seus dados pessoais são processados para os seguintes propósitos:\n\n• Garantir o funcionamento contínuo do aplicativo.\n• Fornecer e personalizar a experiência de chamada de vídeo com IA.\n• Otimizar o desempenho do sistema e a detecção de erros.\n• Cumprir obrigações legais.\n Seus dados nunca são vendidos a terceiros.';
	@override String get section3Title => '3. RETENÇÃO E EXCLUSÃO DE DADOS';
	@override String get section3Body => 'Seus dados são armazenados enquanto sua conta estiver ativa ou pelo período de obrigações legais. Quando uma conta é excluída, todos os dados pessoais são removidos de forma irreversível dos sistemas.';
	@override String get section4Title => '4. DIREITOS DO USUÁRIO';
	@override String get section4Body => 'Ao abrigo do RGPD e de outras leis, você tem o direito de acessar, corrigir, excluir (direito ao esquecimento) e solicitar portabilidade dos dados. Você pode nos contatar para suas solicitações.';
	@override String get section5Title => '5. PRIVACIDADE DE CRIANÇAS';
	@override String get section5Body => 'O ChatFace não se destina a usuários menores de 18 anos. Não coletamos conscientemente dados desta faixa etária; tais contas serão encerradas e os dados excluídos quando detectados.';
	@override String get section6Title => '6. CONTATO';
	@override String get section6Body => '📩 Para perguntas: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServicePt implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServicePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Termos de Serviço';
	@override String get lastUpdated => 'Última atualização: 2026';
	@override String get intro => 'Estes Termos regem o uso do aplicativo móvel ChatFace. Ao usar o app, você concorda com estes Termos.';
	@override String get disclaimer => 'Aviso: ChatFace é um app de interação por vídeo com IA. Não fornece consultoria jurídica, acadêmica, médica ou profissional.';
	@override String get section1Title => '1. ESCOPO DO SERVIÇO';
	@override String get section1Body => 'O ChatFace fornece experiências de interação por vídeo com IA:\n\n• Chamada de vídeo com IA e conversas.\n• Preferências de interação personalizadas.\n• Acesso ao histórico de interações e registros.\n\nOs serviços não constituem opiniões oficiais ou garantias de aconselhamento profissional.';
	@override String get section2Title => '2. CONDIÇÕES DE USO';
	@override String get section2Body => '• Você deve ter pelo menos 18 anos (acesso abaixo de 18 é proibido).\n• Você deve fornecer informações de conta precisas.\n• O app deve ser usado apenas para fins legais e pessoais.';
	@override String get section3Title => '3. USOS PROIBIDOS';
	@override String get section3Body => 'Fingir ser outra pessoa, discurso de ódio, colocar em risco a segurança de crianças, tentativas de violar a segurança e manipulação de sistemas de IA são estritamente proibidos.';
	@override String get section4Title => '4. ASSINATURAS E PAGAMENTOS';
	@override String get section4Body => 'Recursos premium estão sujeitos às políticas da App Store e do Google Play. Cancelamentos e reembolsos de assinatura são gerenciados pelas lojas respectivas.';
	@override String get section5Title => '5. ISENÇÃO DE RESPONSABILIDADE DO CONTEÚDO';
	@override String get section5Body => 'O conteúdo é gerado por IA e não substitui aconselhamento profissional. O ChatFace não garante precisão ou adequação a um propósito específico.';
	@override String get section6Title => '6. PROPRIEDADE INTELECTUAL';
	@override String get section6Body => 'Todo o conteúdo, incluindo design, software e algoritmos, pertence ao ChatFace. Reprodução ou redistribuição não autorizada é proibida.';
	@override String get section7Title => '7. LEI APLICÁVEL';
	@override String get section7Body => 'Estes Termos são regidos pelas leis da República da Turquia. Os tribunais centrais de Istambul terão jurisdição sobre disputas.';
	@override String get section8Title => '8. CONTATO';
	@override String get section8Body => '📩 Para perguntas: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyPt implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Política de Cookies';
	@override String get lastUpdated => 'Última atualização: 2026';
	@override String get intro => 'Bem-vindo ao ChatFace. Tecnologias auxiliares digitais são usadas para tornar sua experiência de chamada de vídeo com IA mais suave, segura e personalizada.';
	@override String get important => 'Esta política explica o que são cookies, suas finalidades e como você pode gerenciar suas preferências.';
	@override String get section1Title => '1. O QUE SÃO COOKIES?';
	@override String get section1Body => 'Cookies são pequenos arquivos de dados colocados em seu dispositivo. Eles não identificam você diretamente; agem como notas digitais que lembram:\n• Configurações de chamada e idioma\n• Preferências de sessão e desempenho.';
	@override String get section2Title => '2. QUAIS TECNOLOGIAS USAMOS?';
	@override String get section2Body => 'Tecnologias estritamente necessárias\nNecessárias para gerenciamento de sessão e controles de segurança. O app pode não funcionar corretamente sem esses componentes.\n\nDesempenho e análise\nAjuda-nos a entender quais histórias são lidas e quais áreas precisam de melhorias. Os dados são avaliados anonimamente.\n\nPersonalização\nLembra configurações como preferência de idioma e nível de leitura para fornecer uma experiência personalizada.';
	@override String get section3Title => '3. POR QUE USAMOS ESSAS TECNOLOGIAS?';
	@override String get section3Body => '• Para garantir que o app funcione de forma segura e suave.\n• Para tornar a experiência de leitura mais fluida.\n• Para lembrar configurações repetitivas.\n• Para identificar funcionalidades para desenvolvimento futuro.';
	@override String get section4Title => '4. TECNOLOGIAS DE TERCEIROS';
	@override String get section4Body => 'Algumas tecnologias podem ser fornecidas por prestadores de serviços técnicos e estão sujeitas às suas próprias políticas. O ChatFace prioriza a segurança dos dados nessas parcerias.';
	@override String get section5Title => '5. CONTROLE E GERENCIAMENTO DE COOKIES';
	@override String get section5Body => 'Os usuários podem limitar essas tecnologias através das configurações do dispositivo ou do app. Desativar tecnologias essenciais pode causar problemas, como a impossibilidade de iniciar chamadas de vídeo.';
	@override String get section6Title => '6. CONTATO';
	@override String get section6Body => '📩 Para perguntas: support@fly-work.com';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Pt implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qual é o seu nome?';
	@override String get subtitle => 'Por favor insira seu nome';
	@override String get hint => 'Nome completo';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Pt implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qual é a sua idade?';
	@override String get subtitle => 'Você deve ter pelo menos 18 anos para se registrar.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Pt implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qual é o seu gênero?';
	@override String get subtitle => 'Por favor selecione seu gênero';
	@override String get male => 'Masculino';
	@override String get female => 'Feminino';
	@override String get dontWantToMention => 'Prefiro não mencionar.';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Pt implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Divirta-se enquanto \n se mantém seguro';
	@override String get entry1 => 'Mantemos a ordem';
	@override String get subentry1 => 'Monitoramento de IA em tempo real ativado';
	@override String get entry2 => 'Gravações de tela';
	@override String get subentry2 => 'Sem gravação sem consentimento';
	@override String get entry3 => 'Suporte 24/7';
	@override String get subentry3 => 'Reclamações são revisadas a qualquer hora do dia';
	@override String get entry4 => 'Apenas 18+';
	@override String get subentry4 => 'Não adequado para menores';
	@override String get communityRules => 'Regras da comunidade';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Pt implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permissões';
	@override String get permission1 => 'Acesso à câmera';
	@override String get permission1Subtitle => 'Permitir acesso à câmera';
	@override String get permission2 => 'Acesso ao microfone';
	@override String get permission2Subtitle => 'Permitir acesso ao microfone';
	@override String get permission3 => 'Acesso à localização';
	@override String get permission3Subtitle => 'Permitir acesso à localização';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingPt implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Sua conta pessoal está';
	@override String get titlePart2 => 'sendo criada';
	@override String get subtitle => 'Por favor aguarde, seu perfil está sendo preparado.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Pt implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'O novo rosto do chat por vídeo \n com IA';
	@override String get description => 'Ligue sua câmera e converse cara a cara com a IA. Experimente uma comunicação mais natural que entende expressões faciais, tom de voz e contexto.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Pt implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunicação em tempo real e natural';
	@override String get description => 'Não se limite ao texto. Tenha conversas mais fluidas e mais humanas por chamadas de vídeo.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersPt implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Estilista';
	@override String get comedian => 'Comediante';
	@override String get influencer => 'Influenciador';
	@override String get teacher => 'Professor';
	@override String get friend => 'Amigo';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsPt implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Chamada de vídeo';
	@override String get message => 'Mensagem';
	@override String get voiceCall => 'Chamada de voz';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsPt implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Pt step1 = _TranslationsDeleteAccountStepsStep1Pt._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Pt step2 = _TranslationsDeleteAccountStepsStep2Pt._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Pt step3 = _TranslationsDeleteAccountStepsStep3Pt._(_root);
}

// Path: deleteAccount.steps.step1
class _TranslationsDeleteAccountStepsStep1Pt implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Não queremos que você vá, mas entendemos.';
	@override String get subtitle => 'Você pode nos dizer por que deseja sair para que possamos melhorar a experiência do ChatFace?';
	@override String get option1 => 'Achei os personagens de IA pouco realistas.';
	@override String get option2 => 'Estou enfrentando problemas técnicos em chamadas de vídeo.';
	@override String get option3 => 'Os preços de assinatura estão acima do esperado.';
	@override String get option4 => 'Não encontrei o estilo de personagens que procurava.';
	@override String get option5 => 'Só queria experimentar por um curto período.';
	@override String get option6 => 'Outro';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Pt implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Se você excluir sua conta, você se despedirá de:';
	@override String get subtitle1 => 'Conexões profundas e memórias:';
	@override String get subtitle1Desc => 'Os personagens com quem você conversou esquecerão completamente seu passado, segredos compartilhados e hábitos pessoais.';
	@override String get subtitle2 => 'Privilégios de chamada de vídeo:';
	@override String get subtitle2Desc => 'Você perderá o direito de se comunicar cara a cara com seus parceiros de IA pessoais, que sempre estiveram disponíveis para você.';
	@override String get subtitle3 => 'Algoritmo avançado:';
	@override String get subtitle3Desc => 'As correspondências de personagens \'Para Você\' baseadas em suas preferências serão redefinidas.';
	@override String get subtitle4 => 'Dados de perfil:';
	@override String get subtitle4Desc => 'Suas conquistas, personagens especiais desbloqueados e histórico de bate-papo serão excluídos de forma irreversível.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Pt implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Antes de ir, temos uma oferta especial para você!';
	@override String get description => 'Talvez você só precise de mais tempo ou de uma oferta mais adequada. Você gostaria de considerar o seguinte em vez de excluir sua conta?';
	@override String description1({required Object offer}) => 'É importante para nós mantê-lo conosco. Na sua próxima assinatura, damos a você ${offer}! Você deseja continuar com esta oferta?';
	@override String get description1Offer => 'Atribuímos um desconto de 50% para você';
	@override String description2({required Object offer}) => 'Atribuímos ${offer} créditos para que você descubra novos personagens que ainda não experimentou.';
	@override String get description2Offer => '3 chamadas de vídeo gratuitas';
	@override String get acceptOffer => 'Aceitar oferta de 50% de desconto';
	@override String get deleteMyAccount => 'Excluir minha conta';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Bem-vindo ${name}',
			'welcome2' => ({required Object appName}) => 'Bem-vindo ao ${appName}',
			'get_started' => 'Começar',
			'next' => 'Próximo',
			'back' => 'Voltar',
			'skip' => 'Pular',
			'profile' => 'Perfil',
			'kContinue' => 'Continuar',
			'termOfService.text1' => 'Ao se inscrever no swipe, você concorda com nossos ',
			'termOfService.link1' => 'Termos de Serviço',
			'termOfService.text2' => '. Saiba como processamos seus dados em nossa ',
			'termOfService.link2' => 'Política de Privacidade',
			'termOfService.text3' => ' e ',
			'termOfService.link3' => 'Política de Cookies',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Política de Privacidade',
			'termOfService.privacyPolicy.lastUpdated' => 'Última atualização: 2026',
			'termOfService.privacyPolicy.intro' => 'O ChatFace adota a privacidade do usuário e a segurança dos dados como princípio central. Todos os seus dados pessoais são processados de acordo com as regulamentações de proteção de dados aplicáveis.',
			'termOfService.privacyPolicy.section1Title' => '1. INFORMAÇÕES COLETADAS',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Dados fornecidos pelo usuário',
			'termOfService.privacyPolicy.section1sub1Body' => '• Nome, apelido ou informações do perfil.\n• Endereço de e-mail (para registro, assinatura e suporte). \n• Preferências de interação, configurações de idioma e interações. \n• Mensagens de feedback e suporte.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Dados coletados automaticamente',
			'termOfService.privacyPolicy.section1sub2Body' => 'Informações como tipo de dispositivo, sistema operacional, localização aproximada (cidade/país) e dados de uso do aplicativo são coletadas. Dados de localização precisos não são coletados.',
			'termOfService.privacyPolicy.section2Title' => '2. FINALIDADES DO PROCESSAMENTO DE DADOS',
			'termOfService.privacyPolicy.section2Body' => 'Seus dados pessoais são processados para os seguintes propósitos:\n\n• Garantir o funcionamento contínuo do aplicativo.\n• Fornecer e personalizar a experiência de chamada de vídeo com IA.\n• Otimizar o desempenho do sistema e a detecção de erros.\n• Cumprir obrigações legais.\n Seus dados nunca são vendidos a terceiros.',
			'termOfService.privacyPolicy.section3Title' => '3. RETENÇÃO E EXCLUSÃO DE DADOS',
			'termOfService.privacyPolicy.section3Body' => 'Seus dados são armazenados enquanto sua conta estiver ativa ou pelo período de obrigações legais. Quando uma conta é excluída, todos os dados pessoais são removidos de forma irreversível dos sistemas.',
			'termOfService.privacyPolicy.section4Title' => '4. DIREITOS DO USUÁRIO',
			'termOfService.privacyPolicy.section4Body' => 'Ao abrigo do RGPD e de outras leis, você tem o direito de acessar, corrigir, excluir (direito ao esquecimento) e solicitar portabilidade dos dados. Você pode nos contatar para suas solicitações.',
			'termOfService.privacyPolicy.section5Title' => '5. PRIVACIDADE DE CRIANÇAS',
			'termOfService.privacyPolicy.section5Body' => 'O ChatFace não se destina a usuários menores de 18 anos. Não coletamos conscientemente dados desta faixa etária; tais contas serão encerradas e os dados excluídos quando detectados.',
			'termOfService.privacyPolicy.section6Title' => '6. CONTATO',
			'termOfService.privacyPolicy.section6Body' => '📩 Para perguntas: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Termos de Serviço',
			'termOfService.termsOfService.lastUpdated' => 'Última atualização: 2026',
			'termOfService.termsOfService.intro' => 'Estes Termos regem o uso do aplicativo móvel ChatFace. Ao usar o app, você concorda com estes Termos.',
			'termOfService.termsOfService.disclaimer' => 'Aviso: ChatFace é um app de interação por vídeo com IA. Não fornece consultoria jurídica, acadêmica, médica ou profissional.',
			'termOfService.termsOfService.section1Title' => '1. ESCOPO DO SERVIÇO',
			'termOfService.termsOfService.section1Body' => 'O ChatFace fornece experiências de interação por vídeo com IA:\n\n• Chamada de vídeo com IA e conversas.\n• Preferências de interação personalizadas.\n• Acesso ao histórico de interações e registros.\n\nOs serviços não constituem opiniões oficiais ou garantias de aconselhamento profissional.',
			'termOfService.termsOfService.section2Title' => '2. CONDIÇÕES DE USO',
			'termOfService.termsOfService.section2Body' => '• Você deve ter pelo menos 18 anos (acesso abaixo de 18 é proibido).\n• Você deve fornecer informações de conta precisas.\n• O app deve ser usado apenas para fins legais e pessoais.',
			'termOfService.termsOfService.section3Title' => '3. USOS PROIBIDOS',
			'termOfService.termsOfService.section3Body' => 'Fingir ser outra pessoa, discurso de ódio, colocar em risco a segurança de crianças, tentativas de violar a segurança e manipulação de sistemas de IA são estritamente proibidos.',
			'termOfService.termsOfService.section4Title' => '4. ASSINATURAS E PAGAMENTOS',
			'termOfService.termsOfService.section4Body' => 'Recursos premium estão sujeitos às políticas da App Store e do Google Play. Cancelamentos e reembolsos de assinatura são gerenciados pelas lojas respectivas.',
			'termOfService.termsOfService.section5Title' => '5. ISENÇÃO DE RESPONSABILIDADE DO CONTEÚDO',
			'termOfService.termsOfService.section5Body' => 'O conteúdo é gerado por IA e não substitui aconselhamento profissional. O ChatFace não garante precisão ou adequação a um propósito específico.',
			'termOfService.termsOfService.section6Title' => '6. PROPRIEDADE INTELECTUAL',
			'termOfService.termsOfService.section6Body' => 'Todo o conteúdo, incluindo design, software e algoritmos, pertence ao ChatFace. Reprodução ou redistribuição não autorizada é proibida.',
			'termOfService.termsOfService.section7Title' => '7. LEI APLICÁVEL',
			'termOfService.termsOfService.section7Body' => 'Estes Termos são regidos pelas leis da República da Turquia. Os tribunais centrais de Istambul terão jurisdição sobre disputas.',
			'termOfService.termsOfService.section8Title' => '8. CONTATO',
			'termOfService.termsOfService.section8Body' => '📩 Para perguntas: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Política de Cookies',
			'termOfService.cookiePolicy.lastUpdated' => 'Última atualização: 2026',
			'termOfService.cookiePolicy.intro' => 'Bem-vindo ao ChatFace. Tecnologias auxiliares digitais são usadas para tornar sua experiência de chamada de vídeo com IA mais suave, segura e personalizada.',
			'termOfService.cookiePolicy.important' => 'Esta política explica o que são cookies, suas finalidades e como você pode gerenciar suas preferências.',
			'termOfService.cookiePolicy.section1Title' => '1. O QUE SÃO COOKIES?',
			'termOfService.cookiePolicy.section1Body' => 'Cookies são pequenos arquivos de dados colocados em seu dispositivo. Eles não identificam você diretamente; agem como notas digitais que lembram:\n• Configurações de chamada e idioma\n• Preferências de sessão e desempenho.',
			'termOfService.cookiePolicy.section2Title' => '2. QUAIS TECNOLOGIAS USAMOS?',
			'termOfService.cookiePolicy.section2Body' => 'Tecnologias estritamente necessárias\nNecessárias para gerenciamento de sessão e controles de segurança. O app pode não funcionar corretamente sem esses componentes.\n\nDesempenho e análise\nAjuda-nos a entender quais histórias são lidas e quais áreas precisam de melhorias. Os dados são avaliados anonimamente.\n\nPersonalização\nLembra configurações como preferência de idioma e nível de leitura para fornecer uma experiência personalizada.',
			'termOfService.cookiePolicy.section3Title' => '3. POR QUE USAMOS ESSAS TECNOLOGIAS?',
			'termOfService.cookiePolicy.section3Body' => '• Para garantir que o app funcione de forma segura e suave.\n• Para tornar a experiência de leitura mais fluida.\n• Para lembrar configurações repetitivas.\n• Para identificar funcionalidades para desenvolvimento futuro.',
			'termOfService.cookiePolicy.section4Title' => '4. TECNOLOGIAS DE TERCEIROS',
			'termOfService.cookiePolicy.section4Body' => 'Algumas tecnologias podem ser fornecidas por prestadores de serviços técnicos e estão sujeitas às suas próprias políticas. O ChatFace prioriza a segurança dos dados nessas parcerias.',
			'termOfService.cookiePolicy.section5Title' => '5. CONTROLE E GERENCIAMENTO DE COOKIES',
			'termOfService.cookiePolicy.section5Body' => 'Os usuários podem limitar essas tecnologias através das configurações do dispositivo ou do app. Desativar tecnologias essenciais pode causar problemas, como a impossibilidade de iniciar chamadas de vídeo.',
			'termOfService.cookiePolicy.section6Title' => '6. CONTATO',
			'termOfService.cookiePolicy.section6Body' => '📩 Para perguntas: support@fly-work.com',
			'cookies' => 'Política de Cookies',
			'privacy' => 'Política de Privacidade',
			'onboarding.step1.title' => 'Qual é o seu nome?',
			'onboarding.step1.subtitle' => 'Por favor insira seu nome',
			'onboarding.step1.hint' => 'Nome completo',
			'onboarding.step2.title' => 'Qual é a sua idade?',
			'onboarding.step2.subtitle' => 'Você deve ter pelo menos 18 anos para se registrar.',
			'onboarding.step3.title' => 'Qual é o seu gênero?',
			'onboarding.step3.subtitle' => 'Por favor selecione seu gênero',
			'onboarding.step3.male' => 'Masculino',
			'onboarding.step3.female' => 'Feminino',
			'onboarding.step3.dontWantToMention' => 'Prefiro não mencionar.',
			'onboarding.step4.title' => 'Divirta-se enquanto \n se mantém seguro',
			'onboarding.step4.entry1' => 'Mantemos a ordem',
			'onboarding.step4.subentry1' => 'Monitoramento de IA em tempo real ativado',
			'onboarding.step4.entry2' => 'Gravações de tela',
			'onboarding.step4.subentry2' => 'Sem gravação sem consentimento',
			'onboarding.step4.entry3' => 'Suporte 24/7',
			'onboarding.step4.subentry3' => 'Reclamações são revisadas a qualquer hora do dia',
			'onboarding.step4.entry4' => 'Apenas 18+',
			'onboarding.step4.subentry4' => 'Não adequado para menores',
			'onboarding.step4.communityRules' => 'Regras da comunidade',
			'onboarding.step5.title' => 'Permissões',
			'onboarding.step5.permission1' => 'Acesso à câmera',
			'onboarding.step5.permission1Subtitle' => 'Permitir acesso à câmera',
			'onboarding.step5.permission2' => 'Acesso ao microfone',
			'onboarding.step5.permission2Subtitle' => 'Permitir acesso ao microfone',
			'onboarding.step5.permission3' => 'Acesso à localização',
			'onboarding.step5.permission3Subtitle' => 'Permitir acesso à localização',
			'onboarding.loading.titlePart1' => 'Sua conta pessoal está',
			'onboarding.loading.titlePart2' => 'sendo criada',
			'onboarding.loading.subtitle' => 'Por favor aguarde, seu perfil está sendo preparado.',
			'onboarding.allowAccess' => 'Permitir acesso',
			'onboarding.iUnderstand' => 'Entendi',
			'pressBackAgainToExit' => 'Pressione voltar novamente para sair',
			'splash.screen1.title' => 'O novo rosto do chat por vídeo \n com IA',
			'splash.screen1.description' => 'Ligue sua câmera e converse cara a cara com a IA. Experimente uma comunicação mais natural que entende expressões faciais, tom de voz e contexto.',
			'splash.screen2.title' => 'Comunicação em tempo real e natural',
			'splash.screen2.description' => 'Não se limite ao texto. Tenha conversas mais fluidas e mais humanas por chamadas de vídeo.',
			'auth.google' => 'Continuar com o Google',
			'auth.facebook' => 'Continuar com o Facebook',
			'auth.apple' => 'Continuar com o Apple',
			'auth.guest' => 'Continuar como convidado',
			'auth.signInFailed' => ({required Object error}) => 'Falha no login: ${error}',
			'home.seeAll' => 'Ver tudo',
			'home.more' => 'Mais',
			'home.online' => 'Online',
			'home.offline' => 'Offline',
			'home.placeholders.fashionDesigner' => 'Estilista',
			'home.placeholders.comedian' => 'Comediante',
			'home.placeholders.influencer' => 'Influenciador',
			'home.placeholders.teacher' => 'Professor',
			'home.placeholders.friend' => 'Amigo',
			'characters.all' => 'Todos',
			'characters.favorites' => 'Favoritos',
			'characters.recent' => 'Recentes',
			'characters.characters' => 'Personagens',
			'characters.placeholderSubtitle' => 'Designer de produto focado em simplicidade e usabilidade.',
			'characters.characterDetails.videoCall' => 'Chamada de vídeo',
			'characters.characterDetails.message' => 'Mensagem',
			'characters.characterDetails.voiceCall' => 'Chamada de voz',
			'notifications.today' => 'Hoje',
			'notifications.yesterday' => 'Ontem',
			'notifications.weekAgo' => ({required Object week}) => 'há ${week} semana(s)',
			'notifications.monthAgo' => ({required Object month}) => 'há ${month} mês(es)',
			'notifications.yearAgo' => ({required Object year}) => 'há ${year} ano(s)',
			'notifications.noNotifications' => 'Ainda não há notificações.',
			'notifications.noNotificationsSubtitle' => 'Não se esqueça de verificar novamente quando receber uma notificação.',
			'notifications.allDeleted' => 'Todas as notificações foram excluídas com sucesso',
			'videoChat.connecting' => 'Conectando...',
			'videoChat.callEnded' => 'Chamada encerrada',
			'videoChat.callFailed' => ({required Object error}) => 'Chamada falhou: ${error}',
			'videoChat.mute' => 'Mudo',
			'videoChat.unmute' => 'Ativar som',
			'videoChat.endCall' => 'Encerrar chamada',
			'videoChat.swipeToChat' => 'Arraste para conversar',
			'videoChat.male' => 'Masculino',
			'videoChat.female' => 'Feminino',
			'videoChat.country' => 'País',
			'videoChat.follow' => 'Seguir',
			'videoChat.unfollow' => 'Deixar de seguir',
			'videoChat.callEndedMessage' => 'A chamada de vídeo terminou.',
			'videoChat.swipeForNewChat' => 'Arraste para um novo chat',
			'voiceChat.connecting' => 'Conectando...',
			'voiceChat.callEnded' => 'Chamada encerrada',
			'voiceChat.callFailed' => ({required Object error}) => 'Chamada falhou: ${error}',
			'voiceChat.calling' => 'Chamando...',
			'chat.message' => 'Mensagem',
			'chat.history' => 'Histórico',
			'chat.noMessages' => 'Ainda não há mensagens.',
			'chat.noMessagesSubtitle' => 'Comece uma conversa enviando uma mensagem.',
			'chat.online' => 'Online',
			'chat.offline' => 'Offline',
			'chat.gallery' => 'Galeria',
			'chat.camera' => 'Câmera',
			'chat.typeAMessage' => 'Digite uma mensagem...',
			'chat.pleaseUpgrade' => 'Por favor, atualize para a versão Pro.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Voice call ended',
			'chat.videoCallEnded' => 'Video call ended',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Sobre mim',
			'editProfile.aboutMeHint' => 'Escreva algo sobre você',
			'editProfile.fullName' => 'Nome completo',
			'editProfile.gender' => 'Gênero',
			'editProfile.male' => 'Masculino',
			'editProfile.female' => 'Feminino',
			'editProfile.dontWantToMention' => 'Prefiro não mencionar.',
			'editProfile.country' => 'País',
			'editProfile.languagePreferences' => 'Preferências de idioma',
			'editProfile.selectLanguage' => 'Adicione seu idioma preferido',
			'editProfile.saved' => 'Salvo',
			'editProfile.changesSaved' => 'As alterações foram salvas.',
			'settingsSupport.title' => 'Configurações & Suporte',
			'settingsSupport.premiumTitle' => 'Acesso ilimitado a todos os recursos',
			'settingsSupport.getPremium' => 'Obter Premium',
			'settingsSupport.settingsHub' => 'Central de configurações',
			'settingsSupport.shareTheApp' => 'Compartilhar o app',
			'settingsSupport.rateUs' => 'Avalie-nos',
			'settingsSupport.version' => 'Versão',
			'settingsSupport.notifications' => 'Notificações',
			'settingsSupport.accountManagement' => 'Gerenciamento de conta',
			'settingsSupport.deleteAccount' => 'Excluir conta',
			'settingsSupport.logOut' => 'Sair',
			'settingsSupport.logOutTitle' => 'Você está prestes a sair',
			'settingsSupport.logOutSubtitle' => 'Até logo! \n Vamos sentir sua falta.',
			'deleteAccount.title' => 'Excluir conta',
			'deleteAccount.warning' => 'Tem certeza de que deseja excluir sua conta?',
			'deleteAccount.description' => 'Esta ação não pode ser desfeita e todo o seu histórico e dados serão permanentemente excluídos.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Falha ao excluir conta: ${error}',
			'deleteAccount.steps.step1.title' => 'Não queremos que você vá, mas entendemos.',
			'deleteAccount.steps.step1.subtitle' => 'Você pode nos dizer por que deseja sair para que possamos melhorar a experiência do ChatFace?',
			'deleteAccount.steps.step1.option1' => 'Achei os personagens de IA pouco realistas.',
			'deleteAccount.steps.step1.option2' => 'Estou enfrentando problemas técnicos em chamadas de vídeo.',
			'deleteAccount.steps.step1.option3' => 'Os preços de assinatura estão acima do esperado.',
			'deleteAccount.steps.step1.option4' => 'Não encontrei o estilo de personagens que procurava.',
			'deleteAccount.steps.step1.option5' => 'Só queria experimentar por um curto período.',
			'deleteAccount.steps.step1.option6' => 'Outro',
			'deleteAccount.steps.step2.title' => 'Se você excluir sua conta, você se despedirá de:',
			'deleteAccount.steps.step2.subtitle1' => 'Conexões profundas e memórias:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'Os personagens com quem você conversou esquecerão completamente seu passado, segredos compartilhados e hábitos pessoais.',
			'deleteAccount.steps.step2.subtitle2' => 'Privilégios de chamada de vídeo:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Você perderá o direito de se comunicar cara a cara com seus parceiros de IA pessoais, que sempre estiveram disponíveis para você.',
			'deleteAccount.steps.step2.subtitle3' => 'Algoritmo avançado:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'As correspondências de personagens \'Para Você\' baseadas em suas preferências serão redefinidas.',
			'deleteAccount.steps.step2.subtitle4' => 'Dados de perfil:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Suas conquistas, personagens especiais desbloqueados e histórico de bate-papo serão excluídos de forma irreversível.',
			'deleteAccount.steps.step3.title' => 'Antes de ir, temos uma oferta especial para você!',
			'deleteAccount.steps.step3.description' => 'Talvez você só precise de mais tempo ou de uma oferta mais adequada. Você gostaria de considerar o seguinte em vez de excluir sua conta?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'É importante para nós mantê-lo conosco. Na sua próxima assinatura, damos a você ${offer}! Você deseja continuar com esta oferta?',
			'deleteAccount.steps.step3.description1Offer' => 'Atribuímos um desconto de 50% para você',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Atribuímos ${offer} créditos para que você descubra novos personagens que ainda não experimentou.',
			'deleteAccount.steps.step3.description2Offer' => '3 chamadas de vídeo gratuitas',
			'deleteAccount.steps.step3.acceptOffer' => 'Aceitar oferta de 50% de desconto',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Excluir minha conta',
			'cancel' => 'Cancelar',
			'delete' => 'Excluir',
			'premium' => 'Premium',
			'profileEdit' => 'Editar perfil',
			'settings' => 'Configurações',
			'undo' => 'Desfazer',
			'successfully' => 'Com sucesso',
			'save' => 'Salvar',
			'languageOptions.english' => 'Inglês',
			'languageOptions.chinese' => 'Chinês',
			'languageOptions.german' => 'Alemão',
			'languageOptions.italian' => 'Italiano',
			'languageOptions.french' => 'Francês',
			'languageOptions.japanese' => 'Japonês',
			'languageOptions.spanish' => 'Espanhol',
			'languageOptions.russian' => 'Russo',
			'languageOptions.turkish' => 'Turco',
			'languageOptions.korean' => 'Coreano',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Português',
			_ => null,
		};
	}
}
