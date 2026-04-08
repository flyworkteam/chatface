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
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Bienvenue ${name}';
	@override String welcome2({required Object appName}) => 'Bienvenue sur ${appName}';
	@override String get get_started => 'Commencer';
	@override String get next => 'Suivant';
	@override String get back => 'Retour';
	@override String get skip => 'Passer';
	@override String get profile => 'Profil';
	@override String get kContinue => 'Continuer';
	@override late final _TranslationsTermOfServiceFr termOfService = _TranslationsTermOfServiceFr._(_root);
	@override String get cookies => 'Politique relative aux cookies';
	@override String get privacy => 'Politique de confidentialité';
	@override late final _TranslationsOnboardingFr onboarding = _TranslationsOnboardingFr._(_root);
	@override String get pressBackAgainToExit => 'Appuyez à nouveau sur Retour pour quitter';
	@override late final _TranslationsSplashFr splash = _TranslationsSplashFr._(_root);
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsCharactersFr characters = _TranslationsCharactersFr._(_root);
	@override late final _TranslationsNotificationsFr notifications = _TranslationsNotificationsFr._(_root);
	@override late final _TranslationsVideoChatFr videoChat = _TranslationsVideoChatFr._(_root);
	@override late final _TranslationsVoiceChatFr voiceChat = _TranslationsVoiceChatFr._(_root);
	@override late final _TranslationsChatFr chat = _TranslationsChatFr._(_root);
	@override late final _TranslationsEditProfileFr editProfile = _TranslationsEditProfileFr._(_root);
	@override late final _TranslationsSettingsSupportFr settingsSupport = _TranslationsSettingsSupportFr._(_root);
	@override late final _TranslationsDeleteAccountFr deleteAccount = _TranslationsDeleteAccountFr._(_root);
	@override String get cancel => 'Annuler';
	@override String get delete => 'Supprimer';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Modifier le profil';
	@override String get settings => 'Paramètres';
	@override String get undo => 'Annuler';
	@override String get successfully => 'Avec succès';
	@override String get save => 'Enregistrer';
	@override late final _TranslationsLanguageOptionsFr languageOptions = _TranslationsLanguageOptionsFr._(_root);
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override String get permissionsRequired => 'Autorisations requises';
	@override late final _TranslationsPermissionHelperFr permissionHelper = _TranslationsPermissionHelperFr._(_root);
	@override late final _TranslationsVideoViewFr videoView = _TranslationsVideoViewFr._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceFr implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'En vous inscrivant à swipe, vous acceptez nos ';
	@override String get link1 => 'Conditions d\'utilisation';
	@override String get text2 => '. Découvrez comment nous traitons vos données dans notre ';
	@override String get link2 => 'Politique de confidentialité';
	@override String get text3 => ' et ';
	@override String get link3 => 'Politique relative aux cookies';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyFr privacyPolicy = _TranslationsTermOfServicePrivacyPolicyFr._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceFr termsOfService = _TranslationsTermOfServiceTermsOfServiceFr._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyFr cookiePolicy = _TranslationsTermOfServiceCookiePolicyFr._(_root);
}

// Path: onboarding
class _TranslationsOnboardingFr implements TranslationsOnboardingEn {
	_TranslationsOnboardingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5Fr step5 = _TranslationsOnboardingStep5Fr._(_root);
	@override late final _TranslationsOnboardingStep1Fr step1 = _TranslationsOnboardingStep1Fr._(_root);
	@override late final _TranslationsOnboardingStep2Fr step2 = _TranslationsOnboardingStep2Fr._(_root);
	@override late final _TranslationsOnboardingStep3Fr step3 = _TranslationsOnboardingStep3Fr._(_root);
	@override late final _TranslationsOnboardingStep4Fr step4 = _TranslationsOnboardingStep4Fr._(_root);
	@override late final _TranslationsOnboardingLoadingFr loading = _TranslationsOnboardingLoadingFr._(_root);
	@override String get allowAccess => 'Autoriser l\'accès';
	@override String get iUnderstand => 'Je comprends';
}

// Path: splash
class _TranslationsSplashFr implements TranslationsSplashEn {
	_TranslationsSplashFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Fr screen1 = _TranslationsSplashScreen1Fr._(_root);
	@override late final _TranslationsSplashScreen2Fr screen2 = _TranslationsSplashScreen2Fr._(_root);
}

// Path: auth
class _TranslationsAuthFr implements TranslationsAuthEn {
	_TranslationsAuthFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get google => 'Continuer avec Google';
	@override String get facebook => 'Continuer avec Facebook';
	@override String get apple => 'Continuer avec Apple';
	@override String get guest => 'Continuer en tant qu\'invité';
	@override String signInFailed({required Object error}) => 'Échec de la connexion : ${error}';
}

// Path: home
class _TranslationsHomeFr implements TranslationsHomeEn {
	_TranslationsHomeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Tout voir';
	@override String get more => 'Plus';
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
	@override late final _TranslationsHomePlaceholdersFr placeholders = _TranslationsHomePlaceholdersFr._(_root);
}

// Path: characters
class _TranslationsCharactersFr implements TranslationsCharactersEn {
	_TranslationsCharactersFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get all => 'Tous';
	@override String get favorites => 'Favoris';
	@override String get recent => 'Récents';
	@override String get characters => 'Personnages';
	@override String get placeholderSubtitle => 'Designer produit axé sur la simplicité et l\'utilisabilité.';
	@override late final _TranslationsCharactersCharacterDetailsFr characterDetails = _TranslationsCharactersCharacterDetailsFr._(_root);
}

// Path: notifications
class _TranslationsNotificationsFr implements TranslationsNotificationsEn {
	_TranslationsNotificationsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get yesterday => 'Hier';
	@override String weekAgo({required Object week}) => 'il y a ${week} semaine(s)';
	@override String monthAgo({required Object month}) => 'il y a ${month} mois';
	@override String yearAgo({required Object year}) => 'il y a ${year} an(s)';
	@override String get noNotifications => 'Pas encore de notifications.';
	@override String get noNotificationsSubtitle => 'N\'oubliez pas de vérifier à nouveau lorsque vous recevrez une notification.';
	@override String get allDeleted => 'Toutes les notifications ont été supprimées avec succès';
}

// Path: videoChat
class _TranslationsVideoChatFr implements TranslationsVideoChatEn {
	_TranslationsVideoChatFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Problème de réseau détecté. Reconnexion...';
	@override String get failedToUpdateFollow => 'Échec de la mise à jour du suivi.';
	@override String get connecting => 'Connexion...';
	@override String get callEnded => 'Appel terminé';
	@override String callFailed({required Object error}) => 'Appel échoué : ${error}';
	@override String get mute => 'Couper le son';
	@override String get unmute => 'Activer le son';
	@override String get endCall => 'Terminer l\'appel';
	@override String get swipeToChat => 'Glisser pour discuter';
	@override String get male => 'Homme';
	@override String get female => 'Femme';
	@override String get country => 'Pays';
	@override String get follow => 'Suivre';
	@override String get unfollow => 'Ne plus suivre';
	@override String get callEndedMessage => 'L\'appel vidéo est terminé.';
	@override String get swipeForNewChat => 'Glissez pour un nouveau chat';
}

// Path: voiceChat
class _TranslationsVoiceChatFr implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Connexion...';
	@override String get callEnded => 'Appel terminé';
	@override String callFailed({required Object error}) => 'Appel échoué : ${error}';
	@override String get calling => 'Appel en cours...';
}

// Path: chat
class _TranslationsChatFr implements TranslationsChatEn {
	_TranslationsChatFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get message => 'Message';
	@override String get history => 'Historique';
	@override String get noMessages => 'Pas encore de messages.';
	@override String get noMessagesSubtitle => 'Commencez une conversation en envoyant un message.';
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
	@override String get gallery => 'Galerie';
	@override String get camera => 'Caméra';
	@override String get typeAMessage => 'Tapez un message...';
	@override String get pleaseUpgrade => 'Veuillez passer à la version pro.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Appel vocal terminé';
	@override String get videoCallEnded => 'Appel vidéo terminé';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileFr implements TranslationsEditProfileEn {
	_TranslationsEditProfileFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'À propos de moi';
	@override String get aboutMeHint => 'Écrivez quelque chose sur vous';
	@override String get fullName => 'Nom complet';
	@override String get gender => 'Genre';
	@override String get male => 'Homme';
	@override String get female => 'Femme';
	@override String get dontWantToMention => 'Je préfère ne pas le dire.';
	@override String get country => 'Pays';
	@override String get languagePreferences => 'Préférences de langue';
	@override String get selectLanguage => 'Ajoutez votre langue préférée';
	@override String get saved => 'Enregistré';
	@override String get changesSaved => 'Les modifications ont été enregistrées.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportFr implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres & Support';
	@override String get premiumTitle => 'Accès illimité à toutes \nles fonctionnalités';
	@override String get getPremium => 'Obtenir Premium';
	@override String get settingsHub => 'Centre des paramètres';
	@override String get shareTheApp => 'Partager l\'application';
	@override String get rateUs => 'Évaluez-nous';
	@override String get version => 'Version';
	@override String get notifications => 'Notifications';
	@override String get accountManagement => 'Gestion du compte';
	@override String get deleteAccount => 'Supprimer le compte';
	@override String get logOut => 'Déconnexion';
	@override String get logOutTitle => 'Vous êtes sur le point de vous déconnecter';
	@override String get logOutSubtitle => 'À bientôt ! \n Nous allons vous manquer.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountFr implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer le compte';
	@override String get warning => 'Êtes-vous sûr de vouloir supprimer votre compte ?';
	@override String get description => 'Cette action est irréversible et tout votre historique et vos données seront définitivement supprimés.';
	@override String deleteFailed({required Object error}) => 'Suppression du compte échouée : ${error}';
	@override late final _TranslationsDeleteAccountStepsFr steps = _TranslationsDeleteAccountStepsFr._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsFr implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get english => 'Anglais';
	@override String get chinese => 'Chinois';
	@override String get german => 'Allemand';
	@override String get italian => 'Italien';
	@override String get french => 'Français';
	@override String get japanese => 'Japonais';
	@override String get spanish => 'Espagnol';
	@override String get russian => 'Russe';
	@override String get turkish => 'Turc';
	@override String get korean => 'Coréen';
	@override String get hindi => 'Hindi';
	@override String get portuguese => 'Portugais';
}

// Path: common
class _TranslationsCommonFr implements TranslationsCommonEn {
	_TranslationsCommonFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Réessayer';
	@override String get retry => 'Réessayer';
	@override String get close => 'Fermer';
}

// Path: permissionHelper
class _TranslationsPermissionHelperFr implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Les autorisations de l\'appareil photo et du micro sont requises pour les appels vidéo. Veuillez les activer dans les paramètres.';
	@override String get micRequired => 'L\'autorisation du micro est requise pour les appels vocaux. Veuillez l\'activer dans les paramètres.';
	@override String get cancel => 'Annuler';
	@override String get openSettings => 'Ouvrir les paramètres';
}

// Path: videoView
class _TranslationsVideoViewFr implements TranslationsVideoViewEn {
	_TranslationsVideoViewFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtres de caméra';
	@override String get subtitle => 'Choisissez l\'apparence de l\'aperçu de votre caméra.';
	@override String get errorLoad => 'Échec du chargement des compagnons : ';
	@override String get noComps => 'Aucun compagnon disponible pour le moment.';
	@override late final _TranslationsVideoViewFiltersFr filters = _TranslationsVideoViewFiltersFr._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyFr implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Politique de confidentialité';
	@override String get lastUpdated => 'Dernière mise à jour : 2026';
	@override String get intro => 'ChatFace adopte la confidentialité des utilisateurs et la sécurité des données comme principe fondamental. Toutes vos données personnelles sont traitées conformément aux réglementations en vigueur en matière de protection des données.';
	@override String get section1Title => '1. INFORMATIONS COLLECTÉES';
	@override String get section1sub1Title => '1.1 Données fournies par l\'utilisateur';
	@override String get section1sub1Body => '• Nom, surnom ou informations de profil.\n• Adresse e-mail (pour l\'inscription, l\'abonnement et le support). \n• Préférences d\'interaction, paramètres de langue et interactions. \n• Messages de retour et de support.';
	@override String get section1sub2Title => '1.2 Données collectées automatiquement';
	@override String get section1sub2Body => 'Sont collectées des informations telles que le type d\'appareil, le système d\'exploitation, la localisation approximative (ville/pays) et les données d\'utilisation de l\'application. Les données de localisation précises ne sont pas collectées.';
	@override String get section2Title => '2. FINALITÉS DU TRAITEMENT DES DONNÉES';
	@override String get section2Body => 'Vos données personnelles sont traitées aux fins suivantes :\n\n• Assurer le bon fonctionnement de l\'application.\n• Fournir et personnaliser l\'expérience d\'appel vidéo alimentée par l\'IA.\n• Optimiser les performances du système et la détection des erreurs.\n• Respecter les obligations légales.\n Vos données ne sont jamais vendues à des tiers.';
	@override String get section3Title => '3. CONSERVATION ET SUPPRESSION DES DONNÉES';
	@override String get section3Body => 'Vos données sont conservées tant que votre compte est actif ou pendant la durée des obligations légales. Lorsqu\'un compte est supprimé, toutes les données personnelles sont effacées de manière irréversible des systèmes.';
	@override String get section4Title => '4. DROITS DES UTILISATEURS';
	@override String get section4Body => 'En vertu du RGPD et d\'autres lois, vous avez le droit d\'accéder, de corriger, de supprimer (droit à l\'oubli) et de demander la portabilité des données. Vous pouvez nous contacter pour vos demandes.';
	@override String get section5Title => '5. CONFIDENTIALITÉ DES ENFANTS';
	@override String get section5Body => 'ChatFace n\'est pas destiné aux utilisateurs de moins de 18 ans. Nous ne collectons pas sciemment de données de ce groupe d\'âge ; ces comptes seront fermés et les données supprimées dès leur détection.';
	@override String get section6Title => '6. CONTACT';
	@override String get section6Body => '📩 Pour toute demande : support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceFr implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conditions d\'utilisation';
	@override String get lastUpdated => 'Dernière mise à jour : 2026';
	@override String get intro => 'Ces conditions régissent l\'utilisation de l\'application mobile ChatFace. En utilisant l\'application, vous acceptez ces conditions.';
	@override String get disclaimer => 'Avertissement : ChatFace est une application d\'interaction vidéo assistée par IA. Elle ne fournit pas de conseils juridiques, académiques, médicaux ou professionnels.';
	@override String get section1Title => '1. CHAMP D\'APPLICATION';
	@override String get section1Body => 'ChatFace propose des expériences d\'interaction vidéo pilotées par l\'IA :\n\n• Appels vidéo et conversations avec IA.\n• Préférences d\'interaction personnalisées.\n• Accès à l\'historique des interactions et aux enregistrements.\n\nLes services ne constituent pas des avis officiels ni des garanties de conseils professionnels.';
	@override String get section2Title => '2. CONDITIONS D\'UTILISATION';
	@override String get section2Body => '• Vous devez avoir au moins 18 ans (l\'accès aux moins de 18 ans est interdit).\n• Vous devez fournir des informations de compte exactes.\n• L\'application doit être utilisée uniquement à des fins légales et personnelles.';
	@override String get section3Title => '3. USAGES INTERDITS';
	@override String get section3Body => 'Usurpation d\'identité, discours de haine, mise en danger de la sécurité des enfants, tentatives de violation de la sécurité et manipulation des systèmes d\'IA sont strictement interdits.';
	@override String get section4Title => '4. ABONNEMENTS ET PAIEMENTS';
	@override String get section4Body => 'Les fonctionnalités Premium sont soumises aux politiques de l\'App Store et de Google Play. Les annulations et remboursements d\'abonnement sont gérés via les boutiques respectives.';
	@override String get section5Title => '5. DÉCHARGE DE RESPONSABILITÉ DU CONTENU';
	@override String get section5Body => 'Le contenu est généré par l\'IA et ne remplace pas un avis professionnel. ChatFace ne garantit pas l\'exactitude ou l\'adéquation à un usage particulier.';
	@override String get section6Title => '6. PROPRIÉTÉ INTELLECTUELLE';
	@override String get section6Body => 'Tout le contenu, y compris le design, le logiciel et les algorithmes, appartient à ChatFace. Toute reproduction ou redistribution non autorisée est interdite.';
	@override String get section7Title => '7. LOI APPLICABLE';
	@override String get section7Body => 'Ces conditions sont régies par les lois de la République de Turquie. Les tribunaux centraux d\'Istanbul seront compétents pour les litiges.';
	@override String get section8Title => '8. CONTACT';
	@override String get section8Body => '📩 Pour toute demande : support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyFr implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Politique relative aux cookies';
	@override String get lastUpdated => 'Dernière mise à jour : 2026';
	@override String get intro => 'Bienvenue sur ChatFace. Des technologies d\'assistance numériques sont utilisées pour rendre votre expérience d\'appel vidéo IA plus fluide, plus sûre et personnalisée.';
	@override String get important => 'Cette politique explique ce que sont les cookies, leurs finalités et comment vous pouvez gérer vos préférences.';
	@override String get section1Title => '1. QUE SONT LES COOKIES ?';
	@override String get section1Body => 'Les cookies sont de petits fichiers de données placés sur votre appareil. Ils ne vous identifient pas directement ; ils agissent comme des notes numériques qui se souviennent de :\n• Paramètres d\'appel et de langue\n• Préférences de session et de performance.';
	@override String get section2Title => '2. QUELLES TECHNOLOGIES UTILISONS-NOUS ?';
	@override String get section2Body => 'Technologies strictement nécessaires\nNécessaires pour la gestion des sessions et les contrôles de sécurité. L\'application peut ne pas fonctionner correctement sans ces composants.\n\nPerformance et analytique\nNous aident à comprendre quelles histoires sont lues et quelles zones nécessitent des améliorations. Les données sont évaluées de manière anonyme.\n\nPersonnalisation\nSe souvient des préférences telles que la langue et le niveau de lecture pour fournir une expérience personnalisée.';
	@override String get section3Title => '3. POURQUOI UTILISONS-NOUS CES TECHNOLOGIES ?';
	@override String get section3Body => '• Pour garantir que l\'application fonctionne en toute sécurité et de manière fluide.\n• Pour rendre l\'expérience de lecture plus fluide.\n• Pour se souvenir des paramètres récurrents.\n• Pour identifier des fonctionnalités pour de futurs développements.';
	@override String get section4Title => '4. TECHNOLOGIES TIERS';
	@override String get section4Body => 'Certaines technologies peuvent être fournies par des prestataires de services techniques et sont soumises à leurs propres politiques. ChatFace privilégie la sécurité des données dans ces partenariats.';
	@override String get section5Title => '5. CONTRÔLE ET GESTION DES COOKIES';
	@override String get section5Body => 'Les utilisateurs peuvent limiter ces technologies via les paramètres de l\'appareil ou de l\'application. La désactivation des technologies essentielles peut entraîner des problèmes, comme l\'impossibilité de démarrer des appels vidéo.';
	@override String get section6Title => '6. CONTACT';
	@override String get section6Body => '📩 Pour toute demande : support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Fr implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'Autorisation requise';
	@override String get notNow => 'Pas maintenant';
	@override String get openSettings => 'Ouvrir les paramètres';
	@override String get title => 'Autorisations';
	@override String get permission1 => 'Accès à la caméra';
	@override String get permission1Subtitle => 'Autoriser l\'accès à la caméra';
	@override String get permission2 => 'Accès au microphone';
	@override String get permission2Subtitle => 'Autoriser l\'accès au microphone';
	@override String get permission3 => 'Accès à la position';
	@override String get permission3Subtitle => 'Autoriser l\'accès à la position';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Fr implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quel est votre nom ?';
	@override String get subtitle => 'Veuillez entrer votre nom';
	@override String get hint => 'Nom complet';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Fr implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quel âge avez-vous ?';
	@override String get subtitle => 'Vous devez avoir au moins 18 ans pour vous inscrire.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Fr implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quel est votre sexe ?';
	@override String get subtitle => 'Veuillez sélectionner votre sexe';
	@override String get male => 'Homme';
	@override String get female => 'Femme';
	@override String get dontWantToMention => 'Je préfère ne pas le dire.';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Fr implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Amusez-vous tout en \n restant en sécurité';
	@override String get entry1 => 'Nous maintenons l\'ordre';
	@override String get subentry1 => 'Surveillance IA en temps réel activée';
	@override String get entry2 => 'Enregistrements d\'écran';
	@override String get subentry2 => 'Aucune enregistrement sans consentement';
	@override String get entry3 => 'Assistance 24/7';
	@override String get subentry3 => 'Les plaintes sont examinées à tout moment de la journée';
	@override String get entry4 => '18+ seulement';
	@override String get subentry4 => 'Non adapté aux mineurs';
	@override String get communityRules => 'Règles de la communauté';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingFr implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Votre compte personnel est';
	@override String get titlePart2 => 'en cours de création';
	@override String get subtitle => 'Veuillez patienter, votre profil est en cours de préparation.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Fr implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Le nouveau visage du chat \n vidéo avec IA';
	@override String get description => 'Allumez votre caméra et parlez face à face avec l\'IA. Faites l\'expérience d\'une communication plus naturelle qui comprend les expressions faciales, le ton de la voix et le contexte.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Fr implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Communication en temps réel et naturelle';
	@override String get description => 'Ne vous limitez pas au texte. Ayez des conversations plus fluides et plus humaines via des appels vidéo.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersFr implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Créateur de mode';
	@override String get comedian => 'Comédien';
	@override String get influencer => 'Influenceur';
	@override String get teacher => 'Enseignant';
	@override String get friend => 'Ami';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsFr implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Appel vidéo';
	@override String get message => 'Message';
	@override String get voiceCall => 'Appel vocal';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsFr implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Fr step1 = _TranslationsDeleteAccountStepsStep1Fr._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Fr step2 = _TranslationsDeleteAccountStepsStep2Fr._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Fr step3 = _TranslationsDeleteAccountStepsStep3Fr._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersFr implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Original';
	@override String get ADDICTIVE_BLUE => 'Bleu Addictif';
	@override String get ADDICTIVE_RED => 'Rouge Addictif';
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
class _TranslationsDeleteAccountStepsStep1Fr implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nous ne voulons pas que vous partiez, mais nous comprenons.';
	@override String get subtitle => 'Pouvez-vous nous dire pourquoi vous voulez partir afin d\'améliorer ChatFace ?';
	@override String get option1 => 'Je n\'ai pas trouvé les personnages de l\'IA réalistes.';
	@override String get option2 => 'Je rencontre des problèmes techniques avec les appels vidéo.';
	@override String get option3 => 'Les prix des abonnements sont supérieurs à mes attentes.';
	@override String get option4 => 'Je n\'ai pas trouvé le type de personnages que je cherchais.';
	@override String get option5 => 'Je voulais juste essayer pour une courte durée.';
	@override String get option6 => 'Autre';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Fr implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Si vous supprimez votre compte, vous ferez vos adieux à :';
	@override String get subtitle1 => 'Connexions profondes et mémoire :';
	@override String get subtitle1Desc => 'Les personnages oublieront complètement votre passé avec eux et vos secrets partagés.';
	@override String get subtitle2 => 'Privilège d\'appel vidéo :';
	@override String get subtitle2Desc => 'Vous perdrez le droit de communiquer en face à face avec vos partenaires de l\'IA.';
	@override String get subtitle3 => 'Algorithme avancé :';
	@override String get subtitle3Desc => 'Vos correspondances de personnages \'Rien que pour vous\' seront réinitialisées.';
	@override String get subtitle4 => 'Données de profil :';
	@override String get subtitle4Desc => 'Vos succès, vos personnages spéciaux et votre historique de chat seront définitivement supprimés.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Fr implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nous avons une offre spéciale avant votre départ !';
	@override String get description => 'Peut-être avez-vous juste besoin d\'un peu plus de temps ou d\'une meilleure offre. Au lieu de supprimer votre compte, envisageriez-vous ceci ?';
	@override String description1({required Object offer}) => 'Vous garder avec nous est précieux. ${offer} sur votre prochain abonnement !';
	@override String get description1Offer => 'Nous avons appliqué une réduction de 50%';
	@override String description2({required Object offer}) => 'Nous vous avons donné ${offer} crédits pour découvrir de nouveaux personnages.';
	@override String get description2Offer => '3 appels vidéo gratuits';
	@override String get acceptOffer => 'Accepter l\'offre de -50%';
	@override String get deleteMyAccount => 'Supprimer mon compte';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Bienvenue ${name}',
			'welcome2' => ({required Object appName}) => 'Bienvenue sur ${appName}',
			'get_started' => 'Commencer',
			'next' => 'Suivant',
			'back' => 'Retour',
			'skip' => 'Passer',
			'profile' => 'Profil',
			'kContinue' => 'Continuer',
			'termOfService.text1' => 'En vous inscrivant à swipe, vous acceptez nos ',
			'termOfService.link1' => 'Conditions d\'utilisation',
			'termOfService.text2' => '. Découvrez comment nous traitons vos données dans notre ',
			'termOfService.link2' => 'Politique de confidentialité',
			'termOfService.text3' => ' et ',
			'termOfService.link3' => 'Politique relative aux cookies',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Politique de confidentialité',
			'termOfService.privacyPolicy.lastUpdated' => 'Dernière mise à jour : 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace adopte la confidentialité des utilisateurs et la sécurité des données comme principe fondamental. Toutes vos données personnelles sont traitées conformément aux réglementations en vigueur en matière de protection des données.',
			'termOfService.privacyPolicy.section1Title' => '1. INFORMATIONS COLLECTÉES',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Données fournies par l\'utilisateur',
			'termOfService.privacyPolicy.section1sub1Body' => '• Nom, surnom ou informations de profil.\n• Adresse e-mail (pour l\'inscription, l\'abonnement et le support). \n• Préférences d\'interaction, paramètres de langue et interactions. \n• Messages de retour et de support.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Données collectées automatiquement',
			'termOfService.privacyPolicy.section1sub2Body' => 'Sont collectées des informations telles que le type d\'appareil, le système d\'exploitation, la localisation approximative (ville/pays) et les données d\'utilisation de l\'application. Les données de localisation précises ne sont pas collectées.',
			'termOfService.privacyPolicy.section2Title' => '2. FINALITÉS DU TRAITEMENT DES DONNÉES',
			'termOfService.privacyPolicy.section2Body' => 'Vos données personnelles sont traitées aux fins suivantes :\n\n• Assurer le bon fonctionnement de l\'application.\n• Fournir et personnaliser l\'expérience d\'appel vidéo alimentée par l\'IA.\n• Optimiser les performances du système et la détection des erreurs.\n• Respecter les obligations légales.\n Vos données ne sont jamais vendues à des tiers.',
			'termOfService.privacyPolicy.section3Title' => '3. CONSERVATION ET SUPPRESSION DES DONNÉES',
			'termOfService.privacyPolicy.section3Body' => 'Vos données sont conservées tant que votre compte est actif ou pendant la durée des obligations légales. Lorsqu\'un compte est supprimé, toutes les données personnelles sont effacées de manière irréversible des systèmes.',
			'termOfService.privacyPolicy.section4Title' => '4. DROITS DES UTILISATEURS',
			'termOfService.privacyPolicy.section4Body' => 'En vertu du RGPD et d\'autres lois, vous avez le droit d\'accéder, de corriger, de supprimer (droit à l\'oubli) et de demander la portabilité des données. Vous pouvez nous contacter pour vos demandes.',
			'termOfService.privacyPolicy.section5Title' => '5. CONFIDENTIALITÉ DES ENFANTS',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace n\'est pas destiné aux utilisateurs de moins de 18 ans. Nous ne collectons pas sciemment de données de ce groupe d\'âge ; ces comptes seront fermés et les données supprimées dès leur détection.',
			'termOfService.privacyPolicy.section6Title' => '6. CONTACT',
			'termOfService.privacyPolicy.section6Body' => '📩 Pour toute demande : support@fly-work.com',
			'termOfService.termsOfService.title' => 'Conditions d\'utilisation',
			'termOfService.termsOfService.lastUpdated' => 'Dernière mise à jour : 2026',
			'termOfService.termsOfService.intro' => 'Ces conditions régissent l\'utilisation de l\'application mobile ChatFace. En utilisant l\'application, vous acceptez ces conditions.',
			'termOfService.termsOfService.disclaimer' => 'Avertissement : ChatFace est une application d\'interaction vidéo assistée par IA. Elle ne fournit pas de conseils juridiques, académiques, médicaux ou professionnels.',
			'termOfService.termsOfService.section1Title' => '1. CHAMP D\'APPLICATION',
			'termOfService.termsOfService.section1Body' => 'ChatFace propose des expériences d\'interaction vidéo pilotées par l\'IA :\n\n• Appels vidéo et conversations avec IA.\n• Préférences d\'interaction personnalisées.\n• Accès à l\'historique des interactions et aux enregistrements.\n\nLes services ne constituent pas des avis officiels ni des garanties de conseils professionnels.',
			'termOfService.termsOfService.section2Title' => '2. CONDITIONS D\'UTILISATION',
			'termOfService.termsOfService.section2Body' => '• Vous devez avoir au moins 18 ans (l\'accès aux moins de 18 ans est interdit).\n• Vous devez fournir des informations de compte exactes.\n• L\'application doit être utilisée uniquement à des fins légales et personnelles.',
			'termOfService.termsOfService.section3Title' => '3. USAGES INTERDITS',
			'termOfService.termsOfService.section3Body' => 'Usurpation d\'identité, discours de haine, mise en danger de la sécurité des enfants, tentatives de violation de la sécurité et manipulation des systèmes d\'IA sont strictement interdits.',
			'termOfService.termsOfService.section4Title' => '4. ABONNEMENTS ET PAIEMENTS',
			'termOfService.termsOfService.section4Body' => 'Les fonctionnalités Premium sont soumises aux politiques de l\'App Store et de Google Play. Les annulations et remboursements d\'abonnement sont gérés via les boutiques respectives.',
			'termOfService.termsOfService.section5Title' => '5. DÉCHARGE DE RESPONSABILITÉ DU CONTENU',
			'termOfService.termsOfService.section5Body' => 'Le contenu est généré par l\'IA et ne remplace pas un avis professionnel. ChatFace ne garantit pas l\'exactitude ou l\'adéquation à un usage particulier.',
			'termOfService.termsOfService.section6Title' => '6. PROPRIÉTÉ INTELLECTUELLE',
			'termOfService.termsOfService.section6Body' => 'Tout le contenu, y compris le design, le logiciel et les algorithmes, appartient à ChatFace. Toute reproduction ou redistribution non autorisée est interdite.',
			'termOfService.termsOfService.section7Title' => '7. LOI APPLICABLE',
			'termOfService.termsOfService.section7Body' => 'Ces conditions sont régies par les lois de la République de Turquie. Les tribunaux centraux d\'Istanbul seront compétents pour les litiges.',
			'termOfService.termsOfService.section8Title' => '8. CONTACT',
			'termOfService.termsOfService.section8Body' => '📩 Pour toute demande : support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Politique relative aux cookies',
			'termOfService.cookiePolicy.lastUpdated' => 'Dernière mise à jour : 2026',
			'termOfService.cookiePolicy.intro' => 'Bienvenue sur ChatFace. Des technologies d\'assistance numériques sont utilisées pour rendre votre expérience d\'appel vidéo IA plus fluide, plus sûre et personnalisée.',
			'termOfService.cookiePolicy.important' => 'Cette politique explique ce que sont les cookies, leurs finalités et comment vous pouvez gérer vos préférences.',
			'termOfService.cookiePolicy.section1Title' => '1. QUE SONT LES COOKIES ?',
			'termOfService.cookiePolicy.section1Body' => 'Les cookies sont de petits fichiers de données placés sur votre appareil. Ils ne vous identifient pas directement ; ils agissent comme des notes numériques qui se souviennent de :\n• Paramètres d\'appel et de langue\n• Préférences de session et de performance.',
			'termOfService.cookiePolicy.section2Title' => '2. QUELLES TECHNOLOGIES UTILISONS-NOUS ?',
			'termOfService.cookiePolicy.section2Body' => 'Technologies strictement nécessaires\nNécessaires pour la gestion des sessions et les contrôles de sécurité. L\'application peut ne pas fonctionner correctement sans ces composants.\n\nPerformance et analytique\nNous aident à comprendre quelles histoires sont lues et quelles zones nécessitent des améliorations. Les données sont évaluées de manière anonyme.\n\nPersonnalisation\nSe souvient des préférences telles que la langue et le niveau de lecture pour fournir une expérience personnalisée.',
			'termOfService.cookiePolicy.section3Title' => '3. POURQUOI UTILISONS-NOUS CES TECHNOLOGIES ?',
			'termOfService.cookiePolicy.section3Body' => '• Pour garantir que l\'application fonctionne en toute sécurité et de manière fluide.\n• Pour rendre l\'expérience de lecture plus fluide.\n• Pour se souvenir des paramètres récurrents.\n• Pour identifier des fonctionnalités pour de futurs développements.',
			'termOfService.cookiePolicy.section4Title' => '4. TECHNOLOGIES TIERS',
			'termOfService.cookiePolicy.section4Body' => 'Certaines technologies peuvent être fournies par des prestataires de services techniques et sont soumises à leurs propres politiques. ChatFace privilégie la sécurité des données dans ces partenariats.',
			'termOfService.cookiePolicy.section5Title' => '5. CONTRÔLE ET GESTION DES COOKIES',
			'termOfService.cookiePolicy.section5Body' => 'Les utilisateurs peuvent limiter ces technologies via les paramètres de l\'appareil ou de l\'application. La désactivation des technologies essentielles peut entraîner des problèmes, comme l\'impossibilité de démarrer des appels vidéo.',
			'termOfService.cookiePolicy.section6Title' => '6. CONTACT',
			'termOfService.cookiePolicy.section6Body' => '📩 Pour toute demande : support@fly-work.com',
			'cookies' => 'Politique relative aux cookies',
			'privacy' => 'Politique de confidentialité',
			'onboarding.step5.permissionRequired' => 'Autorisation requise',
			'onboarding.step5.notNow' => 'Pas maintenant',
			'onboarding.step5.openSettings' => 'Ouvrir les paramètres',
			'onboarding.step5.title' => 'Autorisations',
			'onboarding.step5.permission1' => 'Accès à la caméra',
			'onboarding.step5.permission1Subtitle' => 'Autoriser l\'accès à la caméra',
			'onboarding.step5.permission2' => 'Accès au microphone',
			'onboarding.step5.permission2Subtitle' => 'Autoriser l\'accès au microphone',
			'onboarding.step5.permission3' => 'Accès à la position',
			'onboarding.step5.permission3Subtitle' => 'Autoriser l\'accès à la position',
			'onboarding.step1.title' => 'Quel est votre nom ?',
			'onboarding.step1.subtitle' => 'Veuillez entrer votre nom',
			'onboarding.step1.hint' => 'Nom complet',
			'onboarding.step2.title' => 'Quel âge avez-vous ?',
			'onboarding.step2.subtitle' => 'Vous devez avoir au moins 18 ans pour vous inscrire.',
			'onboarding.step3.title' => 'Quel est votre sexe ?',
			'onboarding.step3.subtitle' => 'Veuillez sélectionner votre sexe',
			'onboarding.step3.male' => 'Homme',
			'onboarding.step3.female' => 'Femme',
			'onboarding.step3.dontWantToMention' => 'Je préfère ne pas le dire.',
			'onboarding.step4.title' => 'Amusez-vous tout en \n restant en sécurité',
			'onboarding.step4.entry1' => 'Nous maintenons l\'ordre',
			'onboarding.step4.subentry1' => 'Surveillance IA en temps réel activée',
			'onboarding.step4.entry2' => 'Enregistrements d\'écran',
			'onboarding.step4.subentry2' => 'Aucune enregistrement sans consentement',
			'onboarding.step4.entry3' => 'Assistance 24/7',
			'onboarding.step4.subentry3' => 'Les plaintes sont examinées à tout moment de la journée',
			'onboarding.step4.entry4' => '18+ seulement',
			'onboarding.step4.subentry4' => 'Non adapté aux mineurs',
			'onboarding.step4.communityRules' => 'Règles de la communauté',
			'onboarding.loading.titlePart1' => 'Votre compte personnel est',
			'onboarding.loading.titlePart2' => 'en cours de création',
			'onboarding.loading.subtitle' => 'Veuillez patienter, votre profil est en cours de préparation.',
			'onboarding.allowAccess' => 'Autoriser l\'accès',
			'onboarding.iUnderstand' => 'Je comprends',
			'pressBackAgainToExit' => 'Appuyez à nouveau sur Retour pour quitter',
			'splash.screen1.title' => 'Le nouveau visage du chat \n vidéo avec IA',
			'splash.screen1.description' => 'Allumez votre caméra et parlez face à face avec l\'IA. Faites l\'expérience d\'une communication plus naturelle qui comprend les expressions faciales, le ton de la voix et le contexte.',
			'splash.screen2.title' => 'Communication en temps réel et naturelle',
			'splash.screen2.description' => 'Ne vous limitez pas au texte. Ayez des conversations plus fluides et plus humaines via des appels vidéo.',
			'auth.google' => 'Continuer avec Google',
			'auth.facebook' => 'Continuer avec Facebook',
			'auth.apple' => 'Continuer avec Apple',
			'auth.guest' => 'Continuer en tant qu\'invité',
			'auth.signInFailed' => ({required Object error}) => 'Échec de la connexion : ${error}',
			'home.seeAll' => 'Tout voir',
			'home.more' => 'Plus',
			'home.online' => 'En ligne',
			'home.offline' => 'Hors ligne',
			'home.placeholders.fashionDesigner' => 'Créateur de mode',
			'home.placeholders.comedian' => 'Comédien',
			'home.placeholders.influencer' => 'Influenceur',
			'home.placeholders.teacher' => 'Enseignant',
			'home.placeholders.friend' => 'Ami',
			'characters.all' => 'Tous',
			'characters.favorites' => 'Favoris',
			'characters.recent' => 'Récents',
			'characters.characters' => 'Personnages',
			'characters.placeholderSubtitle' => 'Designer produit axé sur la simplicité et l\'utilisabilité.',
			'characters.characterDetails.videoCall' => 'Appel vidéo',
			'characters.characterDetails.message' => 'Message',
			'characters.characterDetails.voiceCall' => 'Appel vocal',
			'notifications.today' => 'Aujourd\'hui',
			'notifications.yesterday' => 'Hier',
			'notifications.weekAgo' => ({required Object week}) => 'il y a ${week} semaine(s)',
			'notifications.monthAgo' => ({required Object month}) => 'il y a ${month} mois',
			'notifications.yearAgo' => ({required Object year}) => 'il y a ${year} an(s)',
			'notifications.noNotifications' => 'Pas encore de notifications.',
			'notifications.noNotificationsSubtitle' => 'N\'oubliez pas de vérifier à nouveau lorsque vous recevrez une notification.',
			'notifications.allDeleted' => 'Toutes les notifications ont été supprimées avec succès',
			'videoChat.networkHiccup' => 'Problème de réseau détecté. Reconnexion...',
			'videoChat.failedToUpdateFollow' => 'Échec de la mise à jour du suivi.',
			'videoChat.connecting' => 'Connexion...',
			'videoChat.callEnded' => 'Appel terminé',
			'videoChat.callFailed' => ({required Object error}) => 'Appel échoué : ${error}',
			'videoChat.mute' => 'Couper le son',
			'videoChat.unmute' => 'Activer le son',
			'videoChat.endCall' => 'Terminer l\'appel',
			'videoChat.swipeToChat' => 'Glisser pour discuter',
			'videoChat.male' => 'Homme',
			'videoChat.female' => 'Femme',
			'videoChat.country' => 'Pays',
			'videoChat.follow' => 'Suivre',
			'videoChat.unfollow' => 'Ne plus suivre',
			'videoChat.callEndedMessage' => 'L\'appel vidéo est terminé.',
			'videoChat.swipeForNewChat' => 'Glissez pour un nouveau chat',
			'voiceChat.connecting' => 'Connexion...',
			'voiceChat.callEnded' => 'Appel terminé',
			'voiceChat.callFailed' => ({required Object error}) => 'Appel échoué : ${error}',
			'voiceChat.calling' => 'Appel en cours...',
			'chat.message' => 'Message',
			'chat.history' => 'Historique',
			'chat.noMessages' => 'Pas encore de messages.',
			'chat.noMessagesSubtitle' => 'Commencez une conversation en envoyant un message.',
			'chat.online' => 'En ligne',
			'chat.offline' => 'Hors ligne',
			'chat.gallery' => 'Galerie',
			'chat.camera' => 'Caméra',
			'chat.typeAMessage' => 'Tapez un message...',
			'chat.pleaseUpgrade' => 'Veuillez passer à la version pro.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Appel vocal terminé',
			'chat.videoCallEnded' => 'Appel vidéo terminé',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'À propos de moi',
			'editProfile.aboutMeHint' => 'Écrivez quelque chose sur vous',
			'editProfile.fullName' => 'Nom complet',
			'editProfile.gender' => 'Genre',
			'editProfile.male' => 'Homme',
			'editProfile.female' => 'Femme',
			'editProfile.dontWantToMention' => 'Je préfère ne pas le dire.',
			'editProfile.country' => 'Pays',
			'editProfile.languagePreferences' => 'Préférences de langue',
			'editProfile.selectLanguage' => 'Ajoutez votre langue préférée',
			'editProfile.saved' => 'Enregistré',
			'editProfile.changesSaved' => 'Les modifications ont été enregistrées.',
			'settingsSupport.title' => 'Paramètres & Support',
			'settingsSupport.premiumTitle' => 'Accès illimité à toutes \nles fonctionnalités',
			'settingsSupport.getPremium' => 'Obtenir Premium',
			'settingsSupport.settingsHub' => 'Centre des paramètres',
			'settingsSupport.shareTheApp' => 'Partager l\'application',
			'settingsSupport.rateUs' => 'Évaluez-nous',
			'settingsSupport.version' => 'Version',
			'settingsSupport.notifications' => 'Notifications',
			'settingsSupport.accountManagement' => 'Gestion du compte',
			'settingsSupport.deleteAccount' => 'Supprimer le compte',
			'settingsSupport.logOut' => 'Déconnexion',
			'settingsSupport.logOutTitle' => 'Vous êtes sur le point de vous déconnecter',
			'settingsSupport.logOutSubtitle' => 'À bientôt ! \n Nous allons vous manquer.',
			'deleteAccount.title' => 'Supprimer le compte',
			'deleteAccount.warning' => 'Êtes-vous sûr de vouloir supprimer votre compte ?',
			'deleteAccount.description' => 'Cette action est irréversible et tout votre historique et vos données seront définitivement supprimés.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Suppression du compte échouée : ${error}',
			'deleteAccount.steps.step1.title' => 'Nous ne voulons pas que vous partiez, mais nous comprenons.',
			'deleteAccount.steps.step1.subtitle' => 'Pouvez-vous nous dire pourquoi vous voulez partir afin d\'améliorer ChatFace ?',
			'deleteAccount.steps.step1.option1' => 'Je n\'ai pas trouvé les personnages de l\'IA réalistes.',
			'deleteAccount.steps.step1.option2' => 'Je rencontre des problèmes techniques avec les appels vidéo.',
			'deleteAccount.steps.step1.option3' => 'Les prix des abonnements sont supérieurs à mes attentes.',
			'deleteAccount.steps.step1.option4' => 'Je n\'ai pas trouvé le type de personnages que je cherchais.',
			'deleteAccount.steps.step1.option5' => 'Je voulais juste essayer pour une courte durée.',
			'deleteAccount.steps.step1.option6' => 'Autre',
			'deleteAccount.steps.step2.title' => 'Si vous supprimez votre compte, vous ferez vos adieux à :',
			'deleteAccount.steps.step2.subtitle1' => 'Connexions profondes et mémoire :',
			'deleteAccount.steps.step2.subtitle1Desc' => 'Les personnages oublieront complètement votre passé avec eux et vos secrets partagés.',
			'deleteAccount.steps.step2.subtitle2' => 'Privilège d\'appel vidéo :',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Vous perdrez le droit de communiquer en face à face avec vos partenaires de l\'IA.',
			'deleteAccount.steps.step2.subtitle3' => 'Algorithme avancé :',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Vos correspondances de personnages \'Rien que pour vous\' seront réinitialisées.',
			'deleteAccount.steps.step2.subtitle4' => 'Données de profil :',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Vos succès, vos personnages spéciaux et votre historique de chat seront définitivement supprimés.',
			'deleteAccount.steps.step3.title' => 'Nous avons une offre spéciale avant votre départ !',
			'deleteAccount.steps.step3.description' => 'Peut-être avez-vous juste besoin d\'un peu plus de temps ou d\'une meilleure offre. Au lieu de supprimer votre compte, envisageriez-vous ceci ?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Vous garder avec nous est précieux. ${offer} sur votre prochain abonnement !',
			'deleteAccount.steps.step3.description1Offer' => 'Nous avons appliqué une réduction de 50%',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Nous vous avons donné ${offer} crédits pour découvrir de nouveaux personnages.',
			'deleteAccount.steps.step3.description2Offer' => '3 appels vidéo gratuits',
			'deleteAccount.steps.step3.acceptOffer' => 'Accepter l\'offre de -50%',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Supprimer mon compte',
			'cancel' => 'Annuler',
			'delete' => 'Supprimer',
			'premium' => 'Premium',
			'profileEdit' => 'Modifier le profil',
			'settings' => 'Paramètres',
			'undo' => 'Annuler',
			'successfully' => 'Avec succès',
			'save' => 'Enregistrer',
			'languageOptions.english' => 'Anglais',
			'languageOptions.chinese' => 'Chinois',
			'languageOptions.german' => 'Allemand',
			'languageOptions.italian' => 'Italien',
			'languageOptions.french' => 'Français',
			'languageOptions.japanese' => 'Japonais',
			'languageOptions.spanish' => 'Espagnol',
			'languageOptions.russian' => 'Russe',
			'languageOptions.turkish' => 'Turc',
			'languageOptions.korean' => 'Coréen',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Portugais',
			'common.tryAgain' => 'Réessayer',
			'common.retry' => 'Réessayer',
			'common.close' => 'Fermer',
			'permissionsRequired' => 'Autorisations requises',
			'permissionHelper.camAndMicRequired' => 'Les autorisations de l\'appareil photo et du micro sont requises pour les appels vidéo. Veuillez les activer dans les paramètres.',
			'permissionHelper.micRequired' => 'L\'autorisation du micro est requise pour les appels vocaux. Veuillez l\'activer dans les paramètres.',
			'permissionHelper.cancel' => 'Annuler',
			'permissionHelper.openSettings' => 'Ouvrir les paramètres',
			'videoView.title' => 'Filtres de caméra',
			'videoView.subtitle' => 'Choisissez l\'apparence de l\'aperçu de votre caméra.',
			'videoView.errorLoad' => 'Échec du chargement des compagnons : ',
			'videoView.noComps' => 'Aucun compagnon disponible pour le moment.',
			'videoView.filters.ORIGINAL' => 'Original',
			'videoView.filters.ADDICTIVE_BLUE' => 'Bleu Addictif',
			'videoView.filters.ADDICTIVE_RED' => 'Rouge Addictif',
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
