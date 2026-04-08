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
class TranslationsIt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Benvenuto ${name}';
	@override String welcome2({required Object appName}) => 'Benvenuto su ${appName}';
	@override String get get_started => 'Inizia';
	@override String get next => 'Avanti';
	@override String get back => 'Indietro';
	@override String get skip => 'Salta';
	@override String get profile => 'Profilo';
	@override String get kContinue => 'Continua';
	@override late final _TranslationsTermOfServiceIt termOfService = _TranslationsTermOfServiceIt._(_root);
	@override String get cookies => 'Informativa sui cookie';
	@override String get privacy => 'Informativa sulla privacy';
	@override late final _TranslationsOnboardingIt onboarding = _TranslationsOnboardingIt._(_root);
	@override String get pressBackAgainToExit => 'Premi indietro di nuovo per uscire';
	@override late final _TranslationsSplashIt splash = _TranslationsSplashIt._(_root);
	@override late final _TranslationsAuthIt auth = _TranslationsAuthIt._(_root);
	@override late final _TranslationsHomeIt home = _TranslationsHomeIt._(_root);
	@override late final _TranslationsCharactersIt characters = _TranslationsCharactersIt._(_root);
	@override late final _TranslationsNotificationsIt notifications = _TranslationsNotificationsIt._(_root);
	@override late final _TranslationsVideoChatIt videoChat = _TranslationsVideoChatIt._(_root);
	@override late final _TranslationsVoiceChatIt voiceChat = _TranslationsVoiceChatIt._(_root);
	@override late final _TranslationsChatIt chat = _TranslationsChatIt._(_root);
	@override late final _TranslationsEditProfileIt editProfile = _TranslationsEditProfileIt._(_root);
	@override late final _TranslationsSettingsSupportIt settingsSupport = _TranslationsSettingsSupportIt._(_root);
	@override late final _TranslationsDeleteAccountIt deleteAccount = _TranslationsDeleteAccountIt._(_root);
	@override String get cancel => 'Annulla';
	@override String get delete => 'Elimina';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Modifica profilo';
	@override String get settings => 'Impostazioni';
	@override String get undo => 'Annulla';
	@override String get successfully => 'Con successo';
	@override String get save => 'Salva';
	@override late final _TranslationsLanguageOptionsIt languageOptions = _TranslationsLanguageOptionsIt._(_root);
	@override late final _TranslationsCommonIt common = _TranslationsCommonIt._(_root);
	@override String get permissionsRequired => 'Autorizzazioni Richieste';
	@override late final _TranslationsPermissionHelperIt permissionHelper = _TranslationsPermissionHelperIt._(_root);
	@override late final _TranslationsVideoViewIt videoView = _TranslationsVideoViewIt._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceIt implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Iscrivendoti a swipe, accetti i nostri ';
	@override String get link1 => 'Termini di servizio';
	@override String get text2 => '. Scopri come trattiamo i tuoi dati nella nostra ';
	@override String get link2 => 'Informativa sulla privacy';
	@override String get text3 => ' e nella ';
	@override String get link3 => 'Informativa sui cookie';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyIt privacyPolicy = _TranslationsTermOfServicePrivacyPolicyIt._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceIt termsOfService = _TranslationsTermOfServiceTermsOfServiceIt._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyIt cookiePolicy = _TranslationsTermOfServiceCookiePolicyIt._(_root);
}

// Path: onboarding
class _TranslationsOnboardingIt implements TranslationsOnboardingEn {
	_TranslationsOnboardingIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5It step5 = _TranslationsOnboardingStep5It._(_root);
	@override late final _TranslationsOnboardingStep1It step1 = _TranslationsOnboardingStep1It._(_root);
	@override late final _TranslationsOnboardingStep2It step2 = _TranslationsOnboardingStep2It._(_root);
	@override late final _TranslationsOnboardingStep3It step3 = _TranslationsOnboardingStep3It._(_root);
	@override late final _TranslationsOnboardingStep4It step4 = _TranslationsOnboardingStep4It._(_root);
	@override late final _TranslationsOnboardingLoadingIt loading = _TranslationsOnboardingLoadingIt._(_root);
	@override String get allowAccess => 'Consenti accesso';
	@override String get iUnderstand => 'Ho capito';
}

// Path: splash
class _TranslationsSplashIt implements TranslationsSplashEn {
	_TranslationsSplashIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1It screen1 = _TranslationsSplashScreen1It._(_root);
	@override late final _TranslationsSplashScreen2It screen2 = _TranslationsSplashScreen2It._(_root);
}

// Path: auth
class _TranslationsAuthIt implements TranslationsAuthEn {
	_TranslationsAuthIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get google => 'Continua con Google';
	@override String get facebook => 'Continua con Facebook';
	@override String get apple => 'Continua con Apple';
	@override String get guest => 'Continua come ospite';
	@override String signInFailed({required Object error}) => 'Accesso non riuscito: ${error}';
}

// Path: home
class _TranslationsHomeIt implements TranslationsHomeEn {
	_TranslationsHomeIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Vedi tutto';
	@override String get more => 'Altro';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override late final _TranslationsHomePlaceholdersIt placeholders = _TranslationsHomePlaceholdersIt._(_root);
}

// Path: characters
class _TranslationsCharactersIt implements TranslationsCharactersEn {
	_TranslationsCharactersIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get all => 'Tutti';
	@override String get favorites => 'Preferiti';
	@override String get recent => 'Recenti';
	@override String get characters => 'Personaggi';
	@override String get placeholderSubtitle => 'Product designer che si concentra su semplicità e usabilità.';
	@override late final _TranslationsCharactersCharacterDetailsIt characterDetails = _TranslationsCharactersCharacterDetailsIt._(_root);
}

// Path: notifications
class _TranslationsNotificationsIt implements TranslationsNotificationsEn {
	_TranslationsNotificationsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get today => 'Oggi';
	@override String get yesterday => 'Ieri';
	@override String weekAgo({required Object week}) => '${week} settimana fa';
	@override String monthAgo({required Object month}) => '${month} mese fa';
	@override String yearAgo({required Object year}) => '${year} anno fa';
	@override String get noNotifications => 'Ancora nessuna notifica.';
	@override String get noNotificationsSubtitle => 'Non dimenticare di ricontrollare quando ricevi una notifica.';
	@override String get allDeleted => 'Tutte le notifiche sono state eliminate con successo';
}

// Path: videoChat
class _TranslationsVideoChatIt implements TranslationsVideoChatEn {
	_TranslationsVideoChatIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Problema di rete rilevato. Riconnessione in corso...';
	@override String get failedToUpdateFollow => 'Impossibile aggiornare lo stato del follow.';
	@override String get connecting => 'Connessione...';
	@override String get callEnded => 'Chiamata terminata';
	@override String callFailed({required Object error}) => 'Chiamata fallita: ${error}';
	@override String get mute => 'Muto';
	@override String get unmute => 'Riattiva audio';
	@override String get endCall => 'Termina chiamata';
	@override String get swipeToChat => 'Scorri per chattare';
	@override String get male => 'Maschio';
	@override String get female => 'Femmina';
	@override String get country => 'Paese';
	@override String get follow => 'Segui';
	@override String get unfollow => 'Non seguire più';
	@override String get callEndedMessage => 'La videochiamata è terminata.';
	@override String get swipeForNewChat => 'Scorri per una nuova chat';
}

// Path: voiceChat
class _TranslationsVoiceChatIt implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Connessione...';
	@override String get callEnded => 'Chiamata terminata';
	@override String callFailed({required Object error}) => 'Chiamata fallita: ${error}';
	@override String get calling => 'Chiamando...';
}

// Path: chat
class _TranslationsChatIt implements TranslationsChatEn {
	_TranslationsChatIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get message => 'Messaggio';
	@override String get history => 'Cronologia';
	@override String get noMessages => 'Ancora nessun messaggio.';
	@override String get noMessagesSubtitle => 'Inizia una conversazione inviando un messaggio.';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override String get gallery => 'Galleria';
	@override String get camera => 'Fotocamera';
	@override String get typeAMessage => 'Digita un messaggio...';
	@override String get pleaseUpgrade => 'Si prega di eseguire l\'upgrade alla versione Pro.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Chiamata vocale terminata';
	@override String get videoCallEnded => 'Videochiamata terminata';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileIt implements TranslationsEditProfileEn {
	_TranslationsEditProfileIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Su di me';
	@override String get aboutMeHint => 'Scrivi qualcosa su di te';
	@override String get fullName => 'Nome completo';
	@override String get gender => 'Genere';
	@override String get male => 'Maschile';
	@override String get female => 'Femminile';
	@override String get dontWantToMention => 'Preferisco non dirlo.';
	@override String get country => 'Paese';
	@override String get languagePreferences => 'Preferenze linguistiche';
	@override String get selectLanguage => 'Aggiungi la tua lingua preferita';
	@override String get saved => 'Salvato';
	@override String get changesSaved => 'Le modifiche sono state salvate.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportIt implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impostazioni & Supporto';
	@override String get premiumTitle => 'Accesso illimitato a \ntutte le funzionalità';
	@override String get getPremium => 'Ottieni Premium';
	@override String get settingsHub => 'Centro impostazioni';
	@override String get shareTheApp => 'Condividi l\'app';
	@override String get rateUs => 'Valutaci';
	@override String get version => 'Versione';
	@override String get notifications => 'Notifiche';
	@override String get accountManagement => 'Gestione account';
	@override String get deleteAccount => 'Elimina account';
	@override String get logOut => 'Esci';
	@override String get logOutTitle => 'Stai per uscire';
	@override String get logOutSubtitle => 'Ci vediamo presto! \n Ti mancheremo.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountIt implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elimina account';
	@override String get warning => 'Sei sicuro di voler eliminare il tuo account?';
	@override String get description => 'Questa azione non può essere annullata e tutta la tua cronologia e i tuoi dati saranno eliminati in modo permanente.';
	@override String deleteFailed({required Object error}) => 'Eliminazione account non riuscita: ${error}';
	@override late final _TranslationsDeleteAccountStepsIt steps = _TranslationsDeleteAccountStepsIt._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsIt implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get english => 'Inglese';
	@override String get chinese => 'Cinese';
	@override String get german => 'Tedesco';
	@override String get italian => 'Italiano';
	@override String get french => 'Francese';
	@override String get japanese => 'Giapponese';
	@override String get spanish => 'Spagnolo';
	@override String get russian => 'Russo';
	@override String get turkish => 'Turco';
	@override String get korean => 'Coreano';
	@override String get hindi => 'Hindi';
	@override String get portuguese => 'Portoghese';
}

// Path: common
class _TranslationsCommonIt implements TranslationsCommonEn {
	_TranslationsCommonIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Riprova';
	@override String get retry => 'Riprova';
	@override String get close => 'Chiudi';
}

// Path: permissionHelper
class _TranslationsPermissionHelperIt implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Sono necessarie le autorizzazioni di fotocamera e microfono per le videochiamate. Abilitale nelle impostazioni.';
	@override String get micRequired => 'È necessaria l\'autorizzazione del microfono per le chiamate vocali. Abilitala nelle impostazioni.';
	@override String get cancel => 'Annulla';
	@override String get openSettings => 'Apri le impostazioni';
}

// Path: videoView
class _TranslationsVideoViewIt implements TranslationsVideoViewEn {
	_TranslationsVideoViewIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtri fotocamera';
	@override String get subtitle => 'Scegli l\'aspetto per l\'anteprima della tua fotocamera.';
	@override String get errorLoad => 'Impossibile caricare i compagni: ';
	@override String get noComps => 'Nessun compagno ancora disponibile.';
	@override late final _TranslationsVideoViewFiltersIt filters = _TranslationsVideoViewFiltersIt._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyIt implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informativa sulla privacy';
	@override String get lastUpdated => 'Ultimo aggiornamento: 2026';
	@override String get intro => 'ChatFace adotta la privacy degli utenti e la sicurezza dei dati come principio fondamentale. Tutti i tuoi dati personali sono trattati in conformità alle normative vigenti sulla protezione dei dati.';
	@override String get section1Title => '1. INFORMAZIONI RACCOLTE';
	@override String get section1sub1Title => '1.1 Dati forniti dall\'utente';
	@override String get section1sub1Body => '• Nome, soprannome o informazioni del profilo.\n• Indirizzo e-mail (per registrazione, abbonamento e supporto). \n• Preferenze di interazione, impostazioni della lingua e interazioni. \n• Messaggi di feedback e supporto.';
	@override String get section1sub2Title => '1.2 Dati raccolti automaticamente';
	@override String get section1sub2Body => 'Vengono raccolte informazioni come tipo di dispositivo, sistema operativo, posizione approssimativa (città/paese) e dati di utilizzo dell\'app. Non vengono raccolti dati di posizione precisi.';
	@override String get section2Title => '2. FINALITÀ DEL TRATTAMENTO DEI DATI';
	@override String get section2Body => 'I tuoi dati personali vengono trattati per le seguenti finalità:\n\n• Garantire il corretto funzionamento dell\'applicazione.\n• Fornire e personalizzare l\'esperienza di videochiamata basata su IA.\n• Ottimizzare le prestazioni del sistema e rilevare gli errori.\n• Adempiere agli obblighi di legge.\n I tuoi dati non vengono mai venduti a terzi.';
	@override String get section3Title => '3. CONSERVAZIONE E CANCELLAZIONE DEI DATI';
	@override String get section3Body => 'I tuoi dati vengono archiviati finché il tuo account è attivo o per la durata degli obblighi legali. Quando un account viene eliminato, tutti i dati personali vengono cancellati in modo irrevocabile dai sistemi.';
	@override String get section4Title => '4. DIRITTI DELL\'UTENTE';
	@override String get section4Body => 'Ai sensi del GDPR e di altre normative, hai diritto di accesso, rettifica, cancellazione (diritto all\'oblio) e di richiedere la portabilità dei dati. Puoi contattarci per le tue richieste.';
	@override String get section5Title => '5. PRIVACY DEI MINORI';
	@override String get section5Body => 'ChatFace non è destinato a utenti di età inferiore ai 18 anni. Non raccogliamo consapevolmente dati di questa fascia d\'età; tali account saranno chiusi e i dati eliminati se rilevati.';
	@override String get section6Title => '6. CONTATTI';
	@override String get section6Body => '📩 Per richieste: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceIt implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Termini di servizio';
	@override String get lastUpdated => 'Ultimo aggiornamento: 2026';
	@override String get intro => 'Questi Termini regolano l\'uso dell\'app mobile ChatFace. Utilizzando l\'app, accetti questi Termini.';
	@override String get disclaimer => 'Esclusione di responsabilità: ChatFace è un\'app di interazione video basata su IA. Non fornisce consulenze legali, accademiche, mediche o professionali.';
	@override String get section1Title => '1. AMBITO DEL SERVIZIO';
	@override String get section1Body => 'ChatFace fornisce esperienze di interazione video potenziate dall\'IA:\n\n• Chiamate video AI e conversazioni.\n• Preferenze di interazione personalizzate.\n• Accesso alla cronologia delle interazioni e registri.\n\nI servizi non costituiscono opinioni ufficiali o garanzie di consulenza professionale.';
	@override String get section2Title => '2. CONDIZIONI D\'USO';
	@override String get section2Body => '• Devi avere almeno 18 anni (l\'accesso sotto i 18 è vietato).\n• Devi fornire informazioni di account accurate.\n• L\'app deve essere utilizzata solo per scopi legali e personali.';
	@override String get section3Title => '3. USI VIETATI';
	@override String get section3Body => 'Impersonificazione, discorsi d\'odio, mettere in pericolo la sicurezza dei minori, tentativi di violare la sicurezza e manipolazione dei sistemi IA sono severamente vietati.';
	@override String get section4Title => '4. ABBONAMENTI E PAGAMENTI';
	@override String get section4Body => 'Le funzionalità premium sono soggette alle politiche di App Store e Google Play. Le cancellazioni e i rimborsi degli abbonamenti sono gestiti tramite gli store rispettivi.';
	@override String get section5Title => '5. ESCLUSIONE DI RESPONSABILITÀ SUI CONTENUTI';
	@override String get section5Body => 'I contenuti sono generati dall\'IA e non sostituiscono il parere professionale. ChatFace non garantisce l\'accuratezza o l\'idoneità a uno scopo specifico.';
	@override String get section6Title => '6. PROPRIETÀ INTELLETTUALE';
	@override String get section6Body => 'Tutti i contenuti, compresi design, software e algoritmi, appartengono a ChatFace. La riproduzione o ridistribuzione non autorizzata è proibita.';
	@override String get section7Title => '7. LEGGE APPLICABILE';
	@override String get section7Body => 'Questi Termini sono disciplinati dalle leggi della Repubblica di Turchia. I tribunali centrali di Istanbul avranno giurisdizione sulle controversie.';
	@override String get section8Title => '8. CONTATTI';
	@override String get section8Body => '📩 Per richieste: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyIt implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informativa sui cookie';
	@override String get lastUpdated => 'Ultimo aggiornamento: 2026';
	@override String get intro => 'Benvenuto in ChatFace. Utilizziamo tecnologie digitali ausiliarie per rendere la tua esperienza di videochiamata con IA più fluida, sicura e personalizzata.';
	@override String get important => 'Questa politica spiega cosa sono i cookie, i loro scopi e come puoi gestire le tue preferenze.';
	@override String get section1Title => '1. COSA SONO I COOKIE?';
	@override String get section1Body => 'I cookie sono piccoli file di dati posizionati sul tuo dispositivo. Non ti identificano direttamente; agiscono come note digitali che ricordano:\n• Impostazioni di chiamata e lingua\n• Preferenze di sessione e prestazioni.';
	@override String get section2Title => '2. QUALI TECNOLOGIE UTILIZZIAMO?';
	@override String get section2Body => 'Tecnologie strettamente necessarie\nRichieste per la gestione delle sessioni e i controlli di sicurezza. L\'app potrebbe non funzionare correttamente senza questi componenti.\n\nPrestazioni e analisi\nCi aiutano a capire quali storie vengono lette e quali aree necessitano miglioramenti. I dati vengono valutati in modo anonimo.\n\nPersonalizzazione\nRicorda impostazioni come la lingua preferita e il livello di lettura per fornire un\'esperienza su misura.';
	@override String get section3Title => '3. PERCHÉ UTILIZZIAMO QUESTE TECNOLOGIE?';
	@override String get section3Body => '• Per garantire che l\'app funzioni in modo sicuro e fluido.\n• Per rendere l\'esperienza di lettura più fluida.\n• Per ricordare le impostazioni ripetute.\n• Per identificare funzionalità per sviluppi futuri.';
	@override String get section4Title => '4. TECNOLOGIE DI TERZE PARTI';
	@override String get section4Body => 'Alcune tecnologie possono essere fornite da fornitori di servizi tecnici e sono soggette alle loro politiche. ChatFace dà priorità alla sicurezza dei dati in queste collaborazioni.';
	@override String get section5Title => '5. CONTROLLO E GESTIONE DEI COOKIE';
	@override String get section5Body => 'Gli utenti possono limitare queste tecnologie tramite le impostazioni del dispositivo o dell\'app. Disabilitare tecnologie essenziali può causare problemi come l\'impossibilità di avviare le videochiamate.';
	@override String get section6Title => '6. CONTATTI';
	@override String get section6Body => '📩 Per richieste: support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5It implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'Autorizzazione richiesta';
	@override String get notNow => 'Non ora';
	@override String get openSettings => 'Apri impostazioni';
	@override String get title => 'Autorizzazioni';
	@override String get permission1 => 'Accesso alla fotocamera';
	@override String get permission1Subtitle => 'Consenti l\'accesso alla fotocamera';
	@override String get permission2 => 'Accesso al microfono';
	@override String get permission2Subtitle => 'Consenti l\'accesso al microfono';
	@override String get permission3 => 'Accesso alla posizione';
	@override String get permission3Subtitle => 'Consenti l\'accesso alla posizione';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1It implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qual è il tuo nome?';
	@override String get subtitle => 'Inserisci il tuo nome';
	@override String get hint => 'Nome completo';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2It implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quanti anni hai?';
	@override String get subtitle => 'Devi avere almeno 18 anni per registrarti.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3It implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Qual è il tuo genere?';
	@override String get subtitle => 'Seleziona il tuo genere';
	@override String get male => 'Maschile';
	@override String get female => 'Femminile';
	@override String get dontWantToMention => 'Preferisco non dirlo.';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4It implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Divertiti mentre \n rimani al sicuro';
	@override String get entry1 => 'Manteniamo l\'ordine';
	@override String get subentry1 => 'Monitoraggio AI in tempo reale attivo';
	@override String get entry2 => 'Registrazioni dello schermo';
	@override String get subentry2 => 'Nessuna registrazione senza consenso';
	@override String get entry3 => 'Supporto 24/7';
	@override String get subentry3 => 'I reclami vengono esaminati in qualsiasi momento della giornata';
	@override String get entry4 => 'Solo 18+';
	@override String get subentry4 => 'Non adatto ai minori';
	@override String get communityRules => 'Regole della community';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingIt implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Il tuo account personale è';
	@override String get titlePart2 => 'in fase di creazione';
	@override String get subtitle => 'Attendere, il tuo profilo viene preparato.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1It implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il nuovo volto della chat video \n con IA';
	@override String get description => 'Accendi la fotocamera e parla faccia a faccia con l\'IA. Vivi una comunicazione più naturale che comprende le espressioni facciali, il tono di voce e il contesto.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2It implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunicazione in tempo reale e naturale';
	@override String get description => 'Non limitarti al testo. Avere conversazioni più fluide e più umane tramite videochiamate.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersIt implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Stilista';
	@override String get comedian => 'Comico';
	@override String get influencer => 'Influencer';
	@override String get teacher => 'Insegnante';
	@override String get friend => 'Amico';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsIt implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Videochiamata';
	@override String get message => 'Messaggio';
	@override String get voiceCall => 'Chiamata vocale';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsIt implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1It step1 = _TranslationsDeleteAccountStepsStep1It._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2It step2 = _TranslationsDeleteAccountStepsStep2It._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3It step3 = _TranslationsDeleteAccountStepsStep3It._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersIt implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Originale';
	@override String get ADDICTIVE_BLUE => 'Blu Coinvolgente';
	@override String get ADDICTIVE_RED => 'Rosso Coinvolgente';
	@override String get ADEN => 'Aden';
	@override String get AMARO => 'Amaro';
	@override String get ASHBY => 'Ashby';
	@override String get BRANNAN => 'Brannan';
	@override String get BROOKLYN => 'Brooklyn';
	@override String get CLARENDON => 'Clarendon';
	@override String get CREMA => 'Crema';
	@override String get DOGPATCH => 'Dogpatch';
	@override String get GINGHAM => 'Gingham';
	@override String get GINZA => 'Ginza';
	@override String get HEFE => 'Hefe';
	@override String get HUDSON => 'Hudson';
	@override String get INKWELL => 'Inkwell';
	@override String get JUNO => 'Juno';
	@override String get LARK => 'Lark';
	@override String get LOFI => 'LoFi';
	@override String get LUDWIG => 'Ludwig';
	@override String get MOON => 'Moon';
	@override String get PERPETUA => 'Perpetua';
	@override String get REYES => 'Reyes';
	@override String get SIERRA => 'Sierra';
	@override String get SLUMBER => 'Slumber';
	@override String get STINSON => 'Stinson';
	@override String get SUTRO => 'Sutro';
	@override String get WALDEN => 'Walden';
	@override String get WILLOW => 'Willow';
	@override String get XPROII => 'XProII';
}

// Path: deleteAccount.steps.step1
class _TranslationsDeleteAccountStepsStep1It implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Non vogliamo che tu te ne vada, ma lo capiamo.';
	@override String get subtitle => 'Puoi dirci perché vuoi andartene in modo da poter migliorare l\'esperienza di ChatFace?';
	@override String get option1 => 'Non ho trovato realistici i personaggi AI.';
	@override String get option2 => 'Sto riscontrando problemi tecnici con le chat video.';
	@override String get option3 => 'I prezzi dell\'abbonamento sono al di sopra delle mie aspettative.';
	@override String get option4 => 'Non sono riuscito a trovare il tipo di personaggi che stavo cercando.';
	@override String get option5 => 'Volevo solo provarlo per un breve periodo.';
	@override String get option6 => 'Altro';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2It implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Se elimini il tuo account, dirai addio a:';
	@override String get subtitle1 => 'Connessioni profonde e memoria:';
	@override String get subtitle1Desc => 'I personaggi con cui chatti dimenticheranno completamente il loro passato con te.';
	@override String get subtitle2 => 'Privilegio della videochiamata:';
	@override String get subtitle2Desc => 'Perderai il diritto di comunicare faccia a faccia con i tuoi partner AI.';
	@override String get subtitle3 => 'Algoritmo avanzato:';
	@override String get subtitle3Desc => 'I tuoi abbinamenti di personaggi personalizzati verranno ripristinati.';
	@override String get subtitle4 => 'Dati del profilo:';
	@override String get subtitle4Desc => 'I tuoi obiettivi, personaggi e la cronologia chat verranno eliminati in modo irreversibile.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3It implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3It._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Abbiamo un\'offerta speciale per te prima che tu te ne vada!';
	@override String get description => 'Forse hai solo bisogno di un po\' più di tempo o di un accordo migliore. Potresti considerare questo?';
	@override String description1({required Object offer}) => 'Tenerti con noi è prezioso. ${offer} sul tuo prossimo abbonamento!';
	@override String get description1Offer => 'Abbiamo applicato uno sconto del 50%';
	@override String description2({required Object offer}) => 'Ti abbiamo dato ${offer} crediti per scoprire nuovi personaggi.';
	@override String get description2Offer => '3 videochiamate gratuite';
	@override String get acceptOffer => 'Accetta lo sconto del 50%';
	@override String get deleteMyAccount => 'Elimina il mio account';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Benvenuto ${name}',
			'welcome2' => ({required Object appName}) => 'Benvenuto su ${appName}',
			'get_started' => 'Inizia',
			'next' => 'Avanti',
			'back' => 'Indietro',
			'skip' => 'Salta',
			'profile' => 'Profilo',
			'kContinue' => 'Continua',
			'termOfService.text1' => 'Iscrivendoti a swipe, accetti i nostri ',
			'termOfService.link1' => 'Termini di servizio',
			'termOfService.text2' => '. Scopri come trattiamo i tuoi dati nella nostra ',
			'termOfService.link2' => 'Informativa sulla privacy',
			'termOfService.text3' => ' e nella ',
			'termOfService.link3' => 'Informativa sui cookie',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Informativa sulla privacy',
			'termOfService.privacyPolicy.lastUpdated' => 'Ultimo aggiornamento: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace adotta la privacy degli utenti e la sicurezza dei dati come principio fondamentale. Tutti i tuoi dati personali sono trattati in conformità alle normative vigenti sulla protezione dei dati.',
			'termOfService.privacyPolicy.section1Title' => '1. INFORMAZIONI RACCOLTE',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Dati forniti dall\'utente',
			'termOfService.privacyPolicy.section1sub1Body' => '• Nome, soprannome o informazioni del profilo.\n• Indirizzo e-mail (per registrazione, abbonamento e supporto). \n• Preferenze di interazione, impostazioni della lingua e interazioni. \n• Messaggi di feedback e supporto.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Dati raccolti automaticamente',
			'termOfService.privacyPolicy.section1sub2Body' => 'Vengono raccolte informazioni come tipo di dispositivo, sistema operativo, posizione approssimativa (città/paese) e dati di utilizzo dell\'app. Non vengono raccolti dati di posizione precisi.',
			'termOfService.privacyPolicy.section2Title' => '2. FINALITÀ DEL TRATTAMENTO DEI DATI',
			'termOfService.privacyPolicy.section2Body' => 'I tuoi dati personali vengono trattati per le seguenti finalità:\n\n• Garantire il corretto funzionamento dell\'applicazione.\n• Fornire e personalizzare l\'esperienza di videochiamata basata su IA.\n• Ottimizzare le prestazioni del sistema e rilevare gli errori.\n• Adempiere agli obblighi di legge.\n I tuoi dati non vengono mai venduti a terzi.',
			'termOfService.privacyPolicy.section3Title' => '3. CONSERVAZIONE E CANCELLAZIONE DEI DATI',
			'termOfService.privacyPolicy.section3Body' => 'I tuoi dati vengono archiviati finché il tuo account è attivo o per la durata degli obblighi legali. Quando un account viene eliminato, tutti i dati personali vengono cancellati in modo irrevocabile dai sistemi.',
			'termOfService.privacyPolicy.section4Title' => '4. DIRITTI DELL\'UTENTE',
			'termOfService.privacyPolicy.section4Body' => 'Ai sensi del GDPR e di altre normative, hai diritto di accesso, rettifica, cancellazione (diritto all\'oblio) e di richiedere la portabilità dei dati. Puoi contattarci per le tue richieste.',
			'termOfService.privacyPolicy.section5Title' => '5. PRIVACY DEI MINORI',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace non è destinato a utenti di età inferiore ai 18 anni. Non raccogliamo consapevolmente dati di questa fascia d\'età; tali account saranno chiusi e i dati eliminati se rilevati.',
			'termOfService.privacyPolicy.section6Title' => '6. CONTATTI',
			'termOfService.privacyPolicy.section6Body' => '📩 Per richieste: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Termini di servizio',
			'termOfService.termsOfService.lastUpdated' => 'Ultimo aggiornamento: 2026',
			'termOfService.termsOfService.intro' => 'Questi Termini regolano l\'uso dell\'app mobile ChatFace. Utilizzando l\'app, accetti questi Termini.',
			'termOfService.termsOfService.disclaimer' => 'Esclusione di responsabilità: ChatFace è un\'app di interazione video basata su IA. Non fornisce consulenze legali, accademiche, mediche o professionali.',
			'termOfService.termsOfService.section1Title' => '1. AMBITO DEL SERVIZIO',
			'termOfService.termsOfService.section1Body' => 'ChatFace fornisce esperienze di interazione video potenziate dall\'IA:\n\n• Chiamate video AI e conversazioni.\n• Preferenze di interazione personalizzate.\n• Accesso alla cronologia delle interazioni e registri.\n\nI servizi non costituiscono opinioni ufficiali o garanzie di consulenza professionale.',
			'termOfService.termsOfService.section2Title' => '2. CONDIZIONI D\'USO',
			'termOfService.termsOfService.section2Body' => '• Devi avere almeno 18 anni (l\'accesso sotto i 18 è vietato).\n• Devi fornire informazioni di account accurate.\n• L\'app deve essere utilizzata solo per scopi legali e personali.',
			'termOfService.termsOfService.section3Title' => '3. USI VIETATI',
			'termOfService.termsOfService.section3Body' => 'Impersonificazione, discorsi d\'odio, mettere in pericolo la sicurezza dei minori, tentativi di violare la sicurezza e manipolazione dei sistemi IA sono severamente vietati.',
			'termOfService.termsOfService.section4Title' => '4. ABBONAMENTI E PAGAMENTI',
			'termOfService.termsOfService.section4Body' => 'Le funzionalità premium sono soggette alle politiche di App Store e Google Play. Le cancellazioni e i rimborsi degli abbonamenti sono gestiti tramite gli store rispettivi.',
			'termOfService.termsOfService.section5Title' => '5. ESCLUSIONE DI RESPONSABILITÀ SUI CONTENUTI',
			'termOfService.termsOfService.section5Body' => 'I contenuti sono generati dall\'IA e non sostituiscono il parere professionale. ChatFace non garantisce l\'accuratezza o l\'idoneità a uno scopo specifico.',
			'termOfService.termsOfService.section6Title' => '6. PROPRIETÀ INTELLETTUALE',
			'termOfService.termsOfService.section6Body' => 'Tutti i contenuti, compresi design, software e algoritmi, appartengono a ChatFace. La riproduzione o ridistribuzione non autorizzata è proibita.',
			'termOfService.termsOfService.section7Title' => '7. LEGGE APPLICABILE',
			'termOfService.termsOfService.section7Body' => 'Questi Termini sono disciplinati dalle leggi della Repubblica di Turchia. I tribunali centrali di Istanbul avranno giurisdizione sulle controversie.',
			'termOfService.termsOfService.section8Title' => '8. CONTATTI',
			'termOfService.termsOfService.section8Body' => '📩 Per richieste: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Informativa sui cookie',
			'termOfService.cookiePolicy.lastUpdated' => 'Ultimo aggiornamento: 2026',
			'termOfService.cookiePolicy.intro' => 'Benvenuto in ChatFace. Utilizziamo tecnologie digitali ausiliarie per rendere la tua esperienza di videochiamata con IA più fluida, sicura e personalizzata.',
			'termOfService.cookiePolicy.important' => 'Questa politica spiega cosa sono i cookie, i loro scopi e come puoi gestire le tue preferenze.',
			'termOfService.cookiePolicy.section1Title' => '1. COSA SONO I COOKIE?',
			'termOfService.cookiePolicy.section1Body' => 'I cookie sono piccoli file di dati posizionati sul tuo dispositivo. Non ti identificano direttamente; agiscono come note digitali che ricordano:\n• Impostazioni di chiamata e lingua\n• Preferenze di sessione e prestazioni.',
			'termOfService.cookiePolicy.section2Title' => '2. QUALI TECNOLOGIE UTILIZZIAMO?',
			'termOfService.cookiePolicy.section2Body' => 'Tecnologie strettamente necessarie\nRichieste per la gestione delle sessioni e i controlli di sicurezza. L\'app potrebbe non funzionare correttamente senza questi componenti.\n\nPrestazioni e analisi\nCi aiutano a capire quali storie vengono lette e quali aree necessitano miglioramenti. I dati vengono valutati in modo anonimo.\n\nPersonalizzazione\nRicorda impostazioni come la lingua preferita e il livello di lettura per fornire un\'esperienza su misura.',
			'termOfService.cookiePolicy.section3Title' => '3. PERCHÉ UTILIZZIAMO QUESTE TECNOLOGIE?',
			'termOfService.cookiePolicy.section3Body' => '• Per garantire che l\'app funzioni in modo sicuro e fluido.\n• Per rendere l\'esperienza di lettura più fluida.\n• Per ricordare le impostazioni ripetute.\n• Per identificare funzionalità per sviluppi futuri.',
			'termOfService.cookiePolicy.section4Title' => '4. TECNOLOGIE DI TERZE PARTI',
			'termOfService.cookiePolicy.section4Body' => 'Alcune tecnologie possono essere fornite da fornitori di servizi tecnici e sono soggette alle loro politiche. ChatFace dà priorità alla sicurezza dei dati in queste collaborazioni.',
			'termOfService.cookiePolicy.section5Title' => '5. CONTROLLO E GESTIONE DEI COOKIE',
			'termOfService.cookiePolicy.section5Body' => 'Gli utenti possono limitare queste tecnologie tramite le impostazioni del dispositivo o dell\'app. Disabilitare tecnologie essenziali può causare problemi come l\'impossibilità di avviare le videochiamate.',
			'termOfService.cookiePolicy.section6Title' => '6. CONTATTI',
			'termOfService.cookiePolicy.section6Body' => '📩 Per richieste: support@fly-work.com',
			'cookies' => 'Informativa sui cookie',
			'privacy' => 'Informativa sulla privacy',
			'onboarding.step5.permissionRequired' => 'Autorizzazione richiesta',
			'onboarding.step5.notNow' => 'Non ora',
			'onboarding.step5.openSettings' => 'Apri impostazioni',
			'onboarding.step5.title' => 'Autorizzazioni',
			'onboarding.step5.permission1' => 'Accesso alla fotocamera',
			'onboarding.step5.permission1Subtitle' => 'Consenti l\'accesso alla fotocamera',
			'onboarding.step5.permission2' => 'Accesso al microfono',
			'onboarding.step5.permission2Subtitle' => 'Consenti l\'accesso al microfono',
			'onboarding.step5.permission3' => 'Accesso alla posizione',
			'onboarding.step5.permission3Subtitle' => 'Consenti l\'accesso alla posizione',
			'onboarding.step1.title' => 'Qual è il tuo nome?',
			'onboarding.step1.subtitle' => 'Inserisci il tuo nome',
			'onboarding.step1.hint' => 'Nome completo',
			'onboarding.step2.title' => 'Quanti anni hai?',
			'onboarding.step2.subtitle' => 'Devi avere almeno 18 anni per registrarti.',
			'onboarding.step3.title' => 'Qual è il tuo genere?',
			'onboarding.step3.subtitle' => 'Seleziona il tuo genere',
			'onboarding.step3.male' => 'Maschile',
			'onboarding.step3.female' => 'Femminile',
			'onboarding.step3.dontWantToMention' => 'Preferisco non dirlo.',
			'onboarding.step4.title' => 'Divertiti mentre \n rimani al sicuro',
			'onboarding.step4.entry1' => 'Manteniamo l\'ordine',
			'onboarding.step4.subentry1' => 'Monitoraggio AI in tempo reale attivo',
			'onboarding.step4.entry2' => 'Registrazioni dello schermo',
			'onboarding.step4.subentry2' => 'Nessuna registrazione senza consenso',
			'onboarding.step4.entry3' => 'Supporto 24/7',
			'onboarding.step4.subentry3' => 'I reclami vengono esaminati in qualsiasi momento della giornata',
			'onboarding.step4.entry4' => 'Solo 18+',
			'onboarding.step4.subentry4' => 'Non adatto ai minori',
			'onboarding.step4.communityRules' => 'Regole della community',
			'onboarding.loading.titlePart1' => 'Il tuo account personale è',
			'onboarding.loading.titlePart2' => 'in fase di creazione',
			'onboarding.loading.subtitle' => 'Attendere, il tuo profilo viene preparato.',
			'onboarding.allowAccess' => 'Consenti accesso',
			'onboarding.iUnderstand' => 'Ho capito',
			'pressBackAgainToExit' => 'Premi indietro di nuovo per uscire',
			'splash.screen1.title' => 'Il nuovo volto della chat video \n con IA',
			'splash.screen1.description' => 'Accendi la fotocamera e parla faccia a faccia con l\'IA. Vivi una comunicazione più naturale che comprende le espressioni facciali, il tono di voce e il contesto.',
			'splash.screen2.title' => 'Comunicazione in tempo reale e naturale',
			'splash.screen2.description' => 'Non limitarti al testo. Avere conversazioni più fluide e più umane tramite videochiamate.',
			'auth.google' => 'Continua con Google',
			'auth.facebook' => 'Continua con Facebook',
			'auth.apple' => 'Continua con Apple',
			'auth.guest' => 'Continua come ospite',
			'auth.signInFailed' => ({required Object error}) => 'Accesso non riuscito: ${error}',
			'home.seeAll' => 'Vedi tutto',
			'home.more' => 'Altro',
			'home.online' => 'Online',
			'home.offline' => 'Offline',
			'home.placeholders.fashionDesigner' => 'Stilista',
			'home.placeholders.comedian' => 'Comico',
			'home.placeholders.influencer' => 'Influencer',
			'home.placeholders.teacher' => 'Insegnante',
			'home.placeholders.friend' => 'Amico',
			'characters.all' => 'Tutti',
			'characters.favorites' => 'Preferiti',
			'characters.recent' => 'Recenti',
			'characters.characters' => 'Personaggi',
			'characters.placeholderSubtitle' => 'Product designer che si concentra su semplicità e usabilità.',
			'characters.characterDetails.videoCall' => 'Videochiamata',
			'characters.characterDetails.message' => 'Messaggio',
			'characters.characterDetails.voiceCall' => 'Chiamata vocale',
			'notifications.today' => 'Oggi',
			'notifications.yesterday' => 'Ieri',
			'notifications.weekAgo' => ({required Object week}) => '${week} settimana fa',
			'notifications.monthAgo' => ({required Object month}) => '${month} mese fa',
			'notifications.yearAgo' => ({required Object year}) => '${year} anno fa',
			'notifications.noNotifications' => 'Ancora nessuna notifica.',
			'notifications.noNotificationsSubtitle' => 'Non dimenticare di ricontrollare quando ricevi una notifica.',
			'notifications.allDeleted' => 'Tutte le notifiche sono state eliminate con successo',
			'videoChat.networkHiccup' => 'Problema di rete rilevato. Riconnessione in corso...',
			'videoChat.failedToUpdateFollow' => 'Impossibile aggiornare lo stato del follow.',
			'videoChat.connecting' => 'Connessione...',
			'videoChat.callEnded' => 'Chiamata terminata',
			'videoChat.callFailed' => ({required Object error}) => 'Chiamata fallita: ${error}',
			'videoChat.mute' => 'Muto',
			'videoChat.unmute' => 'Riattiva audio',
			'videoChat.endCall' => 'Termina chiamata',
			'videoChat.swipeToChat' => 'Scorri per chattare',
			'videoChat.male' => 'Maschio',
			'videoChat.female' => 'Femmina',
			'videoChat.country' => 'Paese',
			'videoChat.follow' => 'Segui',
			'videoChat.unfollow' => 'Non seguire più',
			'videoChat.callEndedMessage' => 'La videochiamata è terminata.',
			'videoChat.swipeForNewChat' => 'Scorri per una nuova chat',
			'voiceChat.connecting' => 'Connessione...',
			'voiceChat.callEnded' => 'Chiamata terminata',
			'voiceChat.callFailed' => ({required Object error}) => 'Chiamata fallita: ${error}',
			'voiceChat.calling' => 'Chiamando...',
			'chat.message' => 'Messaggio',
			'chat.history' => 'Cronologia',
			'chat.noMessages' => 'Ancora nessun messaggio.',
			'chat.noMessagesSubtitle' => 'Inizia una conversazione inviando un messaggio.',
			'chat.online' => 'Online',
			'chat.offline' => 'Offline',
			'chat.gallery' => 'Galleria',
			'chat.camera' => 'Fotocamera',
			'chat.typeAMessage' => 'Digita un messaggio...',
			'chat.pleaseUpgrade' => 'Si prega di eseguire l\'upgrade alla versione Pro.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Chiamata vocale terminata',
			'chat.videoCallEnded' => 'Videochiamata terminata',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Su di me',
			'editProfile.aboutMeHint' => 'Scrivi qualcosa su di te',
			'editProfile.fullName' => 'Nome completo',
			'editProfile.gender' => 'Genere',
			'editProfile.male' => 'Maschile',
			'editProfile.female' => 'Femminile',
			'editProfile.dontWantToMention' => 'Preferisco non dirlo.',
			'editProfile.country' => 'Paese',
			'editProfile.languagePreferences' => 'Preferenze linguistiche',
			'editProfile.selectLanguage' => 'Aggiungi la tua lingua preferita',
			'editProfile.saved' => 'Salvato',
			'editProfile.changesSaved' => 'Le modifiche sono state salvate.',
			'settingsSupport.title' => 'Impostazioni & Supporto',
			'settingsSupport.premiumTitle' => 'Accesso illimitato a \ntutte le funzionalità',
			'settingsSupport.getPremium' => 'Ottieni Premium',
			'settingsSupport.settingsHub' => 'Centro impostazioni',
			'settingsSupport.shareTheApp' => 'Condividi l\'app',
			'settingsSupport.rateUs' => 'Valutaci',
			'settingsSupport.version' => 'Versione',
			'settingsSupport.notifications' => 'Notifiche',
			'settingsSupport.accountManagement' => 'Gestione account',
			'settingsSupport.deleteAccount' => 'Elimina account',
			'settingsSupport.logOut' => 'Esci',
			'settingsSupport.logOutTitle' => 'Stai per uscire',
			'settingsSupport.logOutSubtitle' => 'Ci vediamo presto! \n Ti mancheremo.',
			'deleteAccount.title' => 'Elimina account',
			'deleteAccount.warning' => 'Sei sicuro di voler eliminare il tuo account?',
			'deleteAccount.description' => 'Questa azione non può essere annullata e tutta la tua cronologia e i tuoi dati saranno eliminati in modo permanente.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Eliminazione account non riuscita: ${error}',
			'deleteAccount.steps.step1.title' => 'Non vogliamo che tu te ne vada, ma lo capiamo.',
			'deleteAccount.steps.step1.subtitle' => 'Puoi dirci perché vuoi andartene in modo da poter migliorare l\'esperienza di ChatFace?',
			'deleteAccount.steps.step1.option1' => 'Non ho trovato realistici i personaggi AI.',
			'deleteAccount.steps.step1.option2' => 'Sto riscontrando problemi tecnici con le chat video.',
			'deleteAccount.steps.step1.option3' => 'I prezzi dell\'abbonamento sono al di sopra delle mie aspettative.',
			'deleteAccount.steps.step1.option4' => 'Non sono riuscito a trovare il tipo di personaggi che stavo cercando.',
			'deleteAccount.steps.step1.option5' => 'Volevo solo provarlo per un breve periodo.',
			'deleteAccount.steps.step1.option6' => 'Altro',
			'deleteAccount.steps.step2.title' => 'Se elimini il tuo account, dirai addio a:',
			'deleteAccount.steps.step2.subtitle1' => 'Connessioni profonde e memoria:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'I personaggi con cui chatti dimenticheranno completamente il loro passato con te.',
			'deleteAccount.steps.step2.subtitle2' => 'Privilegio della videochiamata:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Perderai il diritto di comunicare faccia a faccia con i tuoi partner AI.',
			'deleteAccount.steps.step2.subtitle3' => 'Algoritmo avanzato:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'I tuoi abbinamenti di personaggi personalizzati verranno ripristinati.',
			'deleteAccount.steps.step2.subtitle4' => 'Dati del profilo:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'I tuoi obiettivi, personaggi e la cronologia chat verranno eliminati in modo irreversibile.',
			'deleteAccount.steps.step3.title' => 'Abbiamo un\'offerta speciale per te prima che tu te ne vada!',
			'deleteAccount.steps.step3.description' => 'Forse hai solo bisogno di un po\' più di tempo o di un accordo migliore. Potresti considerare questo?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Tenerti con noi è prezioso. ${offer} sul tuo prossimo abbonamento!',
			'deleteAccount.steps.step3.description1Offer' => 'Abbiamo applicato uno sconto del 50%',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Ti abbiamo dato ${offer} crediti per scoprire nuovi personaggi.',
			'deleteAccount.steps.step3.description2Offer' => '3 videochiamate gratuite',
			'deleteAccount.steps.step3.acceptOffer' => 'Accetta lo sconto del 50%',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Elimina il mio account',
			'cancel' => 'Annulla',
			'delete' => 'Elimina',
			'premium' => 'Premium',
			'profileEdit' => 'Modifica profilo',
			'settings' => 'Impostazioni',
			'undo' => 'Annulla',
			'successfully' => 'Con successo',
			'save' => 'Salva',
			'languageOptions.english' => 'Inglese',
			'languageOptions.chinese' => 'Cinese',
			'languageOptions.german' => 'Tedesco',
			'languageOptions.italian' => 'Italiano',
			'languageOptions.french' => 'Francese',
			'languageOptions.japanese' => 'Giapponese',
			'languageOptions.spanish' => 'Spagnolo',
			'languageOptions.russian' => 'Russo',
			'languageOptions.turkish' => 'Turco',
			'languageOptions.korean' => 'Coreano',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Portoghese',
			'common.tryAgain' => 'Riprova',
			'common.retry' => 'Riprova',
			'common.close' => 'Chiudi',
			'permissionsRequired' => 'Autorizzazioni Richieste',
			'permissionHelper.camAndMicRequired' => 'Sono necessarie le autorizzazioni di fotocamera e microfono per le videochiamate. Abilitale nelle impostazioni.',
			'permissionHelper.micRequired' => 'È necessaria l\'autorizzazione del microfono per le chiamate vocali. Abilitala nelle impostazioni.',
			'permissionHelper.cancel' => 'Annulla',
			'permissionHelper.openSettings' => 'Apri le impostazioni',
			'videoView.title' => 'Filtri fotocamera',
			'videoView.subtitle' => 'Scegli l\'aspetto per l\'anteprima della tua fotocamera.',
			'videoView.errorLoad' => 'Impossibile caricare i compagni: ',
			'videoView.noComps' => 'Nessun compagno ancora disponibile.',
			'videoView.filters.ORIGINAL' => 'Originale',
			'videoView.filters.ADDICTIVE_BLUE' => 'Blu Coinvolgente',
			'videoView.filters.ADDICTIVE_RED' => 'Rosso Coinvolgente',
			'videoView.filters.ADEN' => 'Aden',
			'videoView.filters.AMARO' => 'Amaro',
			'videoView.filters.ASHBY' => 'Ashby',
			'videoView.filters.BRANNAN' => 'Brannan',
			'videoView.filters.BROOKLYN' => 'Brooklyn',
			'videoView.filters.CLARENDON' => 'Clarendon',
			'videoView.filters.CREMA' => 'Crema',
			'videoView.filters.DOGPATCH' => 'Dogpatch',
			'videoView.filters.GINGHAM' => 'Gingham',
			'videoView.filters.GINZA' => 'Ginza',
			'videoView.filters.HEFE' => 'Hefe',
			'videoView.filters.HUDSON' => 'Hudson',
			'videoView.filters.INKWELL' => 'Inkwell',
			'videoView.filters.JUNO' => 'Juno',
			'videoView.filters.LARK' => 'Lark',
			'videoView.filters.LOFI' => 'LoFi',
			'videoView.filters.LUDWIG' => 'Ludwig',
			'videoView.filters.MOON' => 'Moon',
			'videoView.filters.PERPETUA' => 'Perpetua',
			'videoView.filters.REYES' => 'Reyes',
			'videoView.filters.SIERRA' => 'Sierra',
			'videoView.filters.SLUMBER' => 'Slumber',
			'videoView.filters.STINSON' => 'Stinson',
			'videoView.filters.SUTRO' => 'Sutro',
			'videoView.filters.WALDEN' => 'Walden',
			'videoView.filters.WILLOW' => 'Willow',
			'videoView.filters.XPROII' => 'XProII',
			_ => null,
		};
	}
}
