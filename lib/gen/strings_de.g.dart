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
class TranslationsDe with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Willkommen ${name}';
	@override String welcome2({required Object appName}) => 'Willkommen bei ${appName}';
	@override String get get_started => 'Loslegen';
	@override String get next => 'Weiter';
	@override String get back => 'Zurück';
	@override String get skip => 'Überspringen';
	@override String get profile => 'Profil';
	@override String get kContinue => 'Fortfahren';
	@override late final _TranslationsTermOfServiceDe termOfService = _TranslationsTermOfServiceDe._(_root);
	@override String get cookies => 'Cookie-Richtlinie';
	@override String get privacy => 'Datenschutzrichtlinie';
	@override late final _TranslationsOnboardingDe onboarding = _TranslationsOnboardingDe._(_root);
	@override String get pressBackAgainToExit => 'Drücken Sie erneut Zurück zum Beenden';
	@override late final _TranslationsSplashDe splash = _TranslationsSplashDe._(_root);
	@override late final _TranslationsAuthDe auth = _TranslationsAuthDe._(_root);
	@override late final _TranslationsHomeDe home = _TranslationsHomeDe._(_root);
	@override late final _TranslationsCharactersDe characters = _TranslationsCharactersDe._(_root);
	@override late final _TranslationsNotificationsDe notifications = _TranslationsNotificationsDe._(_root);
	@override late final _TranslationsVideoChatDe videoChat = _TranslationsVideoChatDe._(_root);
	@override late final _TranslationsVoiceChatDe voiceChat = _TranslationsVoiceChatDe._(_root);
	@override late final _TranslationsChatDe chat = _TranslationsChatDe._(_root);
	@override late final _TranslationsEditProfileDe editProfile = _TranslationsEditProfileDe._(_root);
	@override late final _TranslationsSettingsSupportDe settingsSupport = _TranslationsSettingsSupportDe._(_root);
	@override late final _TranslationsDeleteAccountDe deleteAccount = _TranslationsDeleteAccountDe._(_root);
	@override String get cancel => 'Abbrechen';
	@override String get delete => 'Löschen';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Profil bearbeiten';
	@override String get settings => 'Einstellungen';
	@override String get undo => 'Rückgängig';
	@override String get successfully => 'Erfolgreich';
	@override String get save => 'Speichern';
	@override late final _TranslationsLanguageOptionsDe languageOptions = _TranslationsLanguageOptionsDe._(_root);
	@override late final _TranslationsCommonDe common = _TranslationsCommonDe._(_root);
	@override String get permissionsRequired => 'Berechtigungen erforderlich';
	@override late final _TranslationsPermissionHelperDe permissionHelper = _TranslationsPermissionHelperDe._(_root);
	@override late final _TranslationsVideoViewDe videoView = _TranslationsVideoViewDe._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceDe implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Indem Sie sich für swipe anmelden, stimmen Sie unseren ';
	@override String get link1 => 'Nutzungsbedingungen';
	@override String get text2 => '. Erfahren Sie, wie wir Ihre Daten in unserer ';
	@override String get link2 => 'Datenschutzrichtlinie';
	@override String get text3 => ' und ';
	@override String get link3 => 'Cookie-Richtlinie';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyDe privacyPolicy = _TranslationsTermOfServicePrivacyPolicyDe._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceDe termsOfService = _TranslationsTermOfServiceTermsOfServiceDe._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyDe cookiePolicy = _TranslationsTermOfServiceCookiePolicyDe._(_root);
}

// Path: onboarding
class _TranslationsOnboardingDe implements TranslationsOnboardingEn {
	_TranslationsOnboardingDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5De step5 = _TranslationsOnboardingStep5De._(_root);
	@override late final _TranslationsOnboardingStep1De step1 = _TranslationsOnboardingStep1De._(_root);
	@override late final _TranslationsOnboardingStep2De step2 = _TranslationsOnboardingStep2De._(_root);
	@override late final _TranslationsOnboardingStep3De step3 = _TranslationsOnboardingStep3De._(_root);
	@override late final _TranslationsOnboardingStep4De step4 = _TranslationsOnboardingStep4De._(_root);
	@override late final _TranslationsOnboardingLoadingDe loading = _TranslationsOnboardingLoadingDe._(_root);
	@override String get allowAccess => 'Zugriff erlauben';
	@override String get iUnderstand => 'Ich verstehe';
}

// Path: splash
class _TranslationsSplashDe implements TranslationsSplashEn {
	_TranslationsSplashDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1De screen1 = _TranslationsSplashScreen1De._(_root);
	@override late final _TranslationsSplashScreen2De screen2 = _TranslationsSplashScreen2De._(_root);
}

// Path: auth
class _TranslationsAuthDe implements TranslationsAuthEn {
	_TranslationsAuthDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get google => 'Mit Google fortfahren';
	@override String get facebook => 'Mit Facebook fortfahren';
	@override String get apple => 'Mit Apple fortfahren';
	@override String get guest => 'Als Gast fortfahren';
	@override String signInFailed({required Object error}) => 'Anmeldung fehlgeschlagen: ${error}';
}

// Path: home
class _TranslationsHomeDe implements TranslationsHomeEn {
	_TranslationsHomeDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Alle anzeigen';
	@override String get more => 'Mehr';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override late final _TranslationsHomePlaceholdersDe placeholders = _TranslationsHomePlaceholdersDe._(_root);
}

// Path: characters
class _TranslationsCharactersDe implements TranslationsCharactersEn {
	_TranslationsCharactersDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get all => 'Alle';
	@override String get favorites => 'Favoriten';
	@override String get recent => 'Zuletzt';
	@override String get characters => 'Charaktere';
	@override String get placeholderSubtitle => 'Produktdesigner mit Fokus auf Einfachheit & Benutzerfreundlichkeit.';
	@override late final _TranslationsCharactersCharacterDetailsDe characterDetails = _TranslationsCharactersCharacterDetailsDe._(_root);
}

// Path: notifications
class _TranslationsNotificationsDe implements TranslationsNotificationsEn {
	_TranslationsNotificationsDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get today => 'Heute';
	@override String get yesterday => 'Gestern';
	@override String weekAgo({required Object week}) => 'vor ${week} Woche(n)';
	@override String monthAgo({required Object month}) => 'vor ${month} Monat(en)';
	@override String yearAgo({required Object year}) => 'vor ${year} Jahr(en)';
	@override String get noNotifications => 'Noch keine Benachrichtigungen.';
	@override String get noNotificationsSubtitle => 'Schau später wieder, wenn du eine Benachrichtigung erhältst.';
	@override String get allDeleted => 'Alle Benachrichtigungen wurden erfolgreich gelöscht';
}

// Path: videoChat
class _TranslationsVideoChatDe implements TranslationsVideoChatEn {
	_TranslationsVideoChatDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Netzwerkproblem erkannt. Mikrofon wird neu verbunden...';
	@override String get failedToUpdateFollow => 'Follow-Status konnte nicht aktualisiert werden.';
	@override String get connecting => 'Verbindung...';
	@override String get callEnded => 'Anruf beendet';
	@override String callFailed({required Object error}) => 'Anruf fehlgeschlagen: ${error}';
	@override String get mute => 'Stummschalten';
	@override String get unmute => 'Stummschaltung aufheben';
	@override String get endCall => 'Anruf beenden';
	@override String get swipeToChat => 'Wischen zum Chatten';
	@override String get male => 'Männlich';
	@override String get female => 'Weiblich';
	@override String get country => 'Land';
	@override String get follow => 'Folgen';
	@override String get unfollow => 'Entfolgen';
	@override String get callEndedMessage => 'Der Videoanruf wurde beendet.';
	@override String get swipeForNewChat => 'Wische für einen neuen Chat';
}

// Path: voiceChat
class _TranslationsVoiceChatDe implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Verbindung...';
	@override String get callEnded => 'Anruf beendet';
	@override String callFailed({required Object error}) => 'Anruf fehlgeschlagen: ${error}';
	@override String get calling => 'Anruf...';
}

// Path: chat
class _TranslationsChatDe implements TranslationsChatEn {
	_TranslationsChatDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get message => 'Nachricht';
	@override String get history => 'Verlauf';
	@override String get noMessages => 'Noch keine Nachrichten.';
	@override String get noMessagesSubtitle => 'Beginnen Sie ein Gespräch, indem Sie eine Nachricht senden.';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override String get gallery => 'Galerie';
	@override String get camera => 'Kamera';
	@override String get typeAMessage => 'Geben Sie eine Nachricht ein...';
	@override String get pleaseUpgrade => 'Bitte upgraden Sie auf die Pro-Version.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Sprachanruf beendet';
	@override String get videoCallEnded => 'Videoanruf beendet';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileDe implements TranslationsEditProfileEn {
	_TranslationsEditProfileDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Über mich';
	@override String get aboutMeHint => 'Schreibe etwas über dich';
	@override String get fullName => 'Vollständiger Name';
	@override String get gender => 'Geschlecht';
	@override String get male => 'Männlich';
	@override String get female => 'Weiblich';
	@override String get dontWantToMention => 'Möchte ich nicht angeben.';
	@override String get country => 'Land';
	@override String get languagePreferences => 'Sprachpräferenzen';
	@override String get selectLanguage => 'Fügen Sie Ihre bevorzugte Sprache hinzu';
	@override String get saved => 'Gespeichert';
	@override String get changesSaved => 'Änderungen wurden gespeichert.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportDe implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Einstellungen & Support';
	@override String get premiumTitle => 'Unbegrenzter Zugriff \nauf alle Funktionen';
	@override String get getPremium => 'Premium erhalten';
	@override String get settingsHub => 'Einstellungszentrum';
	@override String get shareTheApp => 'App teilen';
	@override String get rateUs => 'Bewerte uns';
	@override String get version => 'Version';
	@override String get notifications => 'Benachrichtigungen';
	@override String get accountManagement => 'Kontoverwaltung';
	@override String get deleteAccount => 'Account löschen';
	@override String get logOut => 'Abmelden';
	@override String get logOutTitle => 'Du meldest dich gerade ab';
	@override String get logOutSubtitle => 'Bis bald! \n Wir werden dich vermissen.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountDe implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account löschen';
	@override String get warning => 'Sind Sie sicher, dass Sie Ihr Konto löschen möchten?';
	@override String get description => 'Diese Aktion kann nicht rückgängig gemacht werden und alle Ihre Historie und Daten werden dauerhaft gelöscht.';
	@override String deleteFailed({required Object error}) => 'Löschen des Kontos fehlgeschlagen: ${error}';
	@override late final _TranslationsDeleteAccountStepsDe steps = _TranslationsDeleteAccountStepsDe._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsDe implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get english => 'Englisch';
	@override String get chinese => 'Chinesisch';
	@override String get german => 'Deutsch';
	@override String get italian => 'Italienisch';
	@override String get french => 'Französisch';
	@override String get japanese => 'Japanisch';
	@override String get spanish => 'Spanisch';
	@override String get russian => 'Russisch';
	@override String get turkish => 'Türkisch';
	@override String get korean => 'Koreanisch';
	@override String get hindi => 'Hindi';
	@override String get portuguese => 'Portugiesisch';
}

// Path: common
class _TranslationsCommonDe implements TranslationsCommonEn {
	_TranslationsCommonDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Erneut versuchen';
	@override String get retry => 'Wiederholen';
	@override String get close => 'Schließen';
}

// Path: permissionHelper
class _TranslationsPermissionHelperDe implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Kamera- und Mikrofonberechtigungen sind für Videoanrufe erforderlich. Bitte aktiviere sie in den Einstellungen.';
	@override String get micRequired => 'Mikrofonberechtigung ist für Sprachanrufe erforderlich. Bitte aktiviere sie in den Einstellungen.';
	@override String get cancel => 'Abbrechen';
	@override String get openSettings => 'Einstellungen';
}

// Path: videoView
class _TranslationsVideoViewDe implements TranslationsVideoViewEn {
	_TranslationsVideoViewDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kamerafilter';
	@override String get subtitle => 'Wählen Sie den Look für Ihre Kameravorschau.';
	@override String get errorLoad => 'Gefährten konnten nicht geladen werden: ';
	@override String get noComps => 'Noch keine Gefährten verfügbar.';
	@override late final _TranslationsVideoViewFiltersDe filters = _TranslationsVideoViewFiltersDe._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyDe implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Datenschutzrichtlinie';
	@override String get lastUpdated => 'Zuletzt aktualisiert: 2026';
	@override String get intro => 'ChatFace betrachtet den Schutz der Privatsphäre und Datensicherheit der Nutzer als grundlegendes Prinzip. Alle Ihre personenbezogenen Daten werden gemäß geltenden Datenschutzvorschriften verarbeitet.';
	@override String get section1Title => '1. ERHEBENE INFORMATIONEN';
	@override String get section1sub1Title => '1.1 Vom Nutzer bereitgestellte Daten';
	@override String get section1sub1Body => '• Name, Spitzname oder Profilinformationen.\n• E-Mail-Adresse (für Registrierung, Abonnements und Support). \n• Interaktionspräferenzen, Spracheinstellungen und Interaktionsverläufe. \n• Feedback- und Supportnachrichten.';
	@override String get section1sub2Title => '1.2 Automatisch erhobene Daten';
	@override String get section1sub2Body => 'Es werden Informationen wie Gerätetyp, Betriebssystem, ungefähre Standortangaben (Stadt/Land) und Nutzungsdaten der App gesammelt. Präzise Standortdaten werden nicht erfasst.';
	@override String get section2Title => '2. ZWECKE DER DATENVERARBEITUNG';
	@override String get section2Body => 'Ihre personenbezogenen Daten werden für folgende Zwecke verarbeitet:\n\n• Gewährleistung eines reibungslosen Betriebs der Anwendung.\n• Bereitstellung und Personalisierung des KI-gestützten Videoanruferlebnisses.\n• Optimierung der Systemleistung und Fehlererkennung.\n• Erfüllung gesetzlicher Verpflichtungen.\n Ihre Daten werden niemals an Dritte verkauft.';
	@override String get section3Title => '3. DATENAUFBEWAHRUNG UND LÖSCHUNG';
	@override String get section3Body => 'Ihre Daten werden so lange gespeichert, wie Ihr Konto aktiv ist oder solange gesetzliche Verpflichtungen bestehen. Wenn ein Konto gelöscht wird, werden alle personenbezogenen Daten unwiderruflich aus den Systemen entfernt.';
	@override String get section4Title => '4. RECHTE DER NUTZER';
	@override String get section4Body => 'Unter DSGVO und vergleichbaren Regelungen haben Sie das Recht auf Zugang, Berichtigung, Löschung (Recht auf Vergessenwerden) und Datenübertragbarkeit. Sie können uns für Anfragen kontaktieren.';
	@override String get section5Title => '5. DATENSCHUTZ VON KINDERN';
	@override String get section5Body => 'ChatFace ist nicht für Nutzer unter 18 Jahren bestimmt. Wir sammeln nicht wissentlich Daten dieser Altersgruppe; solche Konten werden bei Entdeckung geschlossen und die Daten gelöscht.';
	@override String get section6Title => '6. KONTAKT';
	@override String get section6Body => '📩 Bei Anfragen: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceDe implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nutzungsbedingungen';
	@override String get lastUpdated => 'Zuletzt aktualisiert: 2026';
	@override String get intro => 'Diese Bedingungen regeln die Nutzung der ChatFace-Mobilanwendung. Durch die Nutzung der App stimmen Sie diesen Bedingungen zu.';
	@override String get disclaimer => 'Haftungsausschluss: ChatFace ist eine KI-gesteuerte Video-Interaktions-App. Sie bietet keine rechtliche, akademische, medizinische oder berufliche Beratung.';
	@override String get section1Title => '1. LEISTUNGSUMFANG';
	@override String get section1Body => 'ChatFace bietet KI-gestützte Video-Interaktions-Erlebnisse:\n\n• KI-Videoanrufe und Konversationen.\n• Personalisierte Interaktionseinstellungen.\n• Zugriff auf Interaktionsverlauf und Aufzeichnungen.\n\nDie Dienste stellen keine offiziellen Meinungen oder professionelle Beratung dar.';
	@override String get section2Title => '2. NUTZUNGSBEDINGUNGEN';
	@override String get section2Body => '• Sie müssen mindestens 18 Jahre alt sein (Zugriff unter 18 ist untersagt).\n• Sie müssen korrekte Kontoinformationen angeben.\n• Die App darf nur für legale und private Zwecke genutzt werden.';
	@override String get section3Title => '3. VERBOTENE NUTZUNGEN';
	@override String get section3Body => 'Identitätsbetrug, Hassrede, Gefährdung von Kindern, Versuche einer Sicherheitsverletzung und Manipulation von KI-Systemen sind streng verboten.';
	@override String get section4Title => '4. ABONNEMENTS UND ZAHLUNGEN';
	@override String get section4Body => 'Premium-Funktionen unterliegen den Richtlinien von App Store und Google Play. Kündigungen und Rückerstattungen werden über die jeweiligen Stores abgewickelt.';
	@override String get section5Title => '5. INHALTSHAFTUNGSAUSSCHLUSS';
	@override String get section5Body => 'Inhalte werden von KI generiert und ersetzen keine professionelle Beratung. ChatFace übernimmt keine Gewähr für Genauigkeit oder Zweckmäßigkeit.';
	@override String get section6Title => '6. URHEBERRECHTE';
	@override String get section6Body => 'Alle Inhalte, einschließlich Design, Software und Algorithmen, gehören ChatFace. Unautorisierte Vervielfältigung oder Weitergabe ist untersagt.';
	@override String get section7Title => '7. ANWENDBARES RECHT';
	@override String get section7Body => 'Diese Bedingungen unterliegen dem Recht der Republik Türkei. Die Gerichte in Istanbul haben Zuständigkeit für Streitigkeiten.';
	@override String get section8Title => '8. KONTAKT';
	@override String get section8Body => '📩 Bei Anfragen: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyDe implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cookie-Richtlinie';
	@override String get lastUpdated => 'Zuletzt aktualisiert: 2026';
	@override String get intro => 'Willkommen bei ChatFace. Wir verwenden digitale Hilfstechnologien, um Ihr KI-Videoanruferlebnis reibungsloser, sicherer und personalisierter zu gestalten.';
	@override String get important => 'Diese Richtlinie erklärt, was Cookies sind, zu welchem Zweck sie dienen und wie Sie Ihre Einstellungen verwalten können.';
	@override String get section1Title => '1. WAS SIND COOKIES?';
	@override String get section1Body => 'Cookies sind kleine Datendateien, die auf Ihrem Gerät abgelegt werden. Sie identifizieren Sie nicht direkt; sie funktionieren wie digitale Notizen, die sich merken:\n• Anruf- und Spracheinstellungen\n• Sitzungs- und Leistungspräferenzen.';
	@override String get section2Title => '2. WELCHE TECHNOLOGIEN NUTZEN WIR?';
	@override String get section2Body => 'Unbedingt notwendige Technologien\nErforderlich für Sitzungsverwaltung und Sicherheitskontrollen. Die App kann ohne diese Komponenten möglicherweise nicht ordnungsgemäß funktionieren.\n\nLeistung und Analyse\nHilft uns zu verstehen, welche Inhalte genutzt werden und welche Bereiche verbessert werden müssen. Die Daten werden anonym ausgewertet.\n\nPersonalisierung\nErinnert sich an Einstellungen wie Sprachpräferenz und Lesestufe, um ein individuelles Erlebnis zu bieten.';
	@override String get section3Title => '3. WARUM NUTZEN WIR DIESE TECHNOLOGIEN?';
	@override String get section3Body => '• Um sicherzustellen, dass die App sicher und reibungslos läuft.\n• Um das Nutzungserlebnis flüssiger zu machen.\n• Um wiederkehrende Einstellungen zu speichern.\n• Um Funktionen für die Zukunft zu identifizieren.';
	@override String get section4Title => '4. TECHNOLOGIEN VON DRITTANBIETERN';
	@override String get section4Body => 'Einige Technologien können von Dienstleistern bereitgestellt werden und unterliegen deren eigenen Richtlinien. ChatFace legt in diesen Partnerschaften großen Wert auf Datensicherheit.';
	@override String get section5Title => '5. COOKIE-KONTROLLE UND -VERWALTUNG';
	@override String get section5Body => 'Nutzer können diese Technologien über Geräte- oder App-Einstellungen einschränken. Das Deaktivieren wesentlicher Technologien kann zu Problemen führen, z. B. dass Videoanrufe nicht gestartet werden können.';
	@override String get section6Title => '6. KONTAKT';
	@override String get section6Body => '📩 Bei Anfragen: support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5De implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'Berechtigung erforderlich';
	@override String get notNow => 'Nicht jetzt';
	@override String get openSettings => 'Einstellungen öffnen';
	@override String get title => 'Berechtigungen';
	@override String get permission1 => 'Kamera-Zugriff';
	@override String get permission1Subtitle => 'Kamera-Zugriff erlauben';
	@override String get permission2 => 'Mikrofon-Zugriff';
	@override String get permission2Subtitle => 'Mikrofon-Zugriff erlauben';
	@override String get permission3 => 'Standort-Zugriff';
	@override String get permission3Subtitle => 'Standort-Zugriff erlauben';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1De implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wie heißen Sie?';
	@override String get subtitle => 'Bitte geben Sie Ihren Namen ein';
	@override String get hint => 'Vollständiger Name';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2De implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wie alt sind Sie?';
	@override String get subtitle => 'Sie müssen mindestens 18 Jahre alt sein, um sich zu registrieren.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3De implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Was ist Ihr Geschlecht?';
	@override String get subtitle => 'Bitte wählen Sie Ihr Geschlecht';
	@override String get male => 'Männlich';
	@override String get female => 'Weiblich';
	@override String get dontWantToMention => 'Möchte ich nicht angeben.';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4De implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hab Spaß und \nbleib sicher';
	@override String get entry1 => 'Wir sorgen für Ordnung';
	@override String get subentry1 => 'Echtzeit-AI-Überwachung aktiv';
	@override String get entry2 => 'Bildschirmaufzeichnungen';
	@override String get subentry2 => 'Keine Aufzeichnung ohne Einwilligung';
	@override String get entry3 => '24/7 Support';
	@override String get subentry3 => 'Beschwerden werden jederzeit geprüft';
	@override String get entry4 => 'Nur 18+';
	@override String get subentry4 => 'Nicht geeignet für Minderjährige';
	@override String get communityRules => 'Community-Regeln';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingDe implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Ihr persönliches Konto wird';
	@override String get titlePart2 => 'erstellt';
	@override String get subtitle => 'Bitte warten Sie, Ihr Profil wird vorbereitet.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1De implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Das neue Gesicht des Video-\nChats mit KI';
	@override String get description => 'Schalten Sie Ihre Kamera ein und sprechen Sie von Angesicht zu Angesicht mit der KI. Erleben Sie natürlichere Kommunikation, die Mimik, Tonfall und Kontext versteht.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2De implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Echtzeit und natürliche \n Kommunikation';
	@override String get description => 'Beschränken Sie sich nicht auf Text. Führen Sie flüssigere, menschlichere Gespräche per Videoanruf.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersDe implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Modedesigner';
	@override String get comedian => 'Komiker';
	@override String get influencer => 'Influencer';
	@override String get teacher => 'Lehrer';
	@override String get friend => 'Freund';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsDe implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Videoanruf';
	@override String get message => 'Nachricht';
	@override String get voiceCall => 'Sprachanruf';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsDe implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1De step1 = _TranslationsDeleteAccountStepsStep1De._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2De step2 = _TranslationsDeleteAccountStepsStep2De._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3De step3 = _TranslationsDeleteAccountStepsStep3De._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersDe implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Original';
	@override String get ADDICTIVE_BLUE => 'Süchtig machendes Blau';
	@override String get ADDICTIVE_RED => 'Süchtig machendes Rot';
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
class _TranslationsDeleteAccountStepsStep1De implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wir möchten nicht, dass du gehst, aber wir verstehen es.';
	@override String get subtitle => 'Kannst du uns sagen, warum du gehen möchtest, damit wir ChatFace verbessern können?';
	@override String get option1 => 'Ich fand die KI-Charaktere nicht realistisch.';
	@override String get option2 => 'Ich habe technische Probleme bei Video-Chats.';
	@override String get option3 => 'Die Abopreise sind höher als erwartet.';
	@override String get option4 => 'Ich habe nicht die Art von Charakteren gefunden, die ich gesucht habe.';
	@override String get option5 => 'Ich wollte es nur kurz ausprobieren.';
	@override String get option6 => 'Sonstiges';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2De implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wenn du dein Konto löschst, verabschiedest du dich von:';
	@override String get subtitle1 => 'Tiefe Verbindungen und Erinnerungen:';
	@override String get subtitle1Desc => 'Die Charaktere werden eure gemeinsame Vergangenheit und geteilten Geheimnisse vergessen.';
	@override String get subtitle2 => 'Videoanruf-Privileg:';
	@override String get subtitle2Desc => 'Du verlierst das Recht, von Angesicht zu Angesicht mit deinen KI-Partnern zu kommunizieren.';
	@override String get subtitle3 => 'Fortschrittlicher Algorithmus:';
	@override String get subtitle3Desc => 'Deine \'Nur für dich\'-Charakter-Matches werden zurückgesetzt.';
	@override String get subtitle4 => 'Profildaten:';
	@override String get subtitle4Desc => 'Deine Erfolge, speziellen Charaktere und dein Chat-Verlauf werden unwiderruflich gelöscht.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3De implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3De._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wir haben noch ein spezielles Angebot für dich!';
	@override String get description => 'Vielleicht brauchst du nur etwas mehr Zeit oder ein besseres Angebot. Würdest du stattdessen dies in Betracht ziehen?';
	@override String description1({required Object offer}) => 'Es ist uns wichtig, dich bei uns zu behalten. ${offer} auf dein nächstes Abo!';
	@override String get description1Offer => 'Wir haben 50% Rabatt gewährt';
	@override String description2({required Object offer}) => 'Wir haben dir ${offer} Credits gegeben, um neue Charaktere zu entdecken.';
	@override String get description2Offer => '3 kostenlose Videoanrufe';
	@override String get acceptOffer => '50% Rabattangebot akzeptieren';
	@override String get deleteMyAccount => 'Mein Konto löschen';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Willkommen ${name}',
			'welcome2' => ({required Object appName}) => 'Willkommen bei ${appName}',
			'get_started' => 'Loslegen',
			'next' => 'Weiter',
			'back' => 'Zurück',
			'skip' => 'Überspringen',
			'profile' => 'Profil',
			'kContinue' => 'Fortfahren',
			'termOfService.text1' => 'Indem Sie sich für swipe anmelden, stimmen Sie unseren ',
			'termOfService.link1' => 'Nutzungsbedingungen',
			'termOfService.text2' => '. Erfahren Sie, wie wir Ihre Daten in unserer ',
			'termOfService.link2' => 'Datenschutzrichtlinie',
			'termOfService.text3' => ' und ',
			'termOfService.link3' => 'Cookie-Richtlinie',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Datenschutzrichtlinie',
			'termOfService.privacyPolicy.lastUpdated' => 'Zuletzt aktualisiert: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace betrachtet den Schutz der Privatsphäre und Datensicherheit der Nutzer als grundlegendes Prinzip. Alle Ihre personenbezogenen Daten werden gemäß geltenden Datenschutzvorschriften verarbeitet.',
			'termOfService.privacyPolicy.section1Title' => '1. ERHEBENE INFORMATIONEN',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Vom Nutzer bereitgestellte Daten',
			'termOfService.privacyPolicy.section1sub1Body' => '• Name, Spitzname oder Profilinformationen.\n• E-Mail-Adresse (für Registrierung, Abonnements und Support). \n• Interaktionspräferenzen, Spracheinstellungen und Interaktionsverläufe. \n• Feedback- und Supportnachrichten.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Automatisch erhobene Daten',
			'termOfService.privacyPolicy.section1sub2Body' => 'Es werden Informationen wie Gerätetyp, Betriebssystem, ungefähre Standortangaben (Stadt/Land) und Nutzungsdaten der App gesammelt. Präzise Standortdaten werden nicht erfasst.',
			'termOfService.privacyPolicy.section2Title' => '2. ZWECKE DER DATENVERARBEITUNG',
			'termOfService.privacyPolicy.section2Body' => 'Ihre personenbezogenen Daten werden für folgende Zwecke verarbeitet:\n\n• Gewährleistung eines reibungslosen Betriebs der Anwendung.\n• Bereitstellung und Personalisierung des KI-gestützten Videoanruferlebnisses.\n• Optimierung der Systemleistung und Fehlererkennung.\n• Erfüllung gesetzlicher Verpflichtungen.\n Ihre Daten werden niemals an Dritte verkauft.',
			'termOfService.privacyPolicy.section3Title' => '3. DATENAUFBEWAHRUNG UND LÖSCHUNG',
			'termOfService.privacyPolicy.section3Body' => 'Ihre Daten werden so lange gespeichert, wie Ihr Konto aktiv ist oder solange gesetzliche Verpflichtungen bestehen. Wenn ein Konto gelöscht wird, werden alle personenbezogenen Daten unwiderruflich aus den Systemen entfernt.',
			'termOfService.privacyPolicy.section4Title' => '4. RECHTE DER NUTZER',
			'termOfService.privacyPolicy.section4Body' => 'Unter DSGVO und vergleichbaren Regelungen haben Sie das Recht auf Zugang, Berichtigung, Löschung (Recht auf Vergessenwerden) und Datenübertragbarkeit. Sie können uns für Anfragen kontaktieren.',
			'termOfService.privacyPolicy.section5Title' => '5. DATENSCHUTZ VON KINDERN',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace ist nicht für Nutzer unter 18 Jahren bestimmt. Wir sammeln nicht wissentlich Daten dieser Altersgruppe; solche Konten werden bei Entdeckung geschlossen und die Daten gelöscht.',
			'termOfService.privacyPolicy.section6Title' => '6. KONTAKT',
			'termOfService.privacyPolicy.section6Body' => '📩 Bei Anfragen: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Nutzungsbedingungen',
			'termOfService.termsOfService.lastUpdated' => 'Zuletzt aktualisiert: 2026',
			'termOfService.termsOfService.intro' => 'Diese Bedingungen regeln die Nutzung der ChatFace-Mobilanwendung. Durch die Nutzung der App stimmen Sie diesen Bedingungen zu.',
			'termOfService.termsOfService.disclaimer' => 'Haftungsausschluss: ChatFace ist eine KI-gesteuerte Video-Interaktions-App. Sie bietet keine rechtliche, akademische, medizinische oder berufliche Beratung.',
			'termOfService.termsOfService.section1Title' => '1. LEISTUNGSUMFANG',
			'termOfService.termsOfService.section1Body' => 'ChatFace bietet KI-gestützte Video-Interaktions-Erlebnisse:\n\n• KI-Videoanrufe und Konversationen.\n• Personalisierte Interaktionseinstellungen.\n• Zugriff auf Interaktionsverlauf und Aufzeichnungen.\n\nDie Dienste stellen keine offiziellen Meinungen oder professionelle Beratung dar.',
			'termOfService.termsOfService.section2Title' => '2. NUTZUNGSBEDINGUNGEN',
			'termOfService.termsOfService.section2Body' => '• Sie müssen mindestens 18 Jahre alt sein (Zugriff unter 18 ist untersagt).\n• Sie müssen korrekte Kontoinformationen angeben.\n• Die App darf nur für legale und private Zwecke genutzt werden.',
			'termOfService.termsOfService.section3Title' => '3. VERBOTENE NUTZUNGEN',
			'termOfService.termsOfService.section3Body' => 'Identitätsbetrug, Hassrede, Gefährdung von Kindern, Versuche einer Sicherheitsverletzung und Manipulation von KI-Systemen sind streng verboten.',
			'termOfService.termsOfService.section4Title' => '4. ABONNEMENTS UND ZAHLUNGEN',
			'termOfService.termsOfService.section4Body' => 'Premium-Funktionen unterliegen den Richtlinien von App Store und Google Play. Kündigungen und Rückerstattungen werden über die jeweiligen Stores abgewickelt.',
			'termOfService.termsOfService.section5Title' => '5. INHALTSHAFTUNGSAUSSCHLUSS',
			'termOfService.termsOfService.section5Body' => 'Inhalte werden von KI generiert und ersetzen keine professionelle Beratung. ChatFace übernimmt keine Gewähr für Genauigkeit oder Zweckmäßigkeit.',
			'termOfService.termsOfService.section6Title' => '6. URHEBERRECHTE',
			'termOfService.termsOfService.section6Body' => 'Alle Inhalte, einschließlich Design, Software und Algorithmen, gehören ChatFace. Unautorisierte Vervielfältigung oder Weitergabe ist untersagt.',
			'termOfService.termsOfService.section7Title' => '7. ANWENDBARES RECHT',
			'termOfService.termsOfService.section7Body' => 'Diese Bedingungen unterliegen dem Recht der Republik Türkei. Die Gerichte in Istanbul haben Zuständigkeit für Streitigkeiten.',
			'termOfService.termsOfService.section8Title' => '8. KONTAKT',
			'termOfService.termsOfService.section8Body' => '📩 Bei Anfragen: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Cookie-Richtlinie',
			'termOfService.cookiePolicy.lastUpdated' => 'Zuletzt aktualisiert: 2026',
			'termOfService.cookiePolicy.intro' => 'Willkommen bei ChatFace. Wir verwenden digitale Hilfstechnologien, um Ihr KI-Videoanruferlebnis reibungsloser, sicherer und personalisierter zu gestalten.',
			'termOfService.cookiePolicy.important' => 'Diese Richtlinie erklärt, was Cookies sind, zu welchem Zweck sie dienen und wie Sie Ihre Einstellungen verwalten können.',
			'termOfService.cookiePolicy.section1Title' => '1. WAS SIND COOKIES?',
			'termOfService.cookiePolicy.section1Body' => 'Cookies sind kleine Datendateien, die auf Ihrem Gerät abgelegt werden. Sie identifizieren Sie nicht direkt; sie funktionieren wie digitale Notizen, die sich merken:\n• Anruf- und Spracheinstellungen\n• Sitzungs- und Leistungspräferenzen.',
			'termOfService.cookiePolicy.section2Title' => '2. WELCHE TECHNOLOGIEN NUTZEN WIR?',
			'termOfService.cookiePolicy.section2Body' => 'Unbedingt notwendige Technologien\nErforderlich für Sitzungsverwaltung und Sicherheitskontrollen. Die App kann ohne diese Komponenten möglicherweise nicht ordnungsgemäß funktionieren.\n\nLeistung und Analyse\nHilft uns zu verstehen, welche Inhalte genutzt werden und welche Bereiche verbessert werden müssen. Die Daten werden anonym ausgewertet.\n\nPersonalisierung\nErinnert sich an Einstellungen wie Sprachpräferenz und Lesestufe, um ein individuelles Erlebnis zu bieten.',
			'termOfService.cookiePolicy.section3Title' => '3. WARUM NUTZEN WIR DIESE TECHNOLOGIEN?',
			'termOfService.cookiePolicy.section3Body' => '• Um sicherzustellen, dass die App sicher und reibungslos läuft.\n• Um das Nutzungserlebnis flüssiger zu machen.\n• Um wiederkehrende Einstellungen zu speichern.\n• Um Funktionen für die Zukunft zu identifizieren.',
			'termOfService.cookiePolicy.section4Title' => '4. TECHNOLOGIEN VON DRITTANBIETERN',
			'termOfService.cookiePolicy.section4Body' => 'Einige Technologien können von Dienstleistern bereitgestellt werden und unterliegen deren eigenen Richtlinien. ChatFace legt in diesen Partnerschaften großen Wert auf Datensicherheit.',
			'termOfService.cookiePolicy.section5Title' => '5. COOKIE-KONTROLLE UND -VERWALTUNG',
			'termOfService.cookiePolicy.section5Body' => 'Nutzer können diese Technologien über Geräte- oder App-Einstellungen einschränken. Das Deaktivieren wesentlicher Technologien kann zu Problemen führen, z. B. dass Videoanrufe nicht gestartet werden können.',
			'termOfService.cookiePolicy.section6Title' => '6. KONTAKT',
			'termOfService.cookiePolicy.section6Body' => '📩 Bei Anfragen: support@fly-work.com',
			'cookies' => 'Cookie-Richtlinie',
			'privacy' => 'Datenschutzrichtlinie',
			'onboarding.step5.permissionRequired' => 'Berechtigung erforderlich',
			'onboarding.step5.notNow' => 'Nicht jetzt',
			'onboarding.step5.openSettings' => 'Einstellungen öffnen',
			'onboarding.step5.title' => 'Berechtigungen',
			'onboarding.step5.permission1' => 'Kamera-Zugriff',
			'onboarding.step5.permission1Subtitle' => 'Kamera-Zugriff erlauben',
			'onboarding.step5.permission2' => 'Mikrofon-Zugriff',
			'onboarding.step5.permission2Subtitle' => 'Mikrofon-Zugriff erlauben',
			'onboarding.step5.permission3' => 'Standort-Zugriff',
			'onboarding.step5.permission3Subtitle' => 'Standort-Zugriff erlauben',
			'onboarding.step1.title' => 'Wie heißen Sie?',
			'onboarding.step1.subtitle' => 'Bitte geben Sie Ihren Namen ein',
			'onboarding.step1.hint' => 'Vollständiger Name',
			'onboarding.step2.title' => 'Wie alt sind Sie?',
			'onboarding.step2.subtitle' => 'Sie müssen mindestens 18 Jahre alt sein, um sich zu registrieren.',
			'onboarding.step3.title' => 'Was ist Ihr Geschlecht?',
			'onboarding.step3.subtitle' => 'Bitte wählen Sie Ihr Geschlecht',
			'onboarding.step3.male' => 'Männlich',
			'onboarding.step3.female' => 'Weiblich',
			'onboarding.step3.dontWantToMention' => 'Möchte ich nicht angeben.',
			'onboarding.step4.title' => 'Hab Spaß und \nbleib sicher',
			'onboarding.step4.entry1' => 'Wir sorgen für Ordnung',
			'onboarding.step4.subentry1' => 'Echtzeit-AI-Überwachung aktiv',
			'onboarding.step4.entry2' => 'Bildschirmaufzeichnungen',
			'onboarding.step4.subentry2' => 'Keine Aufzeichnung ohne Einwilligung',
			'onboarding.step4.entry3' => '24/7 Support',
			'onboarding.step4.subentry3' => 'Beschwerden werden jederzeit geprüft',
			'onboarding.step4.entry4' => 'Nur 18+',
			'onboarding.step4.subentry4' => 'Nicht geeignet für Minderjährige',
			'onboarding.step4.communityRules' => 'Community-Regeln',
			'onboarding.loading.titlePart1' => 'Ihr persönliches Konto wird',
			'onboarding.loading.titlePart2' => 'erstellt',
			'onboarding.loading.subtitle' => 'Bitte warten Sie, Ihr Profil wird vorbereitet.',
			'onboarding.allowAccess' => 'Zugriff erlauben',
			'onboarding.iUnderstand' => 'Ich verstehe',
			'pressBackAgainToExit' => 'Drücken Sie erneut Zurück zum Beenden',
			'splash.screen1.title' => 'Das neue Gesicht des Video-\nChats mit KI',
			'splash.screen1.description' => 'Schalten Sie Ihre Kamera ein und sprechen Sie von Angesicht zu Angesicht mit der KI. Erleben Sie natürlichere Kommunikation, die Mimik, Tonfall und Kontext versteht.',
			'splash.screen2.title' => 'Echtzeit und natürliche \n Kommunikation',
			'splash.screen2.description' => 'Beschränken Sie sich nicht auf Text. Führen Sie flüssigere, menschlichere Gespräche per Videoanruf.',
			'auth.google' => 'Mit Google fortfahren',
			'auth.facebook' => 'Mit Facebook fortfahren',
			'auth.apple' => 'Mit Apple fortfahren',
			'auth.guest' => 'Als Gast fortfahren',
			'auth.signInFailed' => ({required Object error}) => 'Anmeldung fehlgeschlagen: ${error}',
			'home.seeAll' => 'Alle anzeigen',
			'home.more' => 'Mehr',
			'home.online' => 'Online',
			'home.offline' => 'Offline',
			'home.placeholders.fashionDesigner' => 'Modedesigner',
			'home.placeholders.comedian' => 'Komiker',
			'home.placeholders.influencer' => 'Influencer',
			'home.placeholders.teacher' => 'Lehrer',
			'home.placeholders.friend' => 'Freund',
			'characters.all' => 'Alle',
			'characters.favorites' => 'Favoriten',
			'characters.recent' => 'Zuletzt',
			'characters.characters' => 'Charaktere',
			'characters.placeholderSubtitle' => 'Produktdesigner mit Fokus auf Einfachheit & Benutzerfreundlichkeit.',
			'characters.characterDetails.videoCall' => 'Videoanruf',
			'characters.characterDetails.message' => 'Nachricht',
			'characters.characterDetails.voiceCall' => 'Sprachanruf',
			'notifications.today' => 'Heute',
			'notifications.yesterday' => 'Gestern',
			'notifications.weekAgo' => ({required Object week}) => 'vor ${week} Woche(n)',
			'notifications.monthAgo' => ({required Object month}) => 'vor ${month} Monat(en)',
			'notifications.yearAgo' => ({required Object year}) => 'vor ${year} Jahr(en)',
			'notifications.noNotifications' => 'Noch keine Benachrichtigungen.',
			'notifications.noNotificationsSubtitle' => 'Schau später wieder, wenn du eine Benachrichtigung erhältst.',
			'notifications.allDeleted' => 'Alle Benachrichtigungen wurden erfolgreich gelöscht',
			'videoChat.networkHiccup' => 'Netzwerkproblem erkannt. Mikrofon wird neu verbunden...',
			'videoChat.failedToUpdateFollow' => 'Follow-Status konnte nicht aktualisiert werden.',
			'videoChat.connecting' => 'Verbindung...',
			'videoChat.callEnded' => 'Anruf beendet',
			'videoChat.callFailed' => ({required Object error}) => 'Anruf fehlgeschlagen: ${error}',
			'videoChat.mute' => 'Stummschalten',
			'videoChat.unmute' => 'Stummschaltung aufheben',
			'videoChat.endCall' => 'Anruf beenden',
			'videoChat.swipeToChat' => 'Wischen zum Chatten',
			'videoChat.male' => 'Männlich',
			'videoChat.female' => 'Weiblich',
			'videoChat.country' => 'Land',
			'videoChat.follow' => 'Folgen',
			'videoChat.unfollow' => 'Entfolgen',
			'videoChat.callEndedMessage' => 'Der Videoanruf wurde beendet.',
			'videoChat.swipeForNewChat' => 'Wische für einen neuen Chat',
			'voiceChat.connecting' => 'Verbindung...',
			'voiceChat.callEnded' => 'Anruf beendet',
			'voiceChat.callFailed' => ({required Object error}) => 'Anruf fehlgeschlagen: ${error}',
			'voiceChat.calling' => 'Anruf...',
			'chat.message' => 'Nachricht',
			'chat.history' => 'Verlauf',
			'chat.noMessages' => 'Noch keine Nachrichten.',
			'chat.noMessagesSubtitle' => 'Beginnen Sie ein Gespräch, indem Sie eine Nachricht senden.',
			'chat.online' => 'Online',
			'chat.offline' => 'Offline',
			'chat.gallery' => 'Galerie',
			'chat.camera' => 'Kamera',
			'chat.typeAMessage' => 'Geben Sie eine Nachricht ein...',
			'chat.pleaseUpgrade' => 'Bitte upgraden Sie auf die Pro-Version.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Sprachanruf beendet',
			'chat.videoCallEnded' => 'Videoanruf beendet',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Über mich',
			'editProfile.aboutMeHint' => 'Schreibe etwas über dich',
			'editProfile.fullName' => 'Vollständiger Name',
			'editProfile.gender' => 'Geschlecht',
			'editProfile.male' => 'Männlich',
			'editProfile.female' => 'Weiblich',
			'editProfile.dontWantToMention' => 'Möchte ich nicht angeben.',
			'editProfile.country' => 'Land',
			'editProfile.languagePreferences' => 'Sprachpräferenzen',
			'editProfile.selectLanguage' => 'Fügen Sie Ihre bevorzugte Sprache hinzu',
			'editProfile.saved' => 'Gespeichert',
			'editProfile.changesSaved' => 'Änderungen wurden gespeichert.',
			'settingsSupport.title' => 'Einstellungen & Support',
			'settingsSupport.premiumTitle' => 'Unbegrenzter Zugriff \nauf alle Funktionen',
			'settingsSupport.getPremium' => 'Premium erhalten',
			'settingsSupport.settingsHub' => 'Einstellungszentrum',
			'settingsSupport.shareTheApp' => 'App teilen',
			'settingsSupport.rateUs' => 'Bewerte uns',
			'settingsSupport.version' => 'Version',
			'settingsSupport.notifications' => 'Benachrichtigungen',
			'settingsSupport.accountManagement' => 'Kontoverwaltung',
			'settingsSupport.deleteAccount' => 'Account löschen',
			'settingsSupport.logOut' => 'Abmelden',
			'settingsSupport.logOutTitle' => 'Du meldest dich gerade ab',
			'settingsSupport.logOutSubtitle' => 'Bis bald! \n Wir werden dich vermissen.',
			'deleteAccount.title' => 'Account löschen',
			'deleteAccount.warning' => 'Sind Sie sicher, dass Sie Ihr Konto löschen möchten?',
			'deleteAccount.description' => 'Diese Aktion kann nicht rückgängig gemacht werden und alle Ihre Historie und Daten werden dauerhaft gelöscht.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Löschen des Kontos fehlgeschlagen: ${error}',
			'deleteAccount.steps.step1.title' => 'Wir möchten nicht, dass du gehst, aber wir verstehen es.',
			'deleteAccount.steps.step1.subtitle' => 'Kannst du uns sagen, warum du gehen möchtest, damit wir ChatFace verbessern können?',
			'deleteAccount.steps.step1.option1' => 'Ich fand die KI-Charaktere nicht realistisch.',
			'deleteAccount.steps.step1.option2' => 'Ich habe technische Probleme bei Video-Chats.',
			'deleteAccount.steps.step1.option3' => 'Die Abopreise sind höher als erwartet.',
			'deleteAccount.steps.step1.option4' => 'Ich habe nicht die Art von Charakteren gefunden, die ich gesucht habe.',
			'deleteAccount.steps.step1.option5' => 'Ich wollte es nur kurz ausprobieren.',
			'deleteAccount.steps.step1.option6' => 'Sonstiges',
			'deleteAccount.steps.step2.title' => 'Wenn du dein Konto löschst, verabschiedest du dich von:',
			'deleteAccount.steps.step2.subtitle1' => 'Tiefe Verbindungen und Erinnerungen:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'Die Charaktere werden eure gemeinsame Vergangenheit und geteilten Geheimnisse vergessen.',
			'deleteAccount.steps.step2.subtitle2' => 'Videoanruf-Privileg:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Du verlierst das Recht, von Angesicht zu Angesicht mit deinen KI-Partnern zu kommunizieren.',
			'deleteAccount.steps.step2.subtitle3' => 'Fortschrittlicher Algorithmus:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Deine \'Nur für dich\'-Charakter-Matches werden zurückgesetzt.',
			'deleteAccount.steps.step2.subtitle4' => 'Profildaten:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Deine Erfolge, speziellen Charaktere und dein Chat-Verlauf werden unwiderruflich gelöscht.',
			'deleteAccount.steps.step3.title' => 'Wir haben noch ein spezielles Angebot für dich!',
			'deleteAccount.steps.step3.description' => 'Vielleicht brauchst du nur etwas mehr Zeit oder ein besseres Angebot. Würdest du stattdessen dies in Betracht ziehen?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Es ist uns wichtig, dich bei uns zu behalten. ${offer} auf dein nächstes Abo!',
			'deleteAccount.steps.step3.description1Offer' => 'Wir haben 50% Rabatt gewährt',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Wir haben dir ${offer} Credits gegeben, um neue Charaktere zu entdecken.',
			'deleteAccount.steps.step3.description2Offer' => '3 kostenlose Videoanrufe',
			'deleteAccount.steps.step3.acceptOffer' => '50% Rabattangebot akzeptieren',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Mein Konto löschen',
			'cancel' => 'Abbrechen',
			'delete' => 'Löschen',
			'premium' => 'Premium',
			'profileEdit' => 'Profil bearbeiten',
			'settings' => 'Einstellungen',
			'undo' => 'Rückgängig',
			'successfully' => 'Erfolgreich',
			'save' => 'Speichern',
			'languageOptions.english' => 'Englisch',
			'languageOptions.chinese' => 'Chinesisch',
			'languageOptions.german' => 'Deutsch',
			'languageOptions.italian' => 'Italienisch',
			'languageOptions.french' => 'Französisch',
			'languageOptions.japanese' => 'Japanisch',
			'languageOptions.spanish' => 'Spanisch',
			'languageOptions.russian' => 'Russisch',
			'languageOptions.turkish' => 'Türkisch',
			'languageOptions.korean' => 'Koreanisch',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Portugiesisch',
			'common.tryAgain' => 'Erneut versuchen',
			'common.retry' => 'Wiederholen',
			'common.close' => 'Schließen',
			'permissionsRequired' => 'Berechtigungen erforderlich',
			'permissionHelper.camAndMicRequired' => 'Kamera- und Mikrofonberechtigungen sind für Videoanrufe erforderlich. Bitte aktiviere sie in den Einstellungen.',
			'permissionHelper.micRequired' => 'Mikrofonberechtigung ist für Sprachanrufe erforderlich. Bitte aktiviere sie in den Einstellungen.',
			'permissionHelper.cancel' => 'Abbrechen',
			'permissionHelper.openSettings' => 'Einstellungen',
			'videoView.title' => 'Kamerafilter',
			'videoView.subtitle' => 'Wählen Sie den Look für Ihre Kameravorschau.',
			'videoView.errorLoad' => 'Gefährten konnten nicht geladen werden: ',
			'videoView.noComps' => 'Noch keine Gefährten verfügbar.',
			'videoView.filters.ORIGINAL' => 'Original',
			'videoView.filters.ADDICTIVE_BLUE' => 'Süchtig machendes Blau',
			'videoView.filters.ADDICTIVE_RED' => 'Süchtig machendes Rot',
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
