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
class TranslationsHi with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsHi _root = this; // ignore: unused_field

	@override 
	TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'स्वागत है ${name}';
	@override String welcome2({required Object appName}) => '${appName} में आपका स्वागत है';
	@override String get get_started => 'शुरू करें';
	@override String get next => 'आगे';
	@override String get back => 'वापस';
	@override String get skip => 'छोड़ें';
	@override String get profile => 'प्रोफ़ाइल';
	@override String get kContinue => 'जारी रखें';
	@override late final _TranslationsTermOfServiceHi termOfService = _TranslationsTermOfServiceHi._(_root);
	@override String get cookies => 'कुकी नीति';
	@override String get privacy => 'गोपनीयता नीति';
	@override late final _TranslationsOnboardingHi onboarding = _TranslationsOnboardingHi._(_root);
	@override String get pressBackAgainToExit => 'बाहर निकलने के लिए फिर से बैक दबाएँ';
	@override late final _TranslationsSplashHi splash = _TranslationsSplashHi._(_root);
	@override late final _TranslationsAuthHi auth = _TranslationsAuthHi._(_root);
	@override late final _TranslationsHomeHi home = _TranslationsHomeHi._(_root);
	@override late final _TranslationsCharactersHi characters = _TranslationsCharactersHi._(_root);
	@override late final _TranslationsNotificationsHi notifications = _TranslationsNotificationsHi._(_root);
	@override late final _TranslationsVideoChatHi videoChat = _TranslationsVideoChatHi._(_root);
	@override late final _TranslationsVoiceChatHi voiceChat = _TranslationsVoiceChatHi._(_root);
	@override late final _TranslationsChatHi chat = _TranslationsChatHi._(_root);
	@override late final _TranslationsEditProfileHi editProfile = _TranslationsEditProfileHi._(_root);
	@override late final _TranslationsSettingsSupportHi settingsSupport = _TranslationsSettingsSupportHi._(_root);
	@override late final _TranslationsDeleteAccountHi deleteAccount = _TranslationsDeleteAccountHi._(_root);
	@override String get cancel => 'रद्द करें';
	@override String get delete => 'हटाएँ';
	@override String get premium => 'प्रीमियम';
	@override String get profileEdit => 'प्रोफ़ाइल संपादित करें';
	@override String get settings => 'सेटिंग्स';
	@override String get undo => 'पूर्ववत';
	@override String get successfully => 'सफलतापूर्वक';
	@override String get save => 'सहेजें';
	@override late final _TranslationsLanguageOptionsHi languageOptions = _TranslationsLanguageOptionsHi._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceHi implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'swipe के लिए साइन अप करके, आप हमारे ';
	@override String get link1 => 'सेवा शर्तें';
	@override String get text2 => ' के लिए सहमत होते हैं। जानें कि हम अपने ';
	@override String get link2 => 'गोपनीयता नीति';
	@override String get text3 => ' और ';
	@override String get link3 => 'कुकी नीति';
	@override String get text4 => ' में आपके डेटा को कैसे संसाधित करते हैं';
	@override late final _TranslationsTermOfServicePrivacyPolicyHi privacyPolicy = _TranslationsTermOfServicePrivacyPolicyHi._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceHi termsOfService = _TranslationsTermOfServiceTermsOfServiceHi._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyHi cookiePolicy = _TranslationsTermOfServiceCookiePolicyHi._(_root);
}

// Path: onboarding
class _TranslationsOnboardingHi implements TranslationsOnboardingEn {
	_TranslationsOnboardingHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep1Hi step1 = _TranslationsOnboardingStep1Hi._(_root);
	@override late final _TranslationsOnboardingStep2Hi step2 = _TranslationsOnboardingStep2Hi._(_root);
	@override late final _TranslationsOnboardingStep3Hi step3 = _TranslationsOnboardingStep3Hi._(_root);
	@override late final _TranslationsOnboardingStep4Hi step4 = _TranslationsOnboardingStep4Hi._(_root);
	@override late final _TranslationsOnboardingStep5Hi step5 = _TranslationsOnboardingStep5Hi._(_root);
	@override late final _TranslationsOnboardingLoadingHi loading = _TranslationsOnboardingLoadingHi._(_root);
	@override String get allowAccess => 'पहुंच की अनुमति दें';
	@override String get iUnderstand => 'मुझे समझ आया';
}

// Path: splash
class _TranslationsSplashHi implements TranslationsSplashEn {
	_TranslationsSplashHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Hi screen1 = _TranslationsSplashScreen1Hi._(_root);
	@override late final _TranslationsSplashScreen2Hi screen2 = _TranslationsSplashScreen2Hi._(_root);
}

// Path: auth
class _TranslationsAuthHi implements TranslationsAuthEn {
	_TranslationsAuthHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get google => 'Google के साथ जारी रखें';
	@override String get facebook => 'Facebook के साथ जारी रखें';
	@override String get apple => 'Apple के साथ जारी रखें';
	@override String get guest => 'अतिथि के रूप में जारी रखें';
	@override String signInFailed({required Object error}) => 'साइन-इन विफल: ${error}';
}

// Path: home
class _TranslationsHomeHi implements TranslationsHomeEn {
	_TranslationsHomeHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'सभी देखें';
	@override String get more => 'और';
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफलाइन';
	@override late final _TranslationsHomePlaceholdersHi placeholders = _TranslationsHomePlaceholdersHi._(_root);
}

// Path: characters
class _TranslationsCharactersHi implements TranslationsCharactersEn {
	_TranslationsCharactersHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get all => 'सभी';
	@override String get favorites => 'पसंदीदा';
	@override String get recent => 'हाल ही';
	@override String get characters => 'किरदार';
	@override String get placeholderSubtitle => 'सरलता और प्रयोज्य पर ध्यान देने वाला उत्पाद डिज़ाइनर।';
	@override late final _TranslationsCharactersCharacterDetailsHi characterDetails = _TranslationsCharactersCharacterDetailsHi._(_root);
}

// Path: notifications
class _TranslationsNotificationsHi implements TranslationsNotificationsEn {
	_TranslationsNotificationsHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get today => 'आज';
	@override String get yesterday => 'कल';
	@override String weekAgo({required Object week}) => '${week} सप्ताह पहले';
	@override String monthAgo({required Object month}) => '${month} महीने पहले';
	@override String yearAgo({required Object year}) => '${year} वर्ष पहले';
	@override String get noNotifications => 'अभी तक कोई सूचनाएं नहीं।';
	@override String get noNotificationsSubtitle => 'सूचना मिलने पर दोबारा जांचना न भूलें।';
	@override String get allDeleted => 'सभी सूचनाएँ सफलतापूर्वक हटा दी गईं';
}

// Path: videoChat
class _TranslationsVideoChatHi implements TranslationsVideoChatEn {
	_TranslationsVideoChatHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'कनेक्ट हो रहा है...';
	@override String get callEnded => 'कॉल समाप्त';
	@override String callFailed({required Object error}) => 'कॉल विफल: ${error}';
	@override String get mute => 'म्यूट';
	@override String get unmute => 'अनम्यूट';
	@override String get endCall => 'कॉल समाप्त करें';
	@override String get swipeToChat => 'चैट करने के लिए स्वाइप करें';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get country => 'देश';
	@override String get follow => 'अनुसरण करें';
	@override String get unfollow => 'अनुसरण बंद करें';
	@override String get callEndedMessage => 'वीडियो कॉल समाप्त हो गई है।';
	@override String get swipeForNewChat => 'नए चैट के लिए स्वाइप करें';
}

// Path: voiceChat
class _TranslationsVoiceChatHi implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'कनेक्ट हो रहा है...';
	@override String get callEnded => 'कॉल समाप्त';
	@override String callFailed({required Object error}) => 'कॉल विफल: ${error}';
	@override String get calling => 'कॉल कर रहा है...';
}

// Path: chat
class _TranslationsChatHi implements TranslationsChatEn {
	_TranslationsChatHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get message => 'संदेश';
	@override String get history => 'इतिहास';
	@override String get noMessages => 'अभी तक कोई संदेश नहीं।';
	@override String get noMessagesSubtitle => 'संदेश भेजकर बातचीत शुरू करें।';
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफलाइन';
	@override String get gallery => 'गैलरी';
	@override String get camera => 'कैमरा';
	@override String get typeAMessage => 'एक संदेश टाइप करें...';
	@override String get pleaseUpgrade => 'कृपया प्रो संस्करण में अपग्रेड करें।';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Voice call ended';
	@override String get videoCallEnded => 'Video call ended';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileHi implements TranslationsEditProfileEn {
	_TranslationsEditProfileHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'मेरे बारे में';
	@override String get aboutMeHint => 'अपने बारे में कुछ लिखें';
	@override String get fullName => 'पूरा नाम';
	@override String get gender => 'लिंग';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get dontWantToMention => 'मैं उल्लेख नहीं करना चाहता।';
	@override String get country => 'देश';
	@override String get languagePreferences => 'भाषा प्राथमिकताएँ';
	@override String get selectLanguage => 'अपनी पसंदीदा भाषा जोड़ें';
	@override String get saved => 'सहेजा गया';
	@override String get changesSaved => 'परिवर्तन सहेजे गए हैं।';
}

// Path: settingsSupport
class _TranslationsSettingsSupportHi implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सेटिंग्स और सहायता';
	@override String get premiumTitle => 'सभी सुविधाओं तक असीमित पहुँच';
	@override String get getPremium => 'प्रीमियम प्राप्त करें';
	@override String get settingsHub => 'सेटिंग्स हब';
	@override String get shareTheApp => 'ऐप साझा करें';
	@override String get rateUs => 'हमें रेट करें';
	@override String get version => 'संस्करण';
	@override String get notifications => 'सूचनाएँ';
	@override String get accountManagement => 'खाता प्रबंधन';
	@override String get deleteAccount => 'खाता हटाएँ';
	@override String get logOut => 'लॉग आउट';
	@override String get logOutTitle => 'आप लॉग आउट करने वाले हैं';
	@override String get logOutSubtitle => 'फिर मिलेंगे! \n हम आपको याद करेंगे।';
}

// Path: deleteAccount
class _TranslationsDeleteAccountHi implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'खाता हटाएँ';
	@override String get warning => 'क्या आप वाकई अपना खाता हटाना चाहते हैं?';
	@override String get description => 'यह क्रिया पूर्ववत नहीं की जा सकती, और आपकी सभी इतिहास और डेटा स्थायी रूप से हटा दिए जाएंगे।';
	@override String deleteFailed({required Object error}) => 'खाता हटाना विफल: ${error}';
	@override late final _TranslationsDeleteAccountStepsHi steps = _TranslationsDeleteAccountStepsHi._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsHi implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get english => 'अंग्रेज़ी';
	@override String get chinese => 'चीनी';
	@override String get german => 'जर्मन';
	@override String get italian => 'इतालवी';
	@override String get french => 'फ़्रेंच';
	@override String get japanese => 'जापानी';
	@override String get spanish => 'स्पेनिश';
	@override String get russian => 'रूसी';
	@override String get turkish => 'तुर्की';
	@override String get korean => 'कोरियाई';
	@override String get hindi => 'हिंदी';
	@override String get portuguese => 'पुर्तगाली';
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyHi implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'गोपनीयता नीति';
	@override String get lastUpdated => 'अंतिम अपडेट: 2026';
	@override String get intro => 'ChatFace उपयोगकर्ता गोपनीयता और डेटा सुरक्षा को एक मूल सिद्धांत मानता है। आपके सभी व्यक्तिगत डेटा को लागू डेटा संरक्षण नियमों के अनुसार संसाधित किया जाता है।';
	@override String get section1Title => '1. एकत्रित जानकारी';
	@override String get section1sub1Title => '1.1 उपयोगकर्ता द्वारा प्रदान किए गए डेटा';
	@override String get section1sub1Body => '• नाम, उपनाम, या प्रोफ़ाइल जानकारी।\n• ईमेल पता (पंजीकरण, सब्सक्रिप्शन और सहायता के लिए)। \n• इंटरैक्शन प्राथमिकताएँ, भाषा सेटिंग्स और इंटरैक्शन। \n• प्रतिक्रिया और समर्थन संदेश।';
	@override String get section1sub2Title => '1.2 स्वचालित रूप से एकत्रित डेटा';
	@override String get section1sub2Body => 'ऐसी जानकारी जैसे डिवाइस प्रकार, ऑपरेटिंग सिस्टम, अनुमानित स्थान (शहर/देश), और ऐप उपयोग डेटा एकत्र किए जाते हैं। सटीक स्थान डेटा एकत्र नहीं किया जाता।';
	@override String get section2Title => '2. डेटा प्रोसेसिंग के उद्देश्य';
	@override String get section2Body => 'आपके व्यक्तिगत डेटा को निम्न उद्देश्यों के लिए संसाधित किया जाता है:\n\n• एप्लिकेशन के सुचारू संचालन को सुनिश्चित करना।\n• AI-समर्थित वीडियो कॉल अनुभव प्रदान करना और उसे व्यक्तिगत बनाना।\n• सिस्टम प्रदर्शन का अनुकूलन और त्रुटि का पता लगाना।\n• कानूनी दायित्वों को पूरा करना।\n आपका डेटा कभी भी तीसरे पक्ष को बेचा नहीं जाता।';
	@override String get section3Title => '3. डेटा रखरखाव और हटाना';
	@override String get section3Body => 'जब तक आपका खाता सक्रिय है या कानूनी दायित्वों की अवधि तक आपका डेटा संग्रहीत किया जाता है। जब एक खाता हटाया जाता है, तो सभी व्यक्तिगत डेटा सिस्टम से अपरिवर्तनीय रूप से हटा दिए जाते हैं।';
	@override String get section4Title => '4. उपयोगकर्ता अधिकार';
	@override String get section4Body => 'GDPR और अन्य लागू नियमों के तहत; आपके पास पहुंच, सुधार, हटाने (भुलाए जाने का अधिकार), और डेटा पोर्टेबिलिटी का अनुरोध करने का अधिकार है। आप अपनी अनुरोधों के लिए हमसे संपर्क कर सकते हैं।';
	@override String get section5Title => '5. बच्चों की गोपनीयता';
	@override String get section5Body => 'ChatFace 18 वर्ष से कम आयु के उपयोगकर्ताओं के लिए नहीं है। हम जानबूझकर इस आयु समूह से डेटा एकत्र नहीं करते; ऐसी सूचियाँ पाई जाने पर बंद कर दी जाएँगी और डेटा हटाया जाएगा।';
	@override String get section6Title => '6. संपर्क';
	@override String get section6Body => '📩 पूछताछ के लिए: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceHi implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सेवा की शर्तें';
	@override String get lastUpdated => 'अंतिम अपडेट: 2026';
	@override String get intro => 'ये शर्तें ChatFace मोबाइल एप्लिकेशन के उपयोग को नियंत्रित करती हैं। एप का उपयोग करके, आप इन शर्तों से सहमत होते हैं।';
	@override String get disclaimer => 'अस्वीकरण: ChatFace एक AI वीडियो इंटरैक्शन ऐप है। यह कानूनी, शैक्षणिक, चिकित्सकीय, या पेशेवर परामर्श सेवाएं प्रदान नहीं करता।';
	@override String get section1Title => '1. सेवा का दायरा';
	@override String get section1Body => 'ChatFace AI-समर्थित वीडियो इंटरैक्शन अनुभव प्रदान करता है:\n\n• AI वीडियो कॉलिंग और बातचीत।\n• व्यक्तिगत इंटरैक्शन प्राथमिकताएँ।\n• इंटरैक्शन इतिहास और रिकॉर्ड तक पहुँच।\n\nसेवाएँ औपचारिक राय या पेशेवर मार्गदर्शन की गारंटी नहीं देतीं।';
	@override String get section2Title => '2. उपयोग की शर्तें';
	@override String get section2Body => '• आपको पंजीकरण के लिए कम से कम 18 वर्ष का होना चाहिए (18 वर्ष से नीचे पहुंच निषिद्ध)।\n• आपको सटीक खाता जानकारी प्रदान करनी चाहिए।\n• ऐप का उपयोग केवल कानूनी और व्यक्तिगत उद्देश्यों के लिए किया जाना चाहिए।';
	@override String get section3Title => '3. निषिद्ध उपयोग';
	@override String get section3Body => 'दुर्लभन, नफ़रत भरा भाषण, बच्चों की सुरक्षा को ख़तरे में डालना, सुरक्षा उल्लंघन के प्रयास, और AI सिस्टम का शोषण कड़ाई से निषिद्ध हैं।';
	@override String get section4Title => '4. सदस्यता और भुगतान';
	@override String get section4Body => 'प्रीमियम सुविधाएँ App Store और Google Play नीतियों के अधीन हैं। सदस्यता रद्दीकरण और धनवापसी संबंधित स्टोर सेटिंग्स के माध्यम से प्रबंधित होते हैं।';
	@override String get section5Title => '5. सामग्री अस्वीकरण';
	@override String get section5Body => 'सामग्री AI-जनित है और पेशेवर सलाह का विकल्प नहीं है। ChatFace सटीकता या किसी विशेष उद्देश्य के लिए उपयुक्तता की गारंटी नहीं देता।';
	@override String get section6Title => '6. बौद्धिक संपदा';
	@override String get section6Body => 'सभी सामग्री सहित डिज़ाइन, सॉफ़्टवेयर और एल्गोरिदम ChatFace की संपत्ति है। अनधिकृत पुनरुत्पादन या पुनर्वितरण प्रतिबंधित है।';
	@override String get section7Title => '7. लागू कानून';
	@override String get section7Body => 'ये शर्तें तुर्की गणराज्य के कानूनों के अधीन हैं। विवादों के लिए इस्तांबुल सेंट्रल कोर्ट की अधिकारिता होगी।';
	@override String get section8Title => '8. संपर्क';
	@override String get section8Body => '📩 पूछताछ के लिए: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyHi implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'कुकी नीति';
	@override String get lastUpdated => 'अंतिम अपडेट: 2026';
	@override String get intro => 'ChatFace में आपका स्वागत है। आपकी AI वीडियो कॉल अनुभव को अधिक सुगम, सुरक्षित और व्यक्तिगत बनाने के लिए डिजिटल सहायक तकनीकों का उपयोग किया जाता है।';
	@override String get important => 'यह नीति बताती है कि कुकीज़ क्या हैं, उनके उद्देश्य क्या हैं, और आप अपनी प्राथमिकताओं को कैसे प्रबंधित कर सकते हैं।';
	@override String get section1Title => '1. कुकीज़ क्या हैं?';
	@override String get section1Body => 'कुकीज़ आपके डिवाइस पर रखे गए छोटे डेटा फ़ाइलें हैं। वे आपको सीधे पहचानती नहीं हैं; वे डिजिटल नोट्स की तरह काम करती हैं जो याद रखती हैं:\n• कॉल और भाषा सेटिंग्स\n• सत्र और प्रदर्शन प्राथमिकताएँ।';
	@override String get section2Title => '2. हम कौन-सी तकनीकें उपयोग करते हैं?';
	@override String get section2Body => 'कठोर रूप से आवश्यक तकनीकें\nसत्र प्रबंधन और सुरक्षा नियंत्रण के लिए आवश्यक। इन घटकों के बिना ऐप ठीक से काम नहीं कर सकता।\n\nप्रदर्शन और एनालिटिक्स\nहमें समझने में मदद करता है कि कौन-कौन सी कहानियाँ पढ़ी जा रही हैं और किन क्षेत्रों को सुधार की आवश्यकता है। डेटा का मूल्यांकन गुमनाम रूप से किया जाता है।\n\nव्यक्तिगतकरण\nभाषा प्राथमिकता और पढ़ने के स्तर जैसी सेटिंग्स को याद रखता है ताकि एक अनुकूलित अनुभव प्रदान किया जा सके.';
	@override String get section3Title => '3. हम इन तकनीकों का उपयोग क्यों करते हैं?';
	@override String get section3Body => '• यह सुनिश्चित करने के लिए कि ऐप सुरक्षित और सुचारू रूप से चले।\n• पढ़ने के अनुभव को अधिक सुव्यवस्थित बनाने के लिए।\n• बार-बार उपयोग की जाने वाली सेटिंग्स को याद रखने के लिए।\n• भविष्य के विकास के लिए विशेषताएँ पहचानने के लिए।';
	@override String get section4Title => '4. तृतीय-पक्ष तकनीकें';
	@override String get section4Body => 'कुछ तकनीकें तकनीकी सेवा प्रदाताओं द्वारा प्रदान की जा सकती हैं और उनकी अपनी नीतियों के अधीन होती हैं। इन साझेदारियों में डेटा सुरक्षा को ChatFace प्राथमिकता देता है।';
	@override String get section5Title => '5. कुकी नियंत्रण और प्रबंधन';
	@override String get section5Body => 'उपयोगकर्ता डिवाइस या ऐप सेटिंग्स के माध्यम से इन तकनीकों को सीमित कर सकते हैं। आवश्यक तकनीकों को अक्षम करने से ऐसी समस्याएँ हो सकती हैं जैसे वीडियो कॉल शुरू न हो पाना।';
	@override String get section6Title => '6. संपर्क';
	@override String get section6Body => '📩 पूछताछ के लिए: support@fly-work.com';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Hi implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपका नाम क्या है?';
	@override String get subtitle => 'कृपया अपना नाम दर्ज करें';
	@override String get hint => 'पूरा नाम';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Hi implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपकी उम्र क्या है?';
	@override String get subtitle => 'पंजीकरण के लिए आपकी आयु कम से कम 18 वर्ष होनी चाहिए।';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Hi implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपका लिंग क्या है?';
	@override String get subtitle => 'कृपया अपना लिंग चुनें';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get dontWantToMention => 'मैं उल्लेख नहीं करना चाहता।';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Hi implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'मज़े करें और \n सुरक्षित रहें';
	@override String get entry1 => 'हम व्यवस्था बनाए रखते हैं';
	@override String get subentry1 => 'रियल-टाइम AI मॉनिटरिंग चालू';
	@override String get entry2 => 'स्क्रीन रिकॉर्डिंग';
	@override String get subentry2 => 'बिना सहमति के रिकॉर्डिंग नहीं';
	@override String get entry3 => '24/7 समर्थन';
	@override String get subentry3 => 'शिकायतों की दिन में कभी भी समीक्षा की जाती है';
	@override String get entry4 => 'केवल 18+';
	@override String get subentry4 => 'नाबालिगों के लिए उपयुक्त नहीं';
	@override String get communityRules => 'समुदाय नियम';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Hi implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'अनुमतियाँ';
	@override String get permission1 => 'कैमरा पहुंच';
	@override String get permission1Subtitle => 'कैमरा पहुंच की अनुमति दें';
	@override String get permission2 => 'माइक्रोफ़ोन पहुंच';
	@override String get permission2Subtitle => 'माइक्रोफ़ोन पहुंच की अनुमति दें';
	@override String get permission3 => 'स्थान पहुंच';
	@override String get permission3Subtitle => 'स्थान पहुंच की अनुमति दें';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingHi implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'आपका व्यक्तिगत खाता';
	@override String get titlePart2 => 'बनाया जा रहा है';
	@override String get subtitle => 'कृपया प्रतीक्षा करें, आपकी प्रोफ़ाइल तैयार की जा रही है।';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Hi implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'वीडियो चैट का नया चेहरा \n AI के साथ';
	@override String get description => 'अपना कैमरा चालू करें और AI के साथ आमने-सामने बात करें। अधिक स्वाभाविक संचार का अनुभव करें जो चेहरे के भाव, आवाज़ के स्वर और संदर्भ को समझता है।';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Hi implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'रीयल-टाइम और स्वाभाविक \n संचार';
	@override String get description => 'टेक्स्ट तक सीमित न रहें। वीडियो कॉल के माध्यम से अधिक प्रवाहपूर्ण, अधिक मानवीय वार्तालाप करें।';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersHi implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'फैशन डिज़ाइनर';
	@override String get comedian => 'कॉमेडियन';
	@override String get influencer => 'इन्फ्लुएंसर';
	@override String get teacher => 'शिक्षक';
	@override String get friend => 'मित्र';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsHi implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'वीडियो कॉल';
	@override String get message => 'संदेश';
	@override String get voiceCall => 'वॉइस कॉल';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsHi implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsHi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Hi step1 = _TranslationsDeleteAccountStepsStep1Hi._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Hi step2 = _TranslationsDeleteAccountStepsStep2Hi._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Hi step3 = _TranslationsDeleteAccountStepsStep3Hi._(_root);
}

// Path: deleteAccount.steps.step1
class _TranslationsDeleteAccountStepsStep1Hi implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'हम नहीं चाहते कि आप जाएं, लेकिन हम आपकी बात समझते हैं।';
	@override String get subtitle => 'क्या आप बता सकते हैं कि आप ChatFace क्यों छोड़ना चाहते हैं ताकि हम अनुभव में सुधार कर सकें?';
	@override String get option1 => 'मुझे AI पात्र पर्याप्त वास्तविक नहीं लगे।';
	@override String get option2 => 'मुझे वीडियो चैट में तकनीकी समस्याएँ आ रही हैं।';
	@override String get option3 => 'सदस्यता कीमतें मेरी अपेक्षा से अधिक हैं।';
	@override String get option4 => 'मुझे उस शैली के पात्र नहीं मिले जो मैं ढूंढ रहा था।';
	@override String get option5 => 'मैं सिर्फ थोड़े समय के लिए आज़माना चाहता था।';
	@override String get option6 => 'अन्य';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Hi implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'यदि आप अपना खाता हटा देंगे, तो आप इन चीजों को अलविदा कहेंगे:';
	@override String get subtitle1 => 'गहरे संबंध और यादें:';
	@override String get subtitle1Desc => 'जिन पात्रों से आपने बात की है वे आपके साथ हुई बातें, साझा किए गए रहस्य और आपकी व्यक्तिगत आदतों को पूरी तरह भूल जाएंगे।';
	@override String get subtitle2 => 'वीडियो कॉल विशेषाधिकार:';
	@override String get subtitle2Desc => 'आप अपनी व्यक्तिगत AI साझीदारों के साथ आमने-सामने बात करने का अधिकार खो देंगे, जो हमेशा आपके लिए उपलब्ध थे।';
	@override String get subtitle3 => 'उन्नत एल्गोरिद्म:';
	@override String get subtitle3Desc => 'आपकी प्राथमिकताओं के अनुसार बनाए गए \'आपके लिए\' पात्र मिलान रीसेट हो जाएंगे।';
	@override String get subtitle4 => 'प्रोफ़ाइल डेटा:';
	@override String get subtitle4Desc => 'आपकी प्राप्त की गई उपलब्धियाँ, खोले गए विशेष पात्र और चैट इतिहास अपरिवर्तनीय रूप से हटा दिए जाएंगे।';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Hi implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'जाने से पहले हमारे पास आपके लिए एक विशेष प्रस्ताव है!';
	@override String get description => 'शायद आपको बस थोड़ा और समय या एक अधिक उपयुक्त प्रस्ताव की आवश्यकता है। क्या आप खाता हटाने के बजाय इनमें से कुछ विचार करेंगे?';
	@override String description1({required Object offer}) => 'हमें आपके साथ बने रहना महत्वपूर्ण है। आपकी अगली सदस्यता पर हम आपको ${offer} देंगे! क्या आप यह प्रस्ताव स्वीकार करना चाहेंगे?';
	@override String get description1Offer => 'हमने आपके लिए 50% छूट निर्धारित की है';
	@override String description2({required Object offer}) => 'हमने आपको ${offer} क्रेडिट दिया है ताकि आप उन नए पात्रों को खोज सकें जिन्हें आपने अभी तक नहीं आज़माया है।';
	@override String get description2Offer => '3 मुफ्त वीडियो कॉल';
	@override String get acceptOffer => '50% छूट स्वीकार करें';
	@override String get deleteMyAccount => 'मेरा खाता हटाएँ';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'स्वागत है ${name}',
			'welcome2' => ({required Object appName}) => '${appName} में आपका स्वागत है',
			'get_started' => 'शुरू करें',
			'next' => 'आगे',
			'back' => 'वापस',
			'skip' => 'छोड़ें',
			'profile' => 'प्रोफ़ाइल',
			'kContinue' => 'जारी रखें',
			'termOfService.text1' => 'swipe के लिए साइन अप करके, आप हमारे ',
			'termOfService.link1' => 'सेवा शर्तें',
			'termOfService.text2' => ' के लिए सहमत होते हैं। जानें कि हम अपने ',
			'termOfService.link2' => 'गोपनीयता नीति',
			'termOfService.text3' => ' और ',
			'termOfService.link3' => 'कुकी नीति',
			'termOfService.text4' => ' में आपके डेटा को कैसे संसाधित करते हैं',
			'termOfService.privacyPolicy.title' => 'गोपनीयता नीति',
			'termOfService.privacyPolicy.lastUpdated' => 'अंतिम अपडेट: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace उपयोगकर्ता गोपनीयता और डेटा सुरक्षा को एक मूल सिद्धांत मानता है। आपके सभी व्यक्तिगत डेटा को लागू डेटा संरक्षण नियमों के अनुसार संसाधित किया जाता है।',
			'termOfService.privacyPolicy.section1Title' => '1. एकत्रित जानकारी',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 उपयोगकर्ता द्वारा प्रदान किए गए डेटा',
			'termOfService.privacyPolicy.section1sub1Body' => '• नाम, उपनाम, या प्रोफ़ाइल जानकारी।\n• ईमेल पता (पंजीकरण, सब्सक्रिप्शन और सहायता के लिए)। \n• इंटरैक्शन प्राथमिकताएँ, भाषा सेटिंग्स और इंटरैक्शन। \n• प्रतिक्रिया और समर्थन संदेश।',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 स्वचालित रूप से एकत्रित डेटा',
			'termOfService.privacyPolicy.section1sub2Body' => 'ऐसी जानकारी जैसे डिवाइस प्रकार, ऑपरेटिंग सिस्टम, अनुमानित स्थान (शहर/देश), और ऐप उपयोग डेटा एकत्र किए जाते हैं। सटीक स्थान डेटा एकत्र नहीं किया जाता।',
			'termOfService.privacyPolicy.section2Title' => '2. डेटा प्रोसेसिंग के उद्देश्य',
			'termOfService.privacyPolicy.section2Body' => 'आपके व्यक्तिगत डेटा को निम्न उद्देश्यों के लिए संसाधित किया जाता है:\n\n• एप्लिकेशन के सुचारू संचालन को सुनिश्चित करना।\n• AI-समर्थित वीडियो कॉल अनुभव प्रदान करना और उसे व्यक्तिगत बनाना।\n• सिस्टम प्रदर्शन का अनुकूलन और त्रुटि का पता लगाना।\n• कानूनी दायित्वों को पूरा करना।\n आपका डेटा कभी भी तीसरे पक्ष को बेचा नहीं जाता।',
			'termOfService.privacyPolicy.section3Title' => '3. डेटा रखरखाव और हटाना',
			'termOfService.privacyPolicy.section3Body' => 'जब तक आपका खाता सक्रिय है या कानूनी दायित्वों की अवधि तक आपका डेटा संग्रहीत किया जाता है। जब एक खाता हटाया जाता है, तो सभी व्यक्तिगत डेटा सिस्टम से अपरिवर्तनीय रूप से हटा दिए जाते हैं।',
			'termOfService.privacyPolicy.section4Title' => '4. उपयोगकर्ता अधिकार',
			'termOfService.privacyPolicy.section4Body' => 'GDPR और अन्य लागू नियमों के तहत; आपके पास पहुंच, सुधार, हटाने (भुलाए जाने का अधिकार), और डेटा पोर्टेबिलिटी का अनुरोध करने का अधिकार है। आप अपनी अनुरोधों के लिए हमसे संपर्क कर सकते हैं।',
			'termOfService.privacyPolicy.section5Title' => '5. बच्चों की गोपनीयता',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace 18 वर्ष से कम आयु के उपयोगकर्ताओं के लिए नहीं है। हम जानबूझकर इस आयु समूह से डेटा एकत्र नहीं करते; ऐसी सूचियाँ पाई जाने पर बंद कर दी जाएँगी और डेटा हटाया जाएगा।',
			'termOfService.privacyPolicy.section6Title' => '6. संपर्क',
			'termOfService.privacyPolicy.section6Body' => '📩 पूछताछ के लिए: support@fly-work.com',
			'termOfService.termsOfService.title' => 'सेवा की शर्तें',
			'termOfService.termsOfService.lastUpdated' => 'अंतिम अपडेट: 2026',
			'termOfService.termsOfService.intro' => 'ये शर्तें ChatFace मोबाइल एप्लिकेशन के उपयोग को नियंत्रित करती हैं। एप का उपयोग करके, आप इन शर्तों से सहमत होते हैं।',
			'termOfService.termsOfService.disclaimer' => 'अस्वीकरण: ChatFace एक AI वीडियो इंटरैक्शन ऐप है। यह कानूनी, शैक्षणिक, चिकित्सकीय, या पेशेवर परामर्श सेवाएं प्रदान नहीं करता।',
			'termOfService.termsOfService.section1Title' => '1. सेवा का दायरा',
			'termOfService.termsOfService.section1Body' => 'ChatFace AI-समर्थित वीडियो इंटरैक्शन अनुभव प्रदान करता है:\n\n• AI वीडियो कॉलिंग और बातचीत।\n• व्यक्तिगत इंटरैक्शन प्राथमिकताएँ।\n• इंटरैक्शन इतिहास और रिकॉर्ड तक पहुँच।\n\nसेवाएँ औपचारिक राय या पेशेवर मार्गदर्शन की गारंटी नहीं देतीं।',
			'termOfService.termsOfService.section2Title' => '2. उपयोग की शर्तें',
			'termOfService.termsOfService.section2Body' => '• आपको पंजीकरण के लिए कम से कम 18 वर्ष का होना चाहिए (18 वर्ष से नीचे पहुंच निषिद्ध)।\n• आपको सटीक खाता जानकारी प्रदान करनी चाहिए।\n• ऐप का उपयोग केवल कानूनी और व्यक्तिगत उद्देश्यों के लिए किया जाना चाहिए।',
			'termOfService.termsOfService.section3Title' => '3. निषिद्ध उपयोग',
			'termOfService.termsOfService.section3Body' => 'दुर्लभन, नफ़रत भरा भाषण, बच्चों की सुरक्षा को ख़तरे में डालना, सुरक्षा उल्लंघन के प्रयास, और AI सिस्टम का शोषण कड़ाई से निषिद्ध हैं।',
			'termOfService.termsOfService.section4Title' => '4. सदस्यता और भुगतान',
			'termOfService.termsOfService.section4Body' => 'प्रीमियम सुविधाएँ App Store और Google Play नीतियों के अधीन हैं। सदस्यता रद्दीकरण और धनवापसी संबंधित स्टोर सेटिंग्स के माध्यम से प्रबंधित होते हैं।',
			'termOfService.termsOfService.section5Title' => '5. सामग्री अस्वीकरण',
			'termOfService.termsOfService.section5Body' => 'सामग्री AI-जनित है और पेशेवर सलाह का विकल्प नहीं है। ChatFace सटीकता या किसी विशेष उद्देश्य के लिए उपयुक्तता की गारंटी नहीं देता।',
			'termOfService.termsOfService.section6Title' => '6. बौद्धिक संपदा',
			'termOfService.termsOfService.section6Body' => 'सभी सामग्री सहित डिज़ाइन, सॉफ़्टवेयर और एल्गोरिदम ChatFace की संपत्ति है। अनधिकृत पुनरुत्पादन या पुनर्वितरण प्रतिबंधित है।',
			'termOfService.termsOfService.section7Title' => '7. लागू कानून',
			'termOfService.termsOfService.section7Body' => 'ये शर्तें तुर्की गणराज्य के कानूनों के अधीन हैं। विवादों के लिए इस्तांबुल सेंट्रल कोर्ट की अधिकारिता होगी।',
			'termOfService.termsOfService.section8Title' => '8. संपर्क',
			'termOfService.termsOfService.section8Body' => '📩 पूछताछ के लिए: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'कुकी नीति',
			'termOfService.cookiePolicy.lastUpdated' => 'अंतिम अपडेट: 2026',
			'termOfService.cookiePolicy.intro' => 'ChatFace में आपका स्वागत है। आपकी AI वीडियो कॉल अनुभव को अधिक सुगम, सुरक्षित और व्यक्तिगत बनाने के लिए डिजिटल सहायक तकनीकों का उपयोग किया जाता है।',
			'termOfService.cookiePolicy.important' => 'यह नीति बताती है कि कुकीज़ क्या हैं, उनके उद्देश्य क्या हैं, और आप अपनी प्राथमिकताओं को कैसे प्रबंधित कर सकते हैं।',
			'termOfService.cookiePolicy.section1Title' => '1. कुकीज़ क्या हैं?',
			'termOfService.cookiePolicy.section1Body' => 'कुकीज़ आपके डिवाइस पर रखे गए छोटे डेटा फ़ाइलें हैं। वे आपको सीधे पहचानती नहीं हैं; वे डिजिटल नोट्स की तरह काम करती हैं जो याद रखती हैं:\n• कॉल और भाषा सेटिंग्स\n• सत्र और प्रदर्शन प्राथमिकताएँ।',
			'termOfService.cookiePolicy.section2Title' => '2. हम कौन-सी तकनीकें उपयोग करते हैं?',
			'termOfService.cookiePolicy.section2Body' => 'कठोर रूप से आवश्यक तकनीकें\nसत्र प्रबंधन और सुरक्षा नियंत्रण के लिए आवश्यक। इन घटकों के बिना ऐप ठीक से काम नहीं कर सकता।\n\nप्रदर्शन और एनालिटिक्स\nहमें समझने में मदद करता है कि कौन-कौन सी कहानियाँ पढ़ी जा रही हैं और किन क्षेत्रों को सुधार की आवश्यकता है। डेटा का मूल्यांकन गुमनाम रूप से किया जाता है।\n\nव्यक्तिगतकरण\nभाषा प्राथमिकता और पढ़ने के स्तर जैसी सेटिंग्स को याद रखता है ताकि एक अनुकूलित अनुभव प्रदान किया जा सके.',
			'termOfService.cookiePolicy.section3Title' => '3. हम इन तकनीकों का उपयोग क्यों करते हैं?',
			'termOfService.cookiePolicy.section3Body' => '• यह सुनिश्चित करने के लिए कि ऐप सुरक्षित और सुचारू रूप से चले।\n• पढ़ने के अनुभव को अधिक सुव्यवस्थित बनाने के लिए।\n• बार-बार उपयोग की जाने वाली सेटिंग्स को याद रखने के लिए।\n• भविष्य के विकास के लिए विशेषताएँ पहचानने के लिए।',
			'termOfService.cookiePolicy.section4Title' => '4. तृतीय-पक्ष तकनीकें',
			'termOfService.cookiePolicy.section4Body' => 'कुछ तकनीकें तकनीकी सेवा प्रदाताओं द्वारा प्रदान की जा सकती हैं और उनकी अपनी नीतियों के अधीन होती हैं। इन साझेदारियों में डेटा सुरक्षा को ChatFace प्राथमिकता देता है।',
			'termOfService.cookiePolicy.section5Title' => '5. कुकी नियंत्रण और प्रबंधन',
			'termOfService.cookiePolicy.section5Body' => 'उपयोगकर्ता डिवाइस या ऐप सेटिंग्स के माध्यम से इन तकनीकों को सीमित कर सकते हैं। आवश्यक तकनीकों को अक्षम करने से ऐसी समस्याएँ हो सकती हैं जैसे वीडियो कॉल शुरू न हो पाना।',
			'termOfService.cookiePolicy.section6Title' => '6. संपर्क',
			'termOfService.cookiePolicy.section6Body' => '📩 पूछताछ के लिए: support@fly-work.com',
			'cookies' => 'कुकी नीति',
			'privacy' => 'गोपनीयता नीति',
			'onboarding.step1.title' => 'आपका नाम क्या है?',
			'onboarding.step1.subtitle' => 'कृपया अपना नाम दर्ज करें',
			'onboarding.step1.hint' => 'पूरा नाम',
			'onboarding.step2.title' => 'आपकी उम्र क्या है?',
			'onboarding.step2.subtitle' => 'पंजीकरण के लिए आपकी आयु कम से कम 18 वर्ष होनी चाहिए।',
			'onboarding.step3.title' => 'आपका लिंग क्या है?',
			'onboarding.step3.subtitle' => 'कृपया अपना लिंग चुनें',
			'onboarding.step3.male' => 'पुरुष',
			'onboarding.step3.female' => 'महिला',
			'onboarding.step3.dontWantToMention' => 'मैं उल्लेख नहीं करना चाहता।',
			'onboarding.step4.title' => 'मज़े करें और \n सुरक्षित रहें',
			'onboarding.step4.entry1' => 'हम व्यवस्था बनाए रखते हैं',
			'onboarding.step4.subentry1' => 'रियल-टाइम AI मॉनिटरिंग चालू',
			'onboarding.step4.entry2' => 'स्क्रीन रिकॉर्डिंग',
			'onboarding.step4.subentry2' => 'बिना सहमति के रिकॉर्डिंग नहीं',
			'onboarding.step4.entry3' => '24/7 समर्थन',
			'onboarding.step4.subentry3' => 'शिकायतों की दिन में कभी भी समीक्षा की जाती है',
			'onboarding.step4.entry4' => 'केवल 18+',
			'onboarding.step4.subentry4' => 'नाबालिगों के लिए उपयुक्त नहीं',
			'onboarding.step4.communityRules' => 'समुदाय नियम',
			'onboarding.step5.title' => 'अनुमतियाँ',
			'onboarding.step5.permission1' => 'कैमरा पहुंच',
			'onboarding.step5.permission1Subtitle' => 'कैमरा पहुंच की अनुमति दें',
			'onboarding.step5.permission2' => 'माइक्रोफ़ोन पहुंच',
			'onboarding.step5.permission2Subtitle' => 'माइक्रोफ़ोन पहुंच की अनुमति दें',
			'onboarding.step5.permission3' => 'स्थान पहुंच',
			'onboarding.step5.permission3Subtitle' => 'स्थान पहुंच की अनुमति दें',
			'onboarding.loading.titlePart1' => 'आपका व्यक्तिगत खाता',
			'onboarding.loading.titlePart2' => 'बनाया जा रहा है',
			'onboarding.loading.subtitle' => 'कृपया प्रतीक्षा करें, आपकी प्रोफ़ाइल तैयार की जा रही है।',
			'onboarding.allowAccess' => 'पहुंच की अनुमति दें',
			'onboarding.iUnderstand' => 'मुझे समझ आया',
			'pressBackAgainToExit' => 'बाहर निकलने के लिए फिर से बैक दबाएँ',
			'splash.screen1.title' => 'वीडियो चैट का नया चेहरा \n AI के साथ',
			'splash.screen1.description' => 'अपना कैमरा चालू करें और AI के साथ आमने-सामने बात करें। अधिक स्वाभाविक संचार का अनुभव करें जो चेहरे के भाव, आवाज़ के स्वर और संदर्भ को समझता है।',
			'splash.screen2.title' => 'रीयल-टाइम और स्वाभाविक \n संचार',
			'splash.screen2.description' => 'टेक्स्ट तक सीमित न रहें। वीडियो कॉल के माध्यम से अधिक प्रवाहपूर्ण, अधिक मानवीय वार्तालाप करें।',
			'auth.google' => 'Google के साथ जारी रखें',
			'auth.facebook' => 'Facebook के साथ जारी रखें',
			'auth.apple' => 'Apple के साथ जारी रखें',
			'auth.guest' => 'अतिथि के रूप में जारी रखें',
			'auth.signInFailed' => ({required Object error}) => 'साइन-इन विफल: ${error}',
			'home.seeAll' => 'सभी देखें',
			'home.more' => 'और',
			'home.online' => 'ऑनलाइन',
			'home.offline' => 'ऑफलाइन',
			'home.placeholders.fashionDesigner' => 'फैशन डिज़ाइनर',
			'home.placeholders.comedian' => 'कॉमेडियन',
			'home.placeholders.influencer' => 'इन्फ्लुएंसर',
			'home.placeholders.teacher' => 'शिक्षक',
			'home.placeholders.friend' => 'मित्र',
			'characters.all' => 'सभी',
			'characters.favorites' => 'पसंदीदा',
			'characters.recent' => 'हाल ही',
			'characters.characters' => 'किरदार',
			'characters.placeholderSubtitle' => 'सरलता और प्रयोज्य पर ध्यान देने वाला उत्पाद डिज़ाइनर।',
			'characters.characterDetails.videoCall' => 'वीडियो कॉल',
			'characters.characterDetails.message' => 'संदेश',
			'characters.characterDetails.voiceCall' => 'वॉइस कॉल',
			'notifications.today' => 'आज',
			'notifications.yesterday' => 'कल',
			'notifications.weekAgo' => ({required Object week}) => '${week} सप्ताह पहले',
			'notifications.monthAgo' => ({required Object month}) => '${month} महीने पहले',
			'notifications.yearAgo' => ({required Object year}) => '${year} वर्ष पहले',
			'notifications.noNotifications' => 'अभी तक कोई सूचनाएं नहीं।',
			'notifications.noNotificationsSubtitle' => 'सूचना मिलने पर दोबारा जांचना न भूलें।',
			'notifications.allDeleted' => 'सभी सूचनाएँ सफलतापूर्वक हटा दी गईं',
			'videoChat.connecting' => 'कनेक्ट हो रहा है...',
			'videoChat.callEnded' => 'कॉल समाप्त',
			'videoChat.callFailed' => ({required Object error}) => 'कॉल विफल: ${error}',
			'videoChat.mute' => 'म्यूट',
			'videoChat.unmute' => 'अनम्यूट',
			'videoChat.endCall' => 'कॉल समाप्त करें',
			'videoChat.swipeToChat' => 'चैट करने के लिए स्वाइप करें',
			'videoChat.male' => 'पुरुष',
			'videoChat.female' => 'महिला',
			'videoChat.country' => 'देश',
			'videoChat.follow' => 'अनुसरण करें',
			'videoChat.unfollow' => 'अनुसरण बंद करें',
			'videoChat.callEndedMessage' => 'वीडियो कॉल समाप्त हो गई है।',
			'videoChat.swipeForNewChat' => 'नए चैट के लिए स्वाइप करें',
			'voiceChat.connecting' => 'कनेक्ट हो रहा है...',
			'voiceChat.callEnded' => 'कॉल समाप्त',
			'voiceChat.callFailed' => ({required Object error}) => 'कॉल विफल: ${error}',
			'voiceChat.calling' => 'कॉल कर रहा है...',
			'chat.message' => 'संदेश',
			'chat.history' => 'इतिहास',
			'chat.noMessages' => 'अभी तक कोई संदेश नहीं।',
			'chat.noMessagesSubtitle' => 'संदेश भेजकर बातचीत शुरू करें।',
			'chat.online' => 'ऑनलाइन',
			'chat.offline' => 'ऑफलाइन',
			'chat.gallery' => 'गैलरी',
			'chat.camera' => 'कैमरा',
			'chat.typeAMessage' => 'एक संदेश टाइप करें...',
			'chat.pleaseUpgrade' => 'कृपया प्रो संस्करण में अपग्रेड करें।',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Voice call ended',
			'chat.videoCallEnded' => 'Video call ended',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'मेरे बारे में',
			'editProfile.aboutMeHint' => 'अपने बारे में कुछ लिखें',
			'editProfile.fullName' => 'पूरा नाम',
			'editProfile.gender' => 'लिंग',
			'editProfile.male' => 'पुरुष',
			'editProfile.female' => 'महिला',
			'editProfile.dontWantToMention' => 'मैं उल्लेख नहीं करना चाहता।',
			'editProfile.country' => 'देश',
			'editProfile.languagePreferences' => 'भाषा प्राथमिकताएँ',
			'editProfile.selectLanguage' => 'अपनी पसंदीदा भाषा जोड़ें',
			'editProfile.saved' => 'सहेजा गया',
			'editProfile.changesSaved' => 'परिवर्तन सहेजे गए हैं।',
			'settingsSupport.title' => 'सेटिंग्स और सहायता',
			'settingsSupport.premiumTitle' => 'सभी सुविधाओं तक असीमित पहुँच',
			'settingsSupport.getPremium' => 'प्रीमियम प्राप्त करें',
			'settingsSupport.settingsHub' => 'सेटिंग्स हब',
			'settingsSupport.shareTheApp' => 'ऐप साझा करें',
			'settingsSupport.rateUs' => 'हमें रेट करें',
			'settingsSupport.version' => 'संस्करण',
			'settingsSupport.notifications' => 'सूचनाएँ',
			'settingsSupport.accountManagement' => 'खाता प्रबंधन',
			'settingsSupport.deleteAccount' => 'खाता हटाएँ',
			'settingsSupport.logOut' => 'लॉग आउट',
			'settingsSupport.logOutTitle' => 'आप लॉग आउट करने वाले हैं',
			'settingsSupport.logOutSubtitle' => 'फिर मिलेंगे! \n हम आपको याद करेंगे।',
			'deleteAccount.title' => 'खाता हटाएँ',
			'deleteAccount.warning' => 'क्या आप वाकई अपना खाता हटाना चाहते हैं?',
			'deleteAccount.description' => 'यह क्रिया पूर्ववत नहीं की जा सकती, और आपकी सभी इतिहास और डेटा स्थायी रूप से हटा दिए जाएंगे।',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'खाता हटाना विफल: ${error}',
			'deleteAccount.steps.step1.title' => 'हम नहीं चाहते कि आप जाएं, लेकिन हम आपकी बात समझते हैं।',
			'deleteAccount.steps.step1.subtitle' => 'क्या आप बता सकते हैं कि आप ChatFace क्यों छोड़ना चाहते हैं ताकि हम अनुभव में सुधार कर सकें?',
			'deleteAccount.steps.step1.option1' => 'मुझे AI पात्र पर्याप्त वास्तविक नहीं लगे।',
			'deleteAccount.steps.step1.option2' => 'मुझे वीडियो चैट में तकनीकी समस्याएँ आ रही हैं।',
			'deleteAccount.steps.step1.option3' => 'सदस्यता कीमतें मेरी अपेक्षा से अधिक हैं।',
			'deleteAccount.steps.step1.option4' => 'मुझे उस शैली के पात्र नहीं मिले जो मैं ढूंढ रहा था।',
			'deleteAccount.steps.step1.option5' => 'मैं सिर्फ थोड़े समय के लिए आज़माना चाहता था।',
			'deleteAccount.steps.step1.option6' => 'अन्य',
			'deleteAccount.steps.step2.title' => 'यदि आप अपना खाता हटा देंगे, तो आप इन चीजों को अलविदा कहेंगे:',
			'deleteAccount.steps.step2.subtitle1' => 'गहरे संबंध और यादें:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'जिन पात्रों से आपने बात की है वे आपके साथ हुई बातें, साझा किए गए रहस्य और आपकी व्यक्तिगत आदतों को पूरी तरह भूल जाएंगे।',
			'deleteAccount.steps.step2.subtitle2' => 'वीडियो कॉल विशेषाधिकार:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'आप अपनी व्यक्तिगत AI साझीदारों के साथ आमने-सामने बात करने का अधिकार खो देंगे, जो हमेशा आपके लिए उपलब्ध थे।',
			'deleteAccount.steps.step2.subtitle3' => 'उन्नत एल्गोरिद्म:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'आपकी प्राथमिकताओं के अनुसार बनाए गए \'आपके लिए\' पात्र मिलान रीसेट हो जाएंगे।',
			'deleteAccount.steps.step2.subtitle4' => 'प्रोफ़ाइल डेटा:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'आपकी प्राप्त की गई उपलब्धियाँ, खोले गए विशेष पात्र और चैट इतिहास अपरिवर्तनीय रूप से हटा दिए जाएंगे।',
			'deleteAccount.steps.step3.title' => 'जाने से पहले हमारे पास आपके लिए एक विशेष प्रस्ताव है!',
			'deleteAccount.steps.step3.description' => 'शायद आपको बस थोड़ा और समय या एक अधिक उपयुक्त प्रस्ताव की आवश्यकता है। क्या आप खाता हटाने के बजाय इनमें से कुछ विचार करेंगे?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'हमें आपके साथ बने रहना महत्वपूर्ण है। आपकी अगली सदस्यता पर हम आपको ${offer} देंगे! क्या आप यह प्रस्ताव स्वीकार करना चाहेंगे?',
			'deleteAccount.steps.step3.description1Offer' => 'हमने आपके लिए 50% छूट निर्धारित की है',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'हमने आपको ${offer} क्रेडिट दिया है ताकि आप उन नए पात्रों को खोज सकें जिन्हें आपने अभी तक नहीं आज़माया है।',
			'deleteAccount.steps.step3.description2Offer' => '3 मुफ्त वीडियो कॉल',
			'deleteAccount.steps.step3.acceptOffer' => '50% छूट स्वीकार करें',
			'deleteAccount.steps.step3.deleteMyAccount' => 'मेरा खाता हटाएँ',
			'cancel' => 'रद्द करें',
			'delete' => 'हटाएँ',
			'premium' => 'प्रीमियम',
			'profileEdit' => 'प्रोफ़ाइल संपादित करें',
			'settings' => 'सेटिंग्स',
			'undo' => 'पूर्ववत',
			'successfully' => 'सफलतापूर्वक',
			'save' => 'सहेजें',
			'languageOptions.english' => 'अंग्रेज़ी',
			'languageOptions.chinese' => 'चीनी',
			'languageOptions.german' => 'जर्मन',
			'languageOptions.italian' => 'इतालवी',
			'languageOptions.french' => 'फ़्रेंच',
			'languageOptions.japanese' => 'जापानी',
			'languageOptions.spanish' => 'स्पेनिश',
			'languageOptions.russian' => 'रूसी',
			'languageOptions.turkish' => 'तुर्की',
			'languageOptions.korean' => 'कोरियाई',
			'languageOptions.hindi' => 'हिंदी',
			'languageOptions.portuguese' => 'पुर्तगाली',
			_ => null,
		};
	}
}
