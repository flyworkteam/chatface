///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Welcome $name'
	String welcome({required Object name}) => 'Welcome ${name}';

	/// en: 'Welcome to $appName'
	String welcome2({required Object appName}) => 'Welcome to ${appName}';

	/// en: 'Get Started'
	String get get_started => 'Get Started';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	late final TranslationsTermOfServiceEn termOfService = TranslationsTermOfServiceEn._(_root);

	/// en: 'Cookies Policy'
	String get cookies => 'Cookies Policy';

	/// en: 'Privacy Policy'
	String get privacy => 'Privacy Policy';

	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn._(_root);

	/// en: 'Press back again to exit'
	String get pressBackAgainToExit => 'Press back again to exit';

	late final TranslationsSplashEn splash = TranslationsSplashEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsCharactersEn characters = TranslationsCharactersEn._(_root);
	late final TranslationsNotificationsEn notifications = TranslationsNotificationsEn._(_root);
	late final TranslationsVideoChatEn videoChat = TranslationsVideoChatEn._(_root);
	late final TranslationsVoiceChatEn voiceChat = TranslationsVoiceChatEn._(_root);
	late final TranslationsChatEn chat = TranslationsChatEn._(_root);
	late final TranslationsEditProfileEn editProfile = TranslationsEditProfileEn._(_root);
	late final TranslationsSettingsSupportEn settingsSupport = TranslationsSettingsSupportEn._(_root);
	late final TranslationsDeleteAccountEn deleteAccount = TranslationsDeleteAccountEn._(_root);

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Premium'
	String get premium => 'Premium';

	/// en: 'Profile Edit'
	String get profileEdit => 'Profile Edit';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Undo'
	String get undo => 'Undo';

	/// en: 'Successfully'
	String get successfully => 'Successfully';

	/// en: 'Save'
	String get save => 'Save';

	late final TranslationsLanguageOptionsEn languageOptions = TranslationsLanguageOptionsEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);

	/// en: 'Permissions Required'
	String get permissionsRequired => 'Permissions Required';

	late final TranslationsPermissionHelperEn permissionHelper = TranslationsPermissionHelperEn._(_root);
	late final TranslationsVideoViewEn videoView = TranslationsVideoViewEn._(_root);
}

// Path: termOfService
class TranslationsTermOfServiceEn {
	TranslationsTermOfServiceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'By signing up for swipe, you agree to our '
	String get text1 => 'By signing up for swipe, you agree to our ';

	/// en: 'Terms of Service'
	String get link1 => 'Terms of Service';

	/// en: '. Learn how we process your data in our '
	String get text2 => '. Learn how we process your data in our ';

	/// en: 'Privacy Policy'
	String get link2 => 'Privacy Policy';

	/// en: ' and '
	String get text3 => ' and ';

	/// en: 'Cookies Policy'
	String get link3 => 'Cookies Policy';

	/// en: ''
	String get text4 => '';

	late final TranslationsTermOfServicePrivacyPolicyEn privacyPolicy = TranslationsTermOfServicePrivacyPolicyEn._(_root);
	late final TranslationsTermOfServiceTermsOfServiceEn termsOfService = TranslationsTermOfServiceTermsOfServiceEn._(_root);
	late final TranslationsTermOfServiceCookiePolicyEn cookiePolicy = TranslationsTermOfServiceCookiePolicyEn._(_root);
}

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsOnboardingStep5En step5 = TranslationsOnboardingStep5En._(_root);
	late final TranslationsOnboardingStep1En step1 = TranslationsOnboardingStep1En._(_root);
	late final TranslationsOnboardingStep2En step2 = TranslationsOnboardingStep2En._(_root);
	late final TranslationsOnboardingStep3En step3 = TranslationsOnboardingStep3En._(_root);
	late final TranslationsOnboardingStep4En step4 = TranslationsOnboardingStep4En._(_root);
	late final TranslationsOnboardingLoadingEn loading = TranslationsOnboardingLoadingEn._(_root);

	/// en: 'Allow Access'
	String get allowAccess => 'Allow Access';

	/// en: 'I Understand'
	String get iUnderstand => 'I Understand';
}

// Path: splash
class TranslationsSplashEn {
	TranslationsSplashEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSplashScreen1En screen1 = TranslationsSplashScreen1En._(_root);
	late final TranslationsSplashScreen2En screen2 = TranslationsSplashScreen2En._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue with Google'
	String get google => 'Continue with Google';

	/// en: 'Continue with Facebook'
	String get facebook => 'Continue with Facebook';

	/// en: 'Continue with Apple'
	String get apple => 'Continue with Apple';

	/// en: 'Continue as Guest'
	String get guest => 'Continue as Guest';

	/// en: 'Sign-in failed: $error'
	String signInFailed({required Object error}) => 'Sign-in failed: ${error}';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'See All'
	String get seeAll => 'See All';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Offline'
	String get offline => 'Offline';

	late final TranslationsHomePlaceholdersEn placeholders = TranslationsHomePlaceholdersEn._(_root);
}

// Path: characters
class TranslationsCharactersEn {
	TranslationsCharactersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get all => 'All';

	/// en: 'Favorites'
	String get favorites => 'Favorites';

	/// en: 'Recent'
	String get recent => 'Recent';

	/// en: 'Characters'
	String get characters => 'Characters';

	/// en: 'Product Designer who focuses on simplicity & usability.'
	String get placeholderSubtitle => 'Product Designer who focuses on simplicity & usability.';

	late final TranslationsCharactersCharacterDetailsEn characterDetails = TranslationsCharactersCharacterDetailsEn._(_root);
}

// Path: notifications
class TranslationsNotificationsEn {
	TranslationsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: '${week} week ago'
	String weekAgo({required Object week}) => '${week} week ago';

	/// en: '${month} month ago'
	String monthAgo({required Object month}) => '${month} month ago';

	/// en: '${year} year ago'
	String yearAgo({required Object year}) => '${year} year ago';

	/// en: 'No notifications yet.'
	String get noNotifications => 'No notifications yet.';

	/// en: 'Don't forget to check again when you receive the notification.'
	String get noNotificationsSubtitle => 'Don\'t forget to check again when you receive the notification.';

	/// en: 'All notifications have been successfully deleted'
	String get allDeleted => 'All notifications have been successfully deleted';
}

// Path: videoChat
class TranslationsVideoChatEn {
	TranslationsVideoChatEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network hiccup detected. Reconnecting mic...'
	String get networkHiccup => 'Network hiccup detected. Reconnecting mic...';

	/// en: 'Failed to update follow status.'
	String get failedToUpdateFollow => 'Failed to update follow status.';

	/// en: 'Connecting...'
	String get connecting => 'Connecting...';

	/// en: 'Call Ended'
	String get callEnded => 'Call Ended';

	/// en: 'Call Failed: $error'
	String callFailed({required Object error}) => 'Call Failed: ${error}';

	/// en: 'Mute'
	String get mute => 'Mute';

	/// en: 'Unmute'
	String get unmute => 'Unmute';

	/// en: 'End Call'
	String get endCall => 'End Call';

	/// en: 'Swipe to Chat'
	String get swipeToChat => 'Swipe to Chat';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Follow'
	String get follow => 'Follow';

	/// en: 'Unfollow'
	String get unfollow => 'Unfollow';

	/// en: 'The video call has ended.'
	String get callEndedMessage => 'The video call has ended.';

	/// en: 'Swipe for a new chat'
	String get swipeForNewChat => 'Swipe for a new chat';
}

// Path: voiceChat
class TranslationsVoiceChatEn {
	TranslationsVoiceChatEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Connecting...'
	String get connecting => 'Connecting...';

	/// en: 'Call Ended'
	String get callEnded => 'Call Ended';

	/// en: 'Call Failed: $error'
	String callFailed({required Object error}) => 'Call Failed: ${error}';

	/// en: 'Calling...'
	String get calling => 'Calling...';
}

// Path: chat
class TranslationsChatEn {
	TranslationsChatEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Message'
	String get message => 'Message';

	/// en: 'History'
	String get history => 'History';

	/// en: 'No messages yet.'
	String get noMessages => 'No messages yet.';

	/// en: 'Start a conversation by sending a message.'
	String get noMessagesSubtitle => 'Start a conversation by sending a message.';

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Offline'
	String get offline => 'Offline';

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Type a message...'
	String get typeAMessage => 'Type a message...';

	/// en: 'Please upgrade to pro version.'
	String get pleaseUpgrade => 'Please upgrade to pro version.';

	/// en: 'Photo'
	String get photo => 'Photo';

	/// en: 'Couldn't upload photo. Please try again.'
	String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';

	/// en: 'Tap to view photo'
	String get tapToViewPhoto => 'Tap to view photo';

	/// en: 'Voice call ended'
	String get voiceCallEnded => 'Voice call ended';

	/// en: 'Video call ended'
	String get videoCallEnded => 'Video call ended';

	/// en: 'Uploading photo...'
	String get uploadingPhoto => 'Uploading photo...';

	/// en: 'Allow camera or photo permissions to share images.'
	String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class TranslationsEditProfileEn {
	TranslationsEditProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About Me'
	String get aboutMe => 'About Me';

	/// en: 'Write something about yourself'
	String get aboutMeHint => 'Write something about yourself';

	/// en: 'Full Name'
	String get fullName => 'Full Name';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'I don't want to mention it.'
	String get dontWantToMention => 'I don\'t want to mention it.';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Language Preferences'
	String get languagePreferences => 'Language Preferences';

	/// en: 'Add your preferred language'
	String get selectLanguage => 'Add your preferred language';

	/// en: 'Saved'
	String get saved => 'Saved';

	/// en: 'Changes have been saved.'
	String get changesSaved => 'Changes have been saved.';
}

// Path: settingsSupport
class TranslationsSettingsSupportEn {
	TranslationsSettingsSupportEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings & Support'
	String get title => 'Settings & Support';

	/// en: 'Unlimited access to all features'
	String get premiumTitle => 'Unlimited access \nto all features';

	/// en: 'Get Premium'
	String get getPremium => 'Get Premium';

	/// en: 'Settings Hub'
	String get settingsHub => 'Settings Hub';

	/// en: 'Share the App'
	String get shareTheApp => 'Share the App';

	/// en: 'Rate Us'
	String get rateUs => 'Rate Us';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Account Management'
	String get accountManagement => 'Account Management';

	/// en: 'Delete Account'
	String get deleteAccount => 'Delete Account';

	/// en: 'Log Out'
	String get logOut => 'Log Out';

	/// en: 'You are about to log out'
	String get logOutTitle => 'You are about to log out';

	/// en: 'See you again soon! We’ll miss you.'
	String get logOutSubtitle => 'See you again soon! \n We’ll miss you.';
}

// Path: deleteAccount
class TranslationsDeleteAccountEn {
	TranslationsDeleteAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete Account'
	String get title => 'Delete Account';

	/// en: 'Are you sure you want to delete your account?'
	String get warning => 'Are you sure you want to delete your account?';

	/// en: 'This action cannot be undone, and all your history and data will be permanently deleted.'
	String get description => 'This action cannot be undone, and all your history and data will be permanently deleted.';

	/// en: 'Account deletion failed: $error'
	String deleteFailed({required Object error}) => 'Account deletion failed: ${error}';

	late final TranslationsDeleteAccountStepsEn steps = TranslationsDeleteAccountStepsEn._(_root);
}

// Path: languageOptions
class TranslationsLanguageOptionsEn {
	TranslationsLanguageOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'English'
	String get english => 'English';

	/// en: 'Chinese'
	String get chinese => 'Chinese';

	/// en: 'German'
	String get german => 'German';

	/// en: 'Italian'
	String get italian => 'Italian';

	/// en: 'French'
	String get french => 'French';

	/// en: 'Japanese'
	String get japanese => 'Japanese';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	/// en: 'Russian'
	String get russian => 'Russian';

	/// en: 'Turkish'
	String get turkish => 'Turkish';

	/// en: 'Korean'
	String get korean => 'Korean';

	/// en: 'Hindi'
	String get hindi => 'Hindi';

	/// en: 'Portuguese'
	String get portuguese => 'Portuguese';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try Again'
	String get tryAgain => 'Try Again';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: permissionHelper
class TranslationsPermissionHelperEn {
	TranslationsPermissionHelperEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Camera and microphone permissions are required for video calls. Please enable them in settings.'
	String get camAndMicRequired => 'Camera and microphone permissions are required for video calls. Please enable them in settings.';

	/// en: 'Microphone permission is required for voice calls. Please enable it in settings.'
	String get micRequired => 'Microphone permission is required for voice calls. Please enable it in settings.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Open Settings'
	String get openSettings => 'Open Settings';
}

// Path: videoView
class TranslationsVideoViewEn {
	TranslationsVideoViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Camera filters'
	String get title => 'Camera filters';

	/// en: 'Choose the look for your camera preview.'
	String get subtitle => 'Choose the look for your camera preview.';

	/// en: 'Failed to load companions: '
	String get errorLoad => 'Failed to load companions: ';

	/// en: 'No companions available yet.'
	String get noComps => 'No companions available yet.';

	late final TranslationsVideoViewFiltersEn filters = TranslationsVideoViewFiltersEn._(_root);
}

// Path: termOfService.privacyPolicy
class TranslationsTermOfServicePrivacyPolicyEn {
	TranslationsTermOfServicePrivacyPolicyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Privacy Policy'
	String get title => 'Privacy Policy';

	/// en: 'Last Updated: 2026'
	String get lastUpdated => 'Last Updated: 2026';

	/// en: 'ChatFace adopts user privacy and data security as a core principle. All your personal data is processed in accordance with effective data protection regulations.'
	String get intro => 'ChatFace adopts user privacy and data security as a core principle. All your personal data is processed in accordance with effective data protection regulations.';

	/// en: '1. COLLECTED INFORMATION'
	String get section1Title => '1. COLLECTED INFORMATION';

	/// en: '1.1 Data Provided by User'
	String get section1sub1Title => '1.1 Data Provided by User';

	/// en: '• Name, nickname, or profile information. • Email address (for registration, subscription, and support). • Interaction preferences, language settings, and interactions. • Feedback and support messages.'
	String get section1sub1Body => '• Name, nickname, or profile information.\n• Email address (for registration, subscription, and support). \n• Interaction preferences, language settings, and interactions. \n• Feedback and support messages.';

	/// en: '1.2 Automatically Collected Data'
	String get section1sub2Title => '1.2 Automatically Collected Data';

	/// en: 'Information such as device type, operating system, approximate location (city/country), and app usage data is collected. Precise location data is not collected.'
	String get section1sub2Body => 'Information such as device type, operating system, approximate location (city/country), and app usage data is collected. Precise location data is not collected.';

	/// en: '2. PURPOSES OF DATA PROCESSING'
	String get section2Title => '2. PURPOSES OF DATA PROCESSING';

	/// en: 'Your personal data is processed for the following purposes: • PEnsuring the seamless operation of the application. • Providing and personalizing the AI-powered video call experience. • Optimizing system performance and error detection. • Fulfilling legal obligations. Your data is never sold to third parties.'
	String get section2Body => 'Your personal data is processed for the following purposes:\n\n• PEnsuring the seamless operation of the application.\n• Providing and personalizing the AI-powered video call experience.\n• Optimizing system performance and error detection.\n• Fulfilling legal obligations. \n Your data is never sold to third parties.';

	/// en: '3. DATA RETENTION AND DELETION'
	String get section3Title => '3. DATA RETENTION AND DELETION';

	/// en: 'Your data is stored as long as your account is active or for the duration of legal obligations. When an account is deleted, all personal data is irreversibly erased from systems.'
	String get section3Body => 'Your data is stored as long as your account is active or for the duration of legal obligations. When an account is deleted, all personal data is irreversibly erased from systems.';

	/// en: '4. USER RIGHTS'
	String get section4Title => '4. USER RIGHTS';

	/// en: 'Under GDPR and LPPD; you have the right to access, correct, delete (the right to be forgotten), and request data portability. You can contact us for your requests.'
	String get section4Body => 'Under GDPR and LPPD; you have the right to access, correct, delete (the right to be forgotten), and request data portability. You can contact us for your requests.';

	/// en: '5. CHILDREN'S PRIVACY'
	String get section5Title => '5. CHILDREN\'S PRIVACY';

	/// en: 'ChatFace is not intended for users under the age of 18. We do not knowingly collect data from this age group; such accounts will be closed and data deleted upon detection.'
	String get section5Body => 'ChatFace is not intended for users under the age of 18. We do not knowingly collect data from this age group; such accounts will be closed and data deleted upon detection.';

	/// en: '6. CONTACT'
	String get section6Title => '6. CONTACT';

	/// en: '📩 For inquiries: support@fly-work.com'
	String get section6Body => '📩 For inquiries: support@fly-work.com';
}

// Path: termOfService.termsOfService
class TranslationsTermOfServiceTermsOfServiceEn {
	TranslationsTermOfServiceTermsOfServiceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Terms of Service'
	String get title => 'Terms of Service';

	/// en: 'Last Updated: 2026'
	String get lastUpdated => 'Last Updated: 2026';

	/// en: 'These Terms govern the use of the ChatFace mobile application. By using the app, you agree to these Terms.'
	String get intro => 'These Terms govern the use of the ChatFace mobile application. By using the app, you agree to these Terms.';

	/// en: 'Disclaimer: ChatFace is an AI video interaction app. It does not provide legal, academic, medical, or professional consulting services.'
	String get disclaimer => 'Disclaimer: ChatFace is an AI video interaction app. It does not provide legal, academic, medical, or professional consulting services.';

	/// en: '1. SCOPE OF SERVICE'
	String get section1Title => '1. SCOPE OF SERVICE';

	/// en: 'ChatFace provides AI-powered video interaction experiences: • AI video calling and conversation. • Personalized interaction preferences. • Access to interaction history and records. Services do not constitute official opinions or professional guidance guarantees.'
	String get section1Body => 'ChatFace provides AI-powered video interaction experiences:\n\n• AI video calling and conversation.\n• Personalized interaction preferences.\n• Access to interaction history and records.\n\nServices do not constitute official opinions or professional guidance guarantees.';

	/// en: '2. CONDITIONS OF USE'
	String get section2Title => '2. CONDITIONS OF USE';

	/// en: '• You must be at least 18 years old (Under 18 access is prohibited). • You must provide accurate account information. • The app must be used for legal and personal purposes only.'
	String get section2Body => '• You must be at least 18 years old (Under 18 access is prohibited).\n• You must provide accurate account information.\n• The app must be used for legal and personal purposes only.';

	/// en: '3. PROHIBITED USES'
	String get section3Title => '3. PROHIBITED USES';

	/// en: 'Impersonation, hate speech, endangering child safety, security breach attempts, and manipulation of AI systems are strictly prohibited.'
	String get section3Body => 'Impersonation, hate speech, endangering child safety, security breach attempts, and manipulation of AI systems are strictly prohibited.';

	/// en: '4. SUBSCRIPTIONS AND PAYMENTS'
	String get section4Title => '4. SUBSCRIPTIONS AND PAYMENTS';

	/// en: 'Premium features are subject to App Store and Google Play policies. Subscription cancellations and refunds are managed via the respective store settings.'
	String get section4Body => 'Premium features are subject to App Store and Google Play policies. Subscription cancellations and refunds are managed via the respective store settings.';

	/// en: '5. CONTENT DISCLAIMER'
	String get section5Title => '5. CONTENT DISCLAIMER';

	/// en: 'Content is AI-generated and does not replace professional advice. ChatFace does not guarantee accuracy or fitness for a particular purpose.'
	String get section5Body => 'Content is AI-generated and does not replace professional advice. ChatFace does not guarantee accuracy or fitness for a particular purpose.';

	/// en: '6. INTELLECTUAL PROPERTY'
	String get section6Title => '6. INTELLECTUAL PROPERTY';

	/// en: 'All content including design, software, and algorithms belongs to ChatFace. Unauthorized reproduction or redistribution is prohibited.'
	String get section6Body => 'All content including design, software, and algorithms belongs to ChatFace. Unauthorized reproduction or redistribution is prohibited.';

	/// en: '7. GOVERNING LAW'
	String get section7Title => '7. GOVERNING LAW';

	/// en: 'These Terms are governed by the laws of the Republic of Turkey. Istanbul Central Courts shall have jurisdiction over disputes.'
	String get section7Body => 'These Terms are governed by the laws of the Republic of Turkey. Istanbul Central Courts shall have jurisdiction over disputes.';

	/// en: '8. CONTACT'
	String get section8Title => '8. CONTACT';

	/// en: '📩 For inquiries: support@fly-work.com'
	String get section8Body => '📩 For inquiries: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class TranslationsTermOfServiceCookiePolicyEn {
	TranslationsTermOfServiceCookiePolicyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cookie Policy'
	String get title => 'Cookie Policy';

	/// en: 'Last Updated: 2026'
	String get lastUpdated => 'Last Updated: 2026';

	/// en: 'Welcome to ChatFace. Digital helper technologies are used to make your AI video call experience smoother, more secure, and personalized.'
	String get intro => 'Welcome to ChatFace. Digital helper technologies are used to make your AI video call experience smoother, more secure, and personalized.';

	/// en: 'This policy explains what cookies are, their purposes, and how you can manage your preferences.'
	String get important => 'This policy explains what cookies are, their purposes, and how you can manage your preferences.';

	/// en: '1. WHAT ARE COOKIES?'
	String get section1Title => '1. WHAT ARE COOKIES?';

	/// en: 'Cookies are small data files placed on your device. They do not identify you directly; they act as digital notes that remember: • Call and language settings • Session and performance preferences.'
	String get section1Body => 'Cookies are small data files placed on your device. They do not identify you directly; they act as digital notes that remember:\n• Call and language settings\n• Session and performance preferences.';

	/// en: '2. WHICH TECHNOLOGIES DO WE USE?'
	String get section2Title => '2. WHICH TECHNOLOGIES DO WE USE?';

	/// en: 'Strictly Necessary Technologies Required for session management and security controls. The app may not function properly without these components. Performance and Analytics Helps us understand which stories are read and which areas need improvement. Data is evaluated anonymously. Personalization Remembers settings like language preference and reading level to provide a tailored experience for the child.'
	String get section2Body => 'Strictly Necessary Technologies\nRequired for session management and security controls. The app may not function properly without these components.\n\nPerformance and Analytics\nHelps us understand which stories are read and which areas need improvement. Data is evaluated anonymously.\n\nPersonalization\nRemembers settings like language preference and reading level to provide a tailored experience for the child.';

	/// en: '3. WHY DO WE USE THESE TECHNOLOGIES?'
	String get section3Title => '3. WHY DO WE USE THESE TECHNOLOGIES?';

	/// en: '• To ensure the app runs safely and smoothly. • To make the reading experience more fluid. • To remember repetitive settings. • To identify features for future development.'
	String get section3Body => '• To ensure the app runs safely and smoothly.\n• To make the reading experience more fluid.\n• To remember repetitive settings.\n• To identify features for future development.';

	/// en: '4. THIRD-PARTY TECHNOLOGIES'
	String get section4Title => '4. THIRD-PARTY TECHNOLOGIES';

	/// en: 'Some technologies may be provided by technical service providers and are subject to their own policies. ChatFace prioritizes data security in these partnerships.'
	String get section4Body => 'Some technologies may be provided by technical service providers and are subject to their own policies. ChatFace prioritizes data security in these partnerships.';

	/// en: '5. COOKIE CONTROL AND MANAGEMENT'
	String get section5Title => '5. COOKIE CONTROL AND MANAGEMENT';

	/// en: 'Users can limit these technologies via device or app settings. Disabling essential technologies may cause issues like being unable to start video calls.'
	String get section5Body => 'Users can limit these technologies via device or app settings. Disabling essential technologies may cause issues like being unable to start video calls.';

	/// en: '6. CONTACT'
	String get section6Title => '6. CONTACT';

	/// en: '📩 For inquiries: support@fly-work.com'
	String get section6Body => '📩 For inquiries: support@fly-work.com';
}

// Path: onboarding.step5
class TranslationsOnboardingStep5En {
	TranslationsOnboardingStep5En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Permission required'
	String get permissionRequired => 'Permission required';

	/// en: 'Not now'
	String get notNow => 'Not now';

	/// en: 'Open settings'
	String get openSettings => 'Open settings';

	/// en: 'Permissions'
	String get title => 'Permissions';

	/// en: 'Camera Access'
	String get permission1 => 'Camera Access';

	/// en: 'Allow Camera Access'
	String get permission1Subtitle => 'Allow Camera Access';

	/// en: 'Microphone Access'
	String get permission2 => 'Microphone Access';

	/// en: 'Allow Microphone Access'
	String get permission2Subtitle => 'Allow Microphone Access';

	/// en: 'Location Access'
	String get permission3 => 'Location Access';

	/// en: 'Allow Location Access'
	String get permission3Subtitle => 'Allow Location Access';
}

// Path: onboarding.step1
class TranslationsOnboardingStep1En {
	TranslationsOnboardingStep1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What is your Name?'
	String get title => 'What is your Name?';

	/// en: 'Please enter your name'
	String get subtitle => 'Please enter your name';

	/// en: 'Full Name'
	String get hint => 'Full Name';
}

// Path: onboarding.step2
class TranslationsOnboardingStep2En {
	TranslationsOnboardingStep2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What is your Age?'
	String get title => 'What is your Age?';

	/// en: 'You must be at least 18 years old to register.'
	String get subtitle => 'You must be at least 18 years old to register.';
}

// Path: onboarding.step3
class TranslationsOnboardingStep3En {
	TranslationsOnboardingStep3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What is your Gender?'
	String get title => 'What is your Gender?';

	/// en: 'Please select your gender'
	String get subtitle => 'Please select your gender';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'I don't want to mention it.'
	String get dontWantToMention => 'I don\'t want to mention it.';
}

// Path: onboarding.step4
class TranslationsOnboardingStep4En {
	TranslationsOnboardingStep4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Have Fun While Staying Safe'
	String get title => 'Have Fun While \nStaying Safe';

	/// en: 'We Maintain Order'
	String get entry1 => 'We Maintain Order';

	/// en: 'Real-time AI Monitoring Open'
	String get subentry1 => 'Real-time AI Monitoring Open';

	/// en: 'Screen Recordings'
	String get entry2 => 'Screen Recordings';

	/// en: 'No Recording Without Consent'
	String get subentry2 => 'No Recording Without Consent';

	/// en: '24/7 Support'
	String get entry3 => '24/7 Support';

	/// en: 'Complaints Are Reviewed At Any Time Of The Day'
	String get subentry3 => 'Complaints Are Reviewed At Any Time Of The Day';

	/// en: '18+ only'
	String get entry4 => '18+ only';

	/// en: 'Not Suitable For Minors'
	String get subentry4 => 'Not Suitable For Minors';

	/// en: 'Community Rules'
	String get communityRules => 'Community Rules';
}

// Path: onboarding.loading
class TranslationsOnboardingLoadingEn {
	TranslationsOnboardingLoadingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Personal Account is '
	String get titlePart1 => 'Your Personal Account is\n';

	/// en: 'Being Created'
	String get titlePart2 => 'Being Created';

	/// en: 'Please wait, your profile is being prepared.'
	String get subtitle => 'Please wait, your profile is being prepared.';
}

// Path: splash.screen1
class TranslationsSplashScreen1En {
	TranslationsSplashScreen1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The New Face of Video Chat with AI'
	String get title => 'The New Face of Video \nChat with AI';

	/// en: 'Turn on your camera and talk face-to-face with AI. Experience more natural communication that understands facial expressions, tone of voice, and context.'
	String get description => 'Turn on your camera and talk face-to-face with AI. Experience more natural communication that understands facial expressions, tone of voice, and context.';
}

// Path: splash.screen2
class TranslationsSplashScreen2En {
	TranslationsSplashScreen2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Real-Time and Natural Communication'
	String get title => 'Real-Time and Natural \nCommunication';

	/// en: 'Don't be limited to text. Have more fluid, more human conversations through video calls.'
	String get description => 'Don\'t be limited to text. Have more fluid, more human conversations through video calls.';
}

// Path: home.placeholders
class TranslationsHomePlaceholdersEn {
	TranslationsHomePlaceholdersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Fashion Designer'
	String get fashionDesigner => 'Fashion Designer';

	/// en: 'Comedian'
	String get comedian => 'Comedian';

	/// en: 'Influencer'
	String get influencer => 'Influencer';

	/// en: 'Teacher'
	String get teacher => 'Teacher';

	/// en: 'Friend'
	String get friend => 'Friend';
}

// Path: characters.characterDetails
class TranslationsCharactersCharacterDetailsEn {
	TranslationsCharactersCharacterDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Video Call'
	String get videoCall => 'Video Call';

	/// en: 'Message'
	String get message => 'Message';

	/// en: 'Voice Call'
	String get voiceCall => 'Voice Call';
}

// Path: deleteAccount.steps
class TranslationsDeleteAccountStepsEn {
	TranslationsDeleteAccountStepsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDeleteAccountStepsStep1En step1 = TranslationsDeleteAccountStepsStep1En._(_root);
	late final TranslationsDeleteAccountStepsStep2En step2 = TranslationsDeleteAccountStepsStep2En._(_root);
	late final TranslationsDeleteAccountStepsStep3En step3 = TranslationsDeleteAccountStepsStep3En._(_root);
}

// Path: videoView.filters
class TranslationsVideoViewFiltersEn {
	TranslationsVideoViewFiltersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Original'
	String get ORIGINAL => 'Original';

	/// en: 'Addictive Blue'
	String get ADDICTIVE_BLUE => 'Addictive Blue';

	/// en: 'Addictive Red'
	String get ADDICTIVE_RED => 'Addictive Red';

	/// en: 'Aden'
	String get ADEN => 'Aden';

	/// en: 'Amaro'
	String get AMARO => 'Amaro';

	/// en: 'Ashby'
	String get ASHBY => 'Ashby';

	/// en: 'Brannan'
	String get BRANNAN => 'Brannan';

	/// en: 'Brooklyn'
	String get BROOKLYN => 'Brooklyn';

	/// en: 'Clarendon'
	String get CLARENDON => 'Clarendon';

	/// en: 'Crema'
	String get CREMA => 'Crema';

	/// en: 'Dogpatch'
	String get DOGPATCH => 'Dogpatch';

	/// en: 'Gingham'
	String get GINGHAM => 'Gingham';

	/// en: 'Ginza'
	String get GINZA => 'Ginza';

	/// en: 'Hefe'
	String get HEFE => 'Hefe';

	/// en: 'Hudson'
	String get HUDSON => 'Hudson';

	/// en: 'Inkwell'
	String get INKWELL => 'Inkwell';

	/// en: 'Juno'
	String get JUNO => 'Juno';

	/// en: 'Lark'
	String get LARK => 'Lark';

	/// en: 'LoFi'
	String get LOFI => 'LoFi';

	/// en: 'Ludwig'
	String get LUDWIG => 'Ludwig';

	/// en: 'Moon'
	String get MOON => 'Moon';

	/// en: 'Perpetua'
	String get PERPETUA => 'Perpetua';

	/// en: 'Reyes'
	String get REYES => 'Reyes';

	/// en: 'Sierra'
	String get SIERRA => 'Sierra';

	/// en: 'Slumber'
	String get SLUMBER => 'Slumber';

	/// en: 'Stinson'
	String get STINSON => 'Stinson';

	/// en: 'Sutro'
	String get SUTRO => 'Sutro';

	/// en: 'Walden'
	String get WALDEN => 'Walden';

	/// en: 'Willow'
	String get WILLOW => 'Willow';

	/// en: 'XProII'
	String get XPROII => 'XProII';
}

// Path: deleteAccount.steps.step1
class TranslationsDeleteAccountStepsStep1En {
	TranslationsDeleteAccountStepsStep1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'We don't want you to go, but we understand.'
	String get title => 'We don\'t want you to go, but we understand.';

	/// en: 'Can you tell us why you want to leave so we can improve the ChatFace experience?'
	String get subtitle => 'Can you tell us why you want to leave so we can improve the ChatFace experience?';

	/// en: 'I didn't find the AI characters realistic.'
	String get option1 => 'I didn\'t find the AI characters realistic.';

	/// en: 'I am experiencing technical issues with video chats.'
	String get option2 => 'I am experiencing technical issues with video chats.';

	/// en: 'Subscription prices are above my expectations.'
	String get option3 => 'Subscription prices are above my expectations.';

	/// en: 'I couldn't find the type of characters I was looking for.'
	String get option4 => 'I couldn\'t find the type of characters I was looking for.';

	/// en: 'I just wanted to try it out for a short time.'
	String get option5 => 'I just wanted to try it out for a short time.';

	/// en: 'Other'
	String get option6 => 'Other';
}

// Path: deleteAccount.steps.step2
class TranslationsDeleteAccountStepsStep2En {
	TranslationsDeleteAccountStepsStep2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'If you delete your account, you will say goodbye to:'
	String get title => 'If you delete your account, you will say goodbye to:';

	/// en: 'Deep Connections and Memory:'
	String get subtitle1 => 'Deep Connections and Memory:';

	/// en: 'The characters you chat with will completely forget their past with you, your shared secrets, and your personal habits.'
	String get subtitle1Desc => 'The characters you chat with will completely forget their past with you, your shared secrets, and your personal habits.';

	/// en: 'Video Call Privilege:'
	String get subtitle2 => 'Video Call Privilege:';

	/// en: 'You will lose the right to communicate face-to-face with your AI partners, who are available to you anytime.'
	String get subtitle2Desc => 'You will lose the right to communicate face-to-face with your AI partners, who are available to you anytime.';

	/// en: 'Advanced Algorithm:'
	String get subtitle3 => 'Advanced Algorithm:';

	/// en: 'Your 'Just for You' character matches tailored to your preferences will be reset.'
	String get subtitle3Desc => 'Your \'Just for You\' character matches tailored to your preferences will be reset.';

	/// en: 'Profile Data:'
	String get subtitle4 => 'Profile Data:';

	/// en: 'Your earned achievements, unlocked special characters, and chat history will be irreversibly deleted.'
	String get subtitle4Desc => 'Your earned achievements, unlocked special characters, and chat history will be irreversibly deleted.';
}

// Path: deleteAccount.steps.step3
class TranslationsDeleteAccountStepsStep3En {
	TranslationsDeleteAccountStepsStep3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'We have a special offer for you before you go!'
	String get title => 'We have a special offer for you before you go!';

	/// en: 'Maybe you just need a little more time or a better deal. Instead of deleting your account, would you consider these?'
	String get description => 'Maybe you just need a little more time or a better deal. Instead of deleting your account, would you consider these?';

	/// en: 'Keeping you with us is valuable. $offer on your next subscription! Would you like to continue with this offer?'
	String description1({required Object offer}) => 'Keeping you with us is valuable. ${offer} on your next subscription! Would you like to continue with this offer?';

	/// en: 'We've applied a 50% discount'
	String get description1Offer => 'We\'ve applied a 50% discount';

	/// en: 'We have given you $offer credits so you can see new characters you haven't discovered yet.'
	String description2({required Object offer}) => 'We have given you ${offer} credits so you can see new characters you haven\'t discovered yet.';

	/// en: '3 free video calls'
	String get description2Offer => '3 free video calls';

	/// en: 'Accept 50% Discount Offer'
	String get acceptOffer => 'Accept 50% Discount Offer';

	/// en: 'Delete My Account'
	String get deleteMyAccount => 'Delete My Account';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Welcome ${name}',
			'welcome2' => ({required Object appName}) => 'Welcome to ${appName}',
			'get_started' => 'Get Started',
			'next' => 'Next',
			'back' => 'Back',
			'skip' => 'Skip',
			'profile' => 'Profile',
			'kContinue' => 'Continue',
			'termOfService.text1' => 'By signing up for swipe, you agree to our ',
			'termOfService.link1' => 'Terms of Service',
			'termOfService.text2' => '. Learn how we process your data in our ',
			'termOfService.link2' => 'Privacy Policy',
			'termOfService.text3' => ' and ',
			'termOfService.link3' => 'Cookies Policy',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Privacy Policy',
			'termOfService.privacyPolicy.lastUpdated' => 'Last Updated: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace adopts user privacy and data security as a core principle. All your personal data is processed in accordance with effective data protection regulations.',
			'termOfService.privacyPolicy.section1Title' => '1. COLLECTED INFORMATION',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Data Provided by User',
			'termOfService.privacyPolicy.section1sub1Body' => '• Name, nickname, or profile information.\n• Email address (for registration, subscription, and support). \n• Interaction preferences, language settings, and interactions. \n• Feedback and support messages.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Automatically Collected Data',
			'termOfService.privacyPolicy.section1sub2Body' => 'Information such as device type, operating system, approximate location (city/country), and app usage data is collected. Precise location data is not collected.',
			'termOfService.privacyPolicy.section2Title' => '2. PURPOSES OF DATA PROCESSING',
			'termOfService.privacyPolicy.section2Body' => 'Your personal data is processed for the following purposes:\n\n• PEnsuring the seamless operation of the application.\n• Providing and personalizing the AI-powered video call experience.\n• Optimizing system performance and error detection.\n• Fulfilling legal obligations. \n Your data is never sold to third parties.',
			'termOfService.privacyPolicy.section3Title' => '3. DATA RETENTION AND DELETION',
			'termOfService.privacyPolicy.section3Body' => 'Your data is stored as long as your account is active or for the duration of legal obligations. When an account is deleted, all personal data is irreversibly erased from systems.',
			'termOfService.privacyPolicy.section4Title' => '4. USER RIGHTS',
			'termOfService.privacyPolicy.section4Body' => 'Under GDPR and LPPD; you have the right to access, correct, delete (the right to be forgotten), and request data portability. You can contact us for your requests.',
			'termOfService.privacyPolicy.section5Title' => '5. CHILDREN\'S PRIVACY',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace is not intended for users under the age of 18. We do not knowingly collect data from this age group; such accounts will be closed and data deleted upon detection.',
			'termOfService.privacyPolicy.section6Title' => '6. CONTACT',
			'termOfService.privacyPolicy.section6Body' => '📩 For inquiries: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Terms of Service',
			'termOfService.termsOfService.lastUpdated' => 'Last Updated: 2026',
			'termOfService.termsOfService.intro' => 'These Terms govern the use of the ChatFace mobile application. By using the app, you agree to these Terms.',
			'termOfService.termsOfService.disclaimer' => 'Disclaimer: ChatFace is an AI video interaction app. It does not provide legal, academic, medical, or professional consulting services.',
			'termOfService.termsOfService.section1Title' => '1. SCOPE OF SERVICE',
			'termOfService.termsOfService.section1Body' => 'ChatFace provides AI-powered video interaction experiences:\n\n• AI video calling and conversation.\n• Personalized interaction preferences.\n• Access to interaction history and records.\n\nServices do not constitute official opinions or professional guidance guarantees.',
			'termOfService.termsOfService.section2Title' => '2. CONDITIONS OF USE',
			'termOfService.termsOfService.section2Body' => '• You must be at least 18 years old (Under 18 access is prohibited).\n• You must provide accurate account information.\n• The app must be used for legal and personal purposes only.',
			'termOfService.termsOfService.section3Title' => '3. PROHIBITED USES',
			'termOfService.termsOfService.section3Body' => 'Impersonation, hate speech, endangering child safety, security breach attempts, and manipulation of AI systems are strictly prohibited.',
			'termOfService.termsOfService.section4Title' => '4. SUBSCRIPTIONS AND PAYMENTS',
			'termOfService.termsOfService.section4Body' => 'Premium features are subject to App Store and Google Play policies. Subscription cancellations and refunds are managed via the respective store settings.',
			'termOfService.termsOfService.section5Title' => '5. CONTENT DISCLAIMER',
			'termOfService.termsOfService.section5Body' => 'Content is AI-generated and does not replace professional advice. ChatFace does not guarantee accuracy or fitness for a particular purpose.',
			'termOfService.termsOfService.section6Title' => '6. INTELLECTUAL PROPERTY',
			'termOfService.termsOfService.section6Body' => 'All content including design, software, and algorithms belongs to ChatFace. Unauthorized reproduction or redistribution is prohibited.',
			'termOfService.termsOfService.section7Title' => '7. GOVERNING LAW',
			'termOfService.termsOfService.section7Body' => 'These Terms are governed by the laws of the Republic of Turkey. Istanbul Central Courts shall have jurisdiction over disputes.',
			'termOfService.termsOfService.section8Title' => '8. CONTACT',
			'termOfService.termsOfService.section8Body' => '📩 For inquiries: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Cookie Policy',
			'termOfService.cookiePolicy.lastUpdated' => 'Last Updated: 2026',
			'termOfService.cookiePolicy.intro' => 'Welcome to ChatFace. Digital helper technologies are used to make your AI video call experience smoother, more secure, and personalized.',
			'termOfService.cookiePolicy.important' => 'This policy explains what cookies are, their purposes, and how you can manage your preferences.',
			'termOfService.cookiePolicy.section1Title' => '1. WHAT ARE COOKIES?',
			'termOfService.cookiePolicy.section1Body' => 'Cookies are small data files placed on your device. They do not identify you directly; they act as digital notes that remember:\n• Call and language settings\n• Session and performance preferences.',
			'termOfService.cookiePolicy.section2Title' => '2. WHICH TECHNOLOGIES DO WE USE?',
			'termOfService.cookiePolicy.section2Body' => 'Strictly Necessary Technologies\nRequired for session management and security controls. The app may not function properly without these components.\n\nPerformance and Analytics\nHelps us understand which stories are read and which areas need improvement. Data is evaluated anonymously.\n\nPersonalization\nRemembers settings like language preference and reading level to provide a tailored experience for the child.',
			'termOfService.cookiePolicy.section3Title' => '3. WHY DO WE USE THESE TECHNOLOGIES?',
			'termOfService.cookiePolicy.section3Body' => '• To ensure the app runs safely and smoothly.\n• To make the reading experience more fluid.\n• To remember repetitive settings.\n• To identify features for future development.',
			'termOfService.cookiePolicy.section4Title' => '4. THIRD-PARTY TECHNOLOGIES',
			'termOfService.cookiePolicy.section4Body' => 'Some technologies may be provided by technical service providers and are subject to their own policies. ChatFace prioritizes data security in these partnerships.',
			'termOfService.cookiePolicy.section5Title' => '5. COOKIE CONTROL AND MANAGEMENT',
			'termOfService.cookiePolicy.section5Body' => 'Users can limit these technologies via device or app settings. Disabling essential technologies may cause issues like being unable to start video calls.',
			'termOfService.cookiePolicy.section6Title' => '6. CONTACT',
			'termOfService.cookiePolicy.section6Body' => '📩 For inquiries: support@fly-work.com',
			'cookies' => 'Cookies Policy',
			'privacy' => 'Privacy Policy',
			'onboarding.step5.permissionRequired' => 'Permission required',
			'onboarding.step5.notNow' => 'Not now',
			'onboarding.step5.openSettings' => 'Open settings',
			'onboarding.step5.title' => 'Permissions',
			'onboarding.step5.permission1' => 'Camera Access',
			'onboarding.step5.permission1Subtitle' => 'Allow Camera Access',
			'onboarding.step5.permission2' => 'Microphone Access',
			'onboarding.step5.permission2Subtitle' => 'Allow Microphone Access',
			'onboarding.step5.permission3' => 'Location Access',
			'onboarding.step5.permission3Subtitle' => 'Allow Location Access',
			'onboarding.step1.title' => 'What is your Name?',
			'onboarding.step1.subtitle' => 'Please enter your name',
			'onboarding.step1.hint' => 'Full Name',
			'onboarding.step2.title' => 'What is your Age?',
			'onboarding.step2.subtitle' => 'You must be at least 18 years old to register.',
			'onboarding.step3.title' => 'What is your Gender?',
			'onboarding.step3.subtitle' => 'Please select your gender',
			'onboarding.step3.male' => 'Male',
			'onboarding.step3.female' => 'Female',
			'onboarding.step3.dontWantToMention' => 'I don\'t want to mention it.',
			'onboarding.step4.title' => 'Have Fun While \nStaying Safe',
			'onboarding.step4.entry1' => 'We Maintain Order',
			'onboarding.step4.subentry1' => 'Real-time AI Monitoring Open',
			'onboarding.step4.entry2' => 'Screen Recordings',
			'onboarding.step4.subentry2' => 'No Recording Without Consent',
			'onboarding.step4.entry3' => '24/7 Support',
			'onboarding.step4.subentry3' => 'Complaints Are Reviewed At Any Time Of The Day',
			'onboarding.step4.entry4' => '18+ only',
			'onboarding.step4.subentry4' => 'Not Suitable For Minors',
			'onboarding.step4.communityRules' => 'Community Rules',
			'onboarding.loading.titlePart1' => 'Your Personal Account is\n',
			'onboarding.loading.titlePart2' => 'Being Created',
			'onboarding.loading.subtitle' => 'Please wait, your profile is being prepared.',
			'onboarding.allowAccess' => 'Allow Access',
			'onboarding.iUnderstand' => 'I Understand',
			'pressBackAgainToExit' => 'Press back again to exit',
			'splash.screen1.title' => 'The New Face of Video \nChat with AI',
			'splash.screen1.description' => 'Turn on your camera and talk face-to-face with AI. Experience more natural communication that understands facial expressions, tone of voice, and context.',
			'splash.screen2.title' => 'Real-Time and Natural \nCommunication',
			'splash.screen2.description' => 'Don\'t be limited to text. Have more fluid, more human conversations through video calls.',
			'auth.google' => 'Continue with Google',
			'auth.facebook' => 'Continue with Facebook',
			'auth.apple' => 'Continue with Apple',
			'auth.guest' => 'Continue as Guest',
			'auth.signInFailed' => ({required Object error}) => 'Sign-in failed: ${error}',
			'home.seeAll' => 'See All',
			'home.more' => 'More',
			'home.online' => 'Online',
			'home.offline' => 'Offline',
			'home.placeholders.fashionDesigner' => 'Fashion Designer',
			'home.placeholders.comedian' => 'Comedian',
			'home.placeholders.influencer' => 'Influencer',
			'home.placeholders.teacher' => 'Teacher',
			'home.placeholders.friend' => 'Friend',
			'characters.all' => 'All',
			'characters.favorites' => 'Favorites',
			'characters.recent' => 'Recent',
			'characters.characters' => 'Characters',
			'characters.placeholderSubtitle' => 'Product Designer who focuses on simplicity & usability.',
			'characters.characterDetails.videoCall' => 'Video Call',
			'characters.characterDetails.message' => 'Message',
			'characters.characterDetails.voiceCall' => 'Voice Call',
			'notifications.today' => 'Today',
			'notifications.yesterday' => 'Yesterday',
			'notifications.weekAgo' => ({required Object week}) => '${week} week ago',
			'notifications.monthAgo' => ({required Object month}) => '${month} month ago',
			'notifications.yearAgo' => ({required Object year}) => '${year} year ago',
			'notifications.noNotifications' => 'No notifications yet.',
			'notifications.noNotificationsSubtitle' => 'Don\'t forget to check again when you receive the notification.',
			'notifications.allDeleted' => 'All notifications have been successfully deleted',
			'videoChat.networkHiccup' => 'Network hiccup detected. Reconnecting mic...',
			'videoChat.failedToUpdateFollow' => 'Failed to update follow status.',
			'videoChat.connecting' => 'Connecting...',
			'videoChat.callEnded' => 'Call Ended',
			'videoChat.callFailed' => ({required Object error}) => 'Call Failed: ${error}',
			'videoChat.mute' => 'Mute',
			'videoChat.unmute' => 'Unmute',
			'videoChat.endCall' => 'End Call',
			'videoChat.swipeToChat' => 'Swipe to Chat',
			'videoChat.male' => 'Male',
			'videoChat.female' => 'Female',
			'videoChat.country' => 'Country',
			'videoChat.follow' => 'Follow',
			'videoChat.unfollow' => 'Unfollow',
			'videoChat.callEndedMessage' => 'The video call has ended.',
			'videoChat.swipeForNewChat' => 'Swipe for a new chat',
			'voiceChat.connecting' => 'Connecting...',
			'voiceChat.callEnded' => 'Call Ended',
			'voiceChat.callFailed' => ({required Object error}) => 'Call Failed: ${error}',
			'voiceChat.calling' => 'Calling...',
			'chat.message' => 'Message',
			'chat.history' => 'History',
			'chat.noMessages' => 'No messages yet.',
			'chat.noMessagesSubtitle' => 'Start a conversation by sending a message.',
			'chat.online' => 'Online',
			'chat.offline' => 'Offline',
			'chat.gallery' => 'Gallery',
			'chat.camera' => 'Camera',
			'chat.typeAMessage' => 'Type a message...',
			'chat.pleaseUpgrade' => 'Please upgrade to pro version.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Voice call ended',
			'chat.videoCallEnded' => 'Video call ended',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'About Me',
			'editProfile.aboutMeHint' => 'Write something about yourself',
			'editProfile.fullName' => 'Full Name',
			'editProfile.gender' => 'Gender',
			'editProfile.male' => 'Male',
			'editProfile.female' => 'Female',
			'editProfile.dontWantToMention' => 'I don\'t want to mention it.',
			'editProfile.country' => 'Country',
			'editProfile.languagePreferences' => 'Language Preferences',
			'editProfile.selectLanguage' => 'Add your preferred language',
			'editProfile.saved' => 'Saved',
			'editProfile.changesSaved' => 'Changes have been saved.',
			'settingsSupport.title' => 'Settings & Support',
			'settingsSupport.premiumTitle' => 'Unlimited access \nto all features',
			'settingsSupport.getPremium' => 'Get Premium',
			'settingsSupport.settingsHub' => 'Settings Hub',
			'settingsSupport.shareTheApp' => 'Share the App',
			'settingsSupport.rateUs' => 'Rate Us',
			'settingsSupport.version' => 'Version',
			'settingsSupport.notifications' => 'Notifications',
			'settingsSupport.accountManagement' => 'Account Management',
			'settingsSupport.deleteAccount' => 'Delete Account',
			'settingsSupport.logOut' => 'Log Out',
			'settingsSupport.logOutTitle' => 'You are about to log out',
			'settingsSupport.logOutSubtitle' => 'See you again soon! \n We’ll miss you.',
			'deleteAccount.title' => 'Delete Account',
			'deleteAccount.warning' => 'Are you sure you want to delete your account?',
			'deleteAccount.description' => 'This action cannot be undone, and all your history and data will be permanently deleted.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Account deletion failed: ${error}',
			'deleteAccount.steps.step1.title' => 'We don\'t want you to go, but we understand.',
			'deleteAccount.steps.step1.subtitle' => 'Can you tell us why you want to leave so we can improve the ChatFace experience?',
			'deleteAccount.steps.step1.option1' => 'I didn\'t find the AI characters realistic.',
			'deleteAccount.steps.step1.option2' => 'I am experiencing technical issues with video chats.',
			'deleteAccount.steps.step1.option3' => 'Subscription prices are above my expectations.',
			'deleteAccount.steps.step1.option4' => 'I couldn\'t find the type of characters I was looking for.',
			'deleteAccount.steps.step1.option5' => 'I just wanted to try it out for a short time.',
			'deleteAccount.steps.step1.option6' => 'Other',
			'deleteAccount.steps.step2.title' => 'If you delete your account, you will say goodbye to:',
			'deleteAccount.steps.step2.subtitle1' => 'Deep Connections and Memory:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'The characters you chat with will completely forget their past with you, your shared secrets, and your personal habits.',
			'deleteAccount.steps.step2.subtitle2' => 'Video Call Privilege:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'You will lose the right to communicate face-to-face with your AI partners, who are available to you anytime.',
			'deleteAccount.steps.step2.subtitle3' => 'Advanced Algorithm:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Your \'Just for You\' character matches tailored to your preferences will be reset.',
			'deleteAccount.steps.step2.subtitle4' => 'Profile Data:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Your earned achievements, unlocked special characters, and chat history will be irreversibly deleted.',
			'deleteAccount.steps.step3.title' => 'We have a special offer for you before you go!',
			'deleteAccount.steps.step3.description' => 'Maybe you just need a little more time or a better deal. Instead of deleting your account, would you consider these?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Keeping you with us is valuable. ${offer} on your next subscription! Would you like to continue with this offer?',
			'deleteAccount.steps.step3.description1Offer' => 'We\'ve applied a 50% discount',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'We have given you ${offer} credits so you can see new characters you haven\'t discovered yet.',
			'deleteAccount.steps.step3.description2Offer' => '3 free video calls',
			'deleteAccount.steps.step3.acceptOffer' => 'Accept 50% Discount Offer',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Delete My Account',
			'cancel' => 'Cancel',
			'delete' => 'Delete',
			'premium' => 'Premium',
			'profileEdit' => 'Profile Edit',
			'settings' => 'Settings',
			'undo' => 'Undo',
			'successfully' => 'Successfully',
			'save' => 'Save',
			'languageOptions.english' => 'English',
			'languageOptions.chinese' => 'Chinese',
			'languageOptions.german' => 'German',
			'languageOptions.italian' => 'Italian',
			'languageOptions.french' => 'French',
			'languageOptions.japanese' => 'Japanese',
			'languageOptions.spanish' => 'Spanish',
			'languageOptions.russian' => 'Russian',
			'languageOptions.turkish' => 'Turkish',
			'languageOptions.korean' => 'Korean',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Portuguese',
			'common.tryAgain' => 'Try Again',
			'common.retry' => 'Retry',
			'common.close' => 'Close',
			'permissionsRequired' => 'Permissions Required',
			'permissionHelper.camAndMicRequired' => 'Camera and microphone permissions are required for video calls. Please enable them in settings.',
			'permissionHelper.micRequired' => 'Microphone permission is required for voice calls. Please enable it in settings.',
			'permissionHelper.cancel' => 'Cancel',
			'permissionHelper.openSettings' => 'Open Settings',
			'videoView.title' => 'Camera filters',
			'videoView.subtitle' => 'Choose the look for your camera preview.',
			'videoView.errorLoad' => 'Failed to load companions: ',
			'videoView.noComps' => 'No companions available yet.',
			'videoView.filters.ORIGINAL' => 'Original',
			'videoView.filters.ADDICTIVE_BLUE' => 'Addictive Blue',
			'videoView.filters.ADDICTIVE_RED' => 'Addictive Red',
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
