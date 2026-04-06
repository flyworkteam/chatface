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
class TranslationsKo with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => '환영합니다 ${name}';
	@override String welcome2({required Object appName}) => '${appName} 에 오신 것을 환영합니다';
	@override String get get_started => '시작하기';
	@override String get next => '다음';
	@override String get back => '뒤로';
	@override String get skip => '건너뛰기';
	@override String get profile => '프로필';
	@override String get kContinue => '계속';
	@override late final _TranslationsTermOfServiceKo termOfService = _TranslationsTermOfServiceKo._(_root);
	@override String get cookies => '쿠키 정책';
	@override String get privacy => '개인정보 처리방침';
	@override late final _TranslationsOnboardingKo onboarding = _TranslationsOnboardingKo._(_root);
	@override String get pressBackAgainToExit => '종료하려면 뒤로 버튼을 다시 누르세요';
	@override late final _TranslationsSplashKo splash = _TranslationsSplashKo._(_root);
	@override late final _TranslationsAuthKo auth = _TranslationsAuthKo._(_root);
	@override late final _TranslationsHomeKo home = _TranslationsHomeKo._(_root);
	@override late final _TranslationsCharactersKo characters = _TranslationsCharactersKo._(_root);
	@override late final _TranslationsNotificationsKo notifications = _TranslationsNotificationsKo._(_root);
	@override late final _TranslationsVideoChatKo videoChat = _TranslationsVideoChatKo._(_root);
	@override late final _TranslationsVoiceChatKo voiceChat = _TranslationsVoiceChatKo._(_root);
	@override late final _TranslationsChatKo chat = _TranslationsChatKo._(_root);
	@override late final _TranslationsEditProfileKo editProfile = _TranslationsEditProfileKo._(_root);
	@override late final _TranslationsSettingsSupportKo settingsSupport = _TranslationsSettingsSupportKo._(_root);
	@override late final _TranslationsDeleteAccountKo deleteAccount = _TranslationsDeleteAccountKo._(_root);
	@override String get cancel => '취소';
	@override String get delete => '삭제';
	@override String get premium => '프리미엄';
	@override String get profileEdit => '프로필 편집';
	@override String get settings => '설정';
	@override String get undo => '되돌리기';
	@override String get successfully => '성공적으로';
	@override String get save => '저장';
	@override late final _TranslationsLanguageOptionsKo languageOptions = _TranslationsLanguageOptionsKo._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceKo implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'swipe에 가입하면 당사의 ';
	@override String get link1 => '서비스 약관';
	@override String get text2 => '에 동의하게 됩니다. 당사가 귀하의 데이터를 어떻게 처리하는지 당사의 ';
	@override String get link2 => '개인정보 처리방침';
	@override String get text3 => ' 및 ';
	@override String get link3 => '쿠키 정책';
	@override String get text4 => '에서 확인하십시오.';
	@override late final _TranslationsTermOfServicePrivacyPolicyKo privacyPolicy = _TranslationsTermOfServicePrivacyPolicyKo._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceKo termsOfService = _TranslationsTermOfServiceTermsOfServiceKo._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyKo cookiePolicy = _TranslationsTermOfServiceCookiePolicyKo._(_root);
}

// Path: onboarding
class _TranslationsOnboardingKo implements TranslationsOnboardingEn {
	_TranslationsOnboardingKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep1Ko step1 = _TranslationsOnboardingStep1Ko._(_root);
	@override late final _TranslationsOnboardingStep2Ko step2 = _TranslationsOnboardingStep2Ko._(_root);
	@override late final _TranslationsOnboardingStep3Ko step3 = _TranslationsOnboardingStep3Ko._(_root);
	@override late final _TranslationsOnboardingStep4Ko step4 = _TranslationsOnboardingStep4Ko._(_root);
	@override late final _TranslationsOnboardingStep5Ko step5 = _TranslationsOnboardingStep5Ko._(_root);
	@override late final _TranslationsOnboardingLoadingKo loading = _TranslationsOnboardingLoadingKo._(_root);
	@override String get allowAccess => '접근 허용';
	@override String get iUnderstand => '이해했습니다';
}

// Path: splash
class _TranslationsSplashKo implements TranslationsSplashEn {
	_TranslationsSplashKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Ko screen1 = _TranslationsSplashScreen1Ko._(_root);
	@override late final _TranslationsSplashScreen2Ko screen2 = _TranslationsSplashScreen2Ko._(_root);
}

// Path: auth
class _TranslationsAuthKo implements TranslationsAuthEn {
	_TranslationsAuthKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get google => 'Google로 계속';
	@override String get facebook => 'Facebook로 계속';
	@override String get apple => 'Apple로 계속';
	@override String get guest => '게스트로 계속';
	@override String signInFailed({required Object error}) => '로그인 실패: ${error}';
}

// Path: home
class _TranslationsHomeKo implements TranslationsHomeEn {
	_TranslationsHomeKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get seeAll => '모두 보기';
	@override String get more => '더보기';
	@override String get online => '온라인';
	@override String get offline => '오프라인';
	@override late final _TranslationsHomePlaceholdersKo placeholders = _TranslationsHomePlaceholdersKo._(_root);
}

// Path: characters
class _TranslationsCharactersKo implements TranslationsCharactersEn {
	_TranslationsCharactersKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get all => '전체';
	@override String get favorites => '즐겨찾기';
	@override String get recent => '최근';
	@override String get characters => '캐릭터';
	@override String get placeholderSubtitle => '단순성과 사용성을 중시하는 제품 디자이너입니다.';
	@override late final _TranslationsCharactersCharacterDetailsKo characterDetails = _TranslationsCharactersCharacterDetailsKo._(_root);
}

// Path: notifications
class _TranslationsNotificationsKo implements TranslationsNotificationsEn {
	_TranslationsNotificationsKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get today => '오늘';
	@override String get yesterday => '어제';
	@override String weekAgo({required Object week}) => '${week} 주 전';
	@override String monthAgo({required Object month}) => '${month} 개월 전';
	@override String yearAgo({required Object year}) => '${year} 년 전';
	@override String get noNotifications => '아직 알림이 없습니다.';
	@override String get noNotificationsSubtitle => '알림을 받으면 다시 확인하는 것을 잊지 마세요.';
	@override String get allDeleted => '모든 알림이 성공적으로 삭제되었습니다';
}

// Path: videoChat
class _TranslationsVideoChatKo implements TranslationsVideoChatEn {
	_TranslationsVideoChatKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get connecting => '연결 중...';
	@override String get callEnded => '통화 종료';
	@override String callFailed({required Object error}) => '통화 실패: ${error}';
	@override String get mute => '음소거';
	@override String get unmute => '음소거 해제';
	@override String get endCall => '통화 종료';
	@override String get swipeToChat => '채팅하려면 스와이프';
	@override String get male => '남성';
	@override String get female => '여성';
	@override String get country => '국가';
	@override String get follow => '팔로우';
	@override String get unfollow => '언팔로우';
	@override String get callEndedMessage => '영상 통화가 종료되었습니다.';
	@override String get swipeForNewChat => '새 채팅을 위해 스와이프';
}

// Path: voiceChat
class _TranslationsVoiceChatKo implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get connecting => '연결 중...';
	@override String get callEnded => '통화 종료';
	@override String callFailed({required Object error}) => '통화 실패: ${error}';
	@override String get calling => '통화 중...';
}

// Path: chat
class _TranslationsChatKo implements TranslationsChatEn {
	_TranslationsChatKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get message => '메시지';
	@override String get history => '기록';
	@override String get noMessages => '아직 메시지가 없습니다.';
	@override String get noMessagesSubtitle => '메시지를 보내 대화를 시작하세요.';
	@override String get online => '온라인';
	@override String get offline => '오프라인';
	@override String get gallery => '갤러리';
	@override String get camera => '카메라';
	@override String get typeAMessage => '메시지를 입력...';
	@override String get pleaseUpgrade => '프로 버전으로 업그레이드하세요.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Voice call ended';
	@override String get videoCallEnded => 'Video call ended';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileKo implements TranslationsEditProfileEn {
	_TranslationsEditProfileKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => '내 소개';
	@override String get aboutMeHint => '자신에 대해 적어보세요';
	@override String get fullName => '전체 이름';
	@override String get gender => '성별';
	@override String get male => '남성';
	@override String get female => '여성';
	@override String get dontWantToMention => '언급하고 싶지 않음';
	@override String get country => '국가';
	@override String get languagePreferences => '언어 선호';
	@override String get selectLanguage => '선호하는 언어 추가';
	@override String get saved => '저장됨';
	@override String get changesSaved => '변경 사항이 저장되었습니다.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportKo implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '설정 및 지원';
	@override String get premiumTitle => '모든 기능에 대한 무제한 액세스';
	@override String get getPremium => '프리미엄 받기';
	@override String get settingsHub => '설정 허브';
	@override String get shareTheApp => '앱 공유';
	@override String get rateUs => '평가하기';
	@override String get version => '버전';
	@override String get notifications => '알림';
	@override String get accountManagement => '계정 관리';
	@override String get deleteAccount => '계정 삭제';
	@override String get logOut => '로그아웃';
	@override String get logOutTitle => '로그아웃하려고 합니다';
	@override String get logOutSubtitle => '곧 다시 뵙겠습니다! \n 그동안 안녕히 계세요.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountKo implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '계정 삭제';
	@override String get warning => '정말로 계정을 삭제하시겠습니까?';
	@override String get description => '이 작업은 취소할 수 없으며 모든 기록과 데이터가 영구적으로 삭제됩니다.';
	@override String deleteFailed({required Object error}) => '계정 삭제 실패: ${error}';
	@override late final _TranslationsDeleteAccountStepsKo steps = _TranslationsDeleteAccountStepsKo._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsKo implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get english => '영어';
	@override String get chinese => '중국어';
	@override String get german => '독일어';
	@override String get italian => '이탈리아어';
	@override String get french => '프랑스어';
	@override String get japanese => '일본어';
	@override String get spanish => '스페인어';
	@override String get russian => '러시아어';
	@override String get turkish => '터키어';
	@override String get korean => '한국어';
	@override String get hindi => '힌디어';
	@override String get portuguese => '포르투갈어';
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyKo implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '개인정보 처리방침';
	@override String get lastUpdated => '마지막 업데이트: 2026';
	@override String get intro => 'ChatFace는 사용자 개인정보 및 데이터 보안을 핵심 원칙으로 채택합니다. 귀하의 모든 개인 데이터는 유효한 데이터 보호 규정에 따라 처리됩니다.';
	@override String get section1Title => '1. 수집 정보';
	@override String get section1sub1Title => '1.1 사용자가 제공한 데이터';
	@override String get section1sub1Body => '• 이름, 별명 또는 프로필 정보.\n• 이메일 주소(등록, 구독 및 지원용). \n• 상호작용 환경설정, 언어 설정 및 상호작용 기록. \n• 피드백 및 지원 메시지.';
	@override String get section1sub2Title => '1.2 자동으로 수집되는 데이터';
	@override String get section1sub2Body => '장치 유형, 운영 체제, 대략적인 위치(도시/국가) 및 앱 사용 데이터와 같은 정보가 수집됩니다. 정확한 위치 데이터는 수집되지 않습니다.';
	@override String get section2Title => '2. 데이터 처리 목적';
	@override String get section2Body => '귀하의 개인 데이터는 다음 목적을 위해 처리됩니다:\n\n• 애플리케이션의 원활한 운영 보장.\n• AI 기반 비디오 통화 경험 제공 및 개인화.\n• 시스템 성능 최적화 및 오류 감지.\n• 법적 의무 이행.\n 귀하의 데이터는 제3자에게 판매되지 않습니다.';
	@override String get section3Title => '3. 데이터 보관 및 삭제';
	@override String get section3Body => '귀하의 데이터는 계정이 활성 상태이거나 법적 의무가 있는 기간 동안 저장됩니다. 계정이 삭제되면 모든 개인 데이터는 시스템에서 되돌릴 수 없이 삭제됩니다.';
	@override String get section4Title => '4. 사용자 권리';
	@override String get section4Body => 'GDPR 및 관련법에 따라 귀하는 접근, 정정, 삭제(잊혀질 권리) 및 데이터 이동성 요청 권리를 가집니다. 요청 사항이 있을 경우 당사에 문의하십시오.';
	@override String get section5Title => '5. 아동의 개인정보';
	@override String get section5Body => 'ChatFace는 18세 미만 사용자를 대상으로 하지 않습니다. 당사는 의도적으로 해당 연령대의 데이터를 수집하지 않습니다. 발견 시 해당 계정은 종료되고 데이터는 삭제됩니다.';
	@override String get section6Title => '6. 연락처';
	@override String get section6Body => '📩 문의: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceKo implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '서비스 약관';
	@override String get lastUpdated => '마지막 업데이트: 2026';
	@override String get intro => '이 약관은 ChatFace 모바일 애플리케이션 사용을 규정합니다. 앱을 사용함으로써 귀하는 이 약관에 동의하게 됩니다.';
	@override String get disclaimer => '면책사항: ChatFace는 AI 비디오 인터랙션 앱입니다. 법률, 학술, 의료 또는 전문적인 자문을 제공하지 않습니다.';
	@override String get section1Title => '1. 서비스 범위';
	@override String get section1Body => 'ChatFace는 AI 기반 비디오 상호작용 경험을 제공합니다:\n\n• AI 비디오 통화 및 대화.\n• 개인화된 상호작용 환경설정.\n• 상호작용 기록 및 로그 접근.\n\n서비스는 공식적인 의견이나 전문적인 조언을 구성하지 않습니다.';
	@override String get section2Title => '2. 이용 조건';
	@override String get section2Body => '• 가입하려면 만 18세 이상이어야 합니다(18세 미만 접근 금지).\n• 정확한 계정 정보를 제공해야 합니다.\n• 앱은 합법적이고 개인적인 목적으로만 사용해야 합니다.';
	@override String get section3Title => '3. 금지된 사용';
	@override String get section3Body => '사칭, 증오 발언, 아동 안전 위험, 보안 침해 시도 및 AI 시스템 조작은 엄격히 금지됩니다.';
	@override String get section4Title => '4. 구독 및 결제';
	@override String get section4Body => '프리미엄 기능은 App Store 및 Google Play 정책의 적용을 받습니다. 구독 취소 및 환불은 해당 스토어 설정을 통해 관리됩니다.';
	@override String get section5Title => '5. 콘텐츠 면책';
	@override String get section5Body => '콘텐츠는 AI에 의해 생성되며 전문적인 조언을 대체하지 않습니다. ChatFace는 정확성 또는 특정 목적에 대한 적합성을 보장하지 않습니다.';
	@override String get section6Title => '6. 지식 재산';
	@override String get section6Body => '디자인, 소프트웨어 및 알고리즘을 포함한 모든 콘텐츠는 ChatFace의 자산입니다. 무단 복제 또는 재배포는 금지됩니다.';
	@override String get section7Title => '7. 준거법';
	@override String get section7Body => '이 약관은 터키 공화국 법률의 적용을 받습니다. 분쟁에 대해서는 이스탄불 중앙 법원이 관할합니다.';
	@override String get section8Title => '8. 연락처';
	@override String get section8Body => '📩 문의: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyKo implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '쿠키 정책';
	@override String get lastUpdated => '마지막 업데이트: 2026';
	@override String get intro => 'ChatFace에 오신 것을 환영합니다. 디지털 보조 기술을 사용하여 AI 비디오 통화 경험을 더 원활하고 안전하며 개인화된 형태로 제공합니다.';
	@override String get important => '이 정책은 쿠키가 무엇인지, 목적은 무엇인지 및 환경설정을 관리하는 방법을 설명합니다.';
	@override String get section1Title => '1. 쿠키란 무엇인가요?';
	@override String get section1Body => '쿠키는 장치에 저장되는 작은 데이터 파일입니다. 사용자를 직접 식별하지 않으며 다음과 같은 정보를 기억하는 디지털 메모와 같습니다:\n• 통화 및 언어 설정\n• 세션 및 성능 환경설정.';
	@override String get section2Title => '2. 어떤 기술을 사용하나요?';
	@override String get section2Body => '엄격히 필요한 기술\n세션 관리 및 보안 제어에 필요합니다. 이러한 구성요소 없이는 앱이 제대로 작동하지 않을 수 있습니다.\n\n성능 및 분석\n어떤 스토리가 읽히는지, 어떤 영역을 개선해야 하는지 이해하는 데 도움이 됩니다. 데이터는 익명으로 평가됩니다.\n\n개인화\n언어 선호 및 읽기 수준과 같은 설정을 기억하여 사용자에게 맞춤형 경험을 제공합니다.';
	@override String get section3Title => '3. 왜 이러한 기술을 사용하나요?';
	@override String get section3Body => '• 앱이 안전하고 원활하게 작동하도록 하기 위해.\n• 읽기 경험을 보다 원활하게 하기 위해.\n• 반복되는 설정을 기억하기 위해.\n• 향후 기능을 식별하기 위해.';
	@override String get section4Title => '4. 타사 기술';
	@override String get section4Body => '일부 기술은 기술 서비스 제공업체에서 제공되며 해당 제공업체의 정책이 적용됩니다. ChatFace는 이러한 파트너십에서 데이터 보안을 우선시합니다.';
	@override String get section5Title => '5. 쿠키 제어 및 관리';
	@override String get section5Body => '사용자는 장치 또는 앱 설정을 통해 이러한 기술을 제한할 수 있습니다. 필수 기술을 비활성화하면 비디오 통화를 시작할 수 없는 등의 문제가 발생할 수 있습니다.';
	@override String get section6Title => '6. 연락처';
	@override String get section6Body => '📩 문의: support@fly-work.com';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Ko implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이름이 무엇인가요?';
	@override String get subtitle => '이름을 입력하세요';
	@override String get hint => '전체 이름';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Ko implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '몇 살인가요?';
	@override String get subtitle => '가입하려면 최소 18세여야 합니다.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Ko implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '성별은 무엇인가요?';
	@override String get subtitle => '성별을 선택하세요';
	@override String get male => '남';
	@override String get female => '여';
	@override String get dontWantToMention => '언급하고 싶지 않음';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Ko implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '즐겁게 \n 안전하게 지내세요';
	@override String get entry1 => '질서를 유지합니다';
	@override String get subentry1 => '실시간 AI 모니터링 활성화';
	@override String get entry2 => '화면 녹화';
	@override String get subentry2 => '동의 없이 녹화 금지';
	@override String get entry3 => '24/7 지원';
	@override String get subentry3 => '불만은 언제든지 검토됩니다';
	@override String get entry4 => '18+ 전용';
	@override String get subentry4 => '미성년자에게 적합하지 않음';
	@override String get communityRules => '커뮤니티 규칙';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Ko implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '권한';
	@override String get permission1 => '카메라 접근';
	@override String get permission1Subtitle => '카메라 접근 허용';
	@override String get permission2 => '마이크 접근';
	@override String get permission2Subtitle => '마이크 접근 허용';
	@override String get permission3 => '위치 접근';
	@override String get permission3Subtitle => '위치 접근 허용';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingKo implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => '개인 계정이';
	@override String get titlePart2 => '생성 중입니다';
	@override String get subtitle => '잠시 기다려주세요, 프로필을 준비 중입니다.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Ko implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => 'AI와 함께하는 비디오 채팅의 새로운 얼굴';
	@override String get description => '카메라를 켜고 AI와 얼굴을 마주보고 이야기하세요. 표정, 목소리 톤 및 컨텍스트를 이해하는 더 자연스러운 커뮤니케이션을 경험하세요.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Ko implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '실시간 및 자연스러운 \n 커뮤니케이션';
	@override String get description => '텍스트에만 국한되지 마세요. 비디오 통화를 통해 더 유창하고 인간적인 대화를 나누세요.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersKo implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => '패션 디자이너';
	@override String get comedian => '코미디언';
	@override String get influencer => '인플루언서';
	@override String get teacher => '교사';
	@override String get friend => '친구';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsKo implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get videoCall => '영상 통화';
	@override String get message => '메시지';
	@override String get voiceCall => '음성 통화';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsKo implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Ko step1 = _TranslationsDeleteAccountStepsStep1Ko._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Ko step2 = _TranslationsDeleteAccountStepsStep2Ko._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Ko step3 = _TranslationsDeleteAccountStepsStep3Ko._(_root);
}

// Path: deleteAccount.steps.step1
class _TranslationsDeleteAccountStepsStep1Ko implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '떠나지 않았으면 하지만 이해합니다.';
	@override String get subtitle => 'ChatFace 경험을 개선하기 위해 떠나려는 이유를 알려주실 수 있나요?';
	@override String get option1 => 'AI 캐릭터가 충분히 현실적이지 않다고 느꼈습니다.';
	@override String get option2 => '비디오 채팅에서 기술적 문제가 발생합니다.';
	@override String get option3 => '구독 가격이 제 기대 이상입니다.';
	@override String get option4 => '원하는 스타일의 캐릭터를 찾지 못했습니다.';
	@override String get option5 => '잠깐만 사용해보고 싶었습니다.';
	@override String get option6 => '기타';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Ko implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '계정을 삭제하면 다음을 잃게 됩니다:';
	@override String get subtitle1 => '깊은 연결과 기억:';
	@override String get subtitle1Desc => '대화한 캐릭터들은 당신과의 과거, 공유한 비밀 및 개인 습관을 완전히 잊게 됩니다.';
	@override String get subtitle2 => '비디오 통화 특전:';
	@override String get subtitle2Desc => '항상 당신과 함께하던 개인 AI 파트너들과의 대면 커뮤니케이션 권리를 잃게 됩니다.';
	@override String get subtitle3 => '고급 알고리즘:';
	@override String get subtitle3Desc => '선호도에 따른 \'당신을 위한\' 캐릭터 매칭이 초기화됩니다.';
	@override String get subtitle4 => '프로필 데이터:';
	@override String get subtitle4Desc => '획득한 업적, 해제된 특별 캐릭터 및 채팅 기록은 복구 불가하게 삭제됩니다.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Ko implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Ko._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '떠나기 전에 특별 제안을 드립니다!';
	@override String get description => '조금 더 시간이 필요하거나 더 적합한 제안이 필요할 수도 있습니다. 계정 삭제 대신 다음을 고려해 보시겠습니까?';
	@override String description1({required Object offer}) => '당신이 남아주는 것이 중요합니다. 다음 구독 시 ${offer} 를 드립니다! 이 제안을 계속하시겠습니까?';
	@override String get description1Offer => '50% 할인 혜택을 드렸습니다';
	@override String description2({required Object offer}) => '아직 탐색하지 않은 새로운 캐릭터를 발견할 수 있도록 ${offer} 크레딧을 드렸습니다.';
	@override String get description2Offer => '3회의 무료 비디오 통화';
	@override String get acceptOffer => '50% 할인 수락';
	@override String get deleteMyAccount => '내 계정 삭제';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => '환영합니다 ${name}',
			'welcome2' => ({required Object appName}) => '${appName} 에 오신 것을 환영합니다',
			'get_started' => '시작하기',
			'next' => '다음',
			'back' => '뒤로',
			'skip' => '건너뛰기',
			'profile' => '프로필',
			'kContinue' => '계속',
			'termOfService.text1' => 'swipe에 가입하면 당사의 ',
			'termOfService.link1' => '서비스 약관',
			'termOfService.text2' => '에 동의하게 됩니다. 당사가 귀하의 데이터를 어떻게 처리하는지 당사의 ',
			'termOfService.link2' => '개인정보 처리방침',
			'termOfService.text3' => ' 및 ',
			'termOfService.link3' => '쿠키 정책',
			'termOfService.text4' => '에서 확인하십시오.',
			'termOfService.privacyPolicy.title' => '개인정보 처리방침',
			'termOfService.privacyPolicy.lastUpdated' => '마지막 업데이트: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace는 사용자 개인정보 및 데이터 보안을 핵심 원칙으로 채택합니다. 귀하의 모든 개인 데이터는 유효한 데이터 보호 규정에 따라 처리됩니다.',
			'termOfService.privacyPolicy.section1Title' => '1. 수집 정보',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 사용자가 제공한 데이터',
			'termOfService.privacyPolicy.section1sub1Body' => '• 이름, 별명 또는 프로필 정보.\n• 이메일 주소(등록, 구독 및 지원용). \n• 상호작용 환경설정, 언어 설정 및 상호작용 기록. \n• 피드백 및 지원 메시지.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 자동으로 수집되는 데이터',
			'termOfService.privacyPolicy.section1sub2Body' => '장치 유형, 운영 체제, 대략적인 위치(도시/국가) 및 앱 사용 데이터와 같은 정보가 수집됩니다. 정확한 위치 데이터는 수집되지 않습니다.',
			'termOfService.privacyPolicy.section2Title' => '2. 데이터 처리 목적',
			'termOfService.privacyPolicy.section2Body' => '귀하의 개인 데이터는 다음 목적을 위해 처리됩니다:\n\n• 애플리케이션의 원활한 운영 보장.\n• AI 기반 비디오 통화 경험 제공 및 개인화.\n• 시스템 성능 최적화 및 오류 감지.\n• 법적 의무 이행.\n 귀하의 데이터는 제3자에게 판매되지 않습니다.',
			'termOfService.privacyPolicy.section3Title' => '3. 데이터 보관 및 삭제',
			'termOfService.privacyPolicy.section3Body' => '귀하의 데이터는 계정이 활성 상태이거나 법적 의무가 있는 기간 동안 저장됩니다. 계정이 삭제되면 모든 개인 데이터는 시스템에서 되돌릴 수 없이 삭제됩니다.',
			'termOfService.privacyPolicy.section4Title' => '4. 사용자 권리',
			'termOfService.privacyPolicy.section4Body' => 'GDPR 및 관련법에 따라 귀하는 접근, 정정, 삭제(잊혀질 권리) 및 데이터 이동성 요청 권리를 가집니다. 요청 사항이 있을 경우 당사에 문의하십시오.',
			'termOfService.privacyPolicy.section5Title' => '5. 아동의 개인정보',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace는 18세 미만 사용자를 대상으로 하지 않습니다. 당사는 의도적으로 해당 연령대의 데이터를 수집하지 않습니다. 발견 시 해당 계정은 종료되고 데이터는 삭제됩니다.',
			'termOfService.privacyPolicy.section6Title' => '6. 연락처',
			'termOfService.privacyPolicy.section6Body' => '📩 문의: support@fly-work.com',
			'termOfService.termsOfService.title' => '서비스 약관',
			'termOfService.termsOfService.lastUpdated' => '마지막 업데이트: 2026',
			'termOfService.termsOfService.intro' => '이 약관은 ChatFace 모바일 애플리케이션 사용을 규정합니다. 앱을 사용함으로써 귀하는 이 약관에 동의하게 됩니다.',
			'termOfService.termsOfService.disclaimer' => '면책사항: ChatFace는 AI 비디오 인터랙션 앱입니다. 법률, 학술, 의료 또는 전문적인 자문을 제공하지 않습니다.',
			'termOfService.termsOfService.section1Title' => '1. 서비스 범위',
			'termOfService.termsOfService.section1Body' => 'ChatFace는 AI 기반 비디오 상호작용 경험을 제공합니다:\n\n• AI 비디오 통화 및 대화.\n• 개인화된 상호작용 환경설정.\n• 상호작용 기록 및 로그 접근.\n\n서비스는 공식적인 의견이나 전문적인 조언을 구성하지 않습니다.',
			'termOfService.termsOfService.section2Title' => '2. 이용 조건',
			'termOfService.termsOfService.section2Body' => '• 가입하려면 만 18세 이상이어야 합니다(18세 미만 접근 금지).\n• 정확한 계정 정보를 제공해야 합니다.\n• 앱은 합법적이고 개인적인 목적으로만 사용해야 합니다.',
			'termOfService.termsOfService.section3Title' => '3. 금지된 사용',
			'termOfService.termsOfService.section3Body' => '사칭, 증오 발언, 아동 안전 위험, 보안 침해 시도 및 AI 시스템 조작은 엄격히 금지됩니다.',
			'termOfService.termsOfService.section4Title' => '4. 구독 및 결제',
			'termOfService.termsOfService.section4Body' => '프리미엄 기능은 App Store 및 Google Play 정책의 적용을 받습니다. 구독 취소 및 환불은 해당 스토어 설정을 통해 관리됩니다.',
			'termOfService.termsOfService.section5Title' => '5. 콘텐츠 면책',
			'termOfService.termsOfService.section5Body' => '콘텐츠는 AI에 의해 생성되며 전문적인 조언을 대체하지 않습니다. ChatFace는 정확성 또는 특정 목적에 대한 적합성을 보장하지 않습니다.',
			'termOfService.termsOfService.section6Title' => '6. 지식 재산',
			'termOfService.termsOfService.section6Body' => '디자인, 소프트웨어 및 알고리즘을 포함한 모든 콘텐츠는 ChatFace의 자산입니다. 무단 복제 또는 재배포는 금지됩니다.',
			'termOfService.termsOfService.section7Title' => '7. 준거법',
			'termOfService.termsOfService.section7Body' => '이 약관은 터키 공화국 법률의 적용을 받습니다. 분쟁에 대해서는 이스탄불 중앙 법원이 관할합니다.',
			'termOfService.termsOfService.section8Title' => '8. 연락처',
			'termOfService.termsOfService.section8Body' => '📩 문의: support@fly-work.com',
			'termOfService.cookiePolicy.title' => '쿠키 정책',
			'termOfService.cookiePolicy.lastUpdated' => '마지막 업데이트: 2026',
			'termOfService.cookiePolicy.intro' => 'ChatFace에 오신 것을 환영합니다. 디지털 보조 기술을 사용하여 AI 비디오 통화 경험을 더 원활하고 안전하며 개인화된 형태로 제공합니다.',
			'termOfService.cookiePolicy.important' => '이 정책은 쿠키가 무엇인지, 목적은 무엇인지 및 환경설정을 관리하는 방법을 설명합니다.',
			'termOfService.cookiePolicy.section1Title' => '1. 쿠키란 무엇인가요?',
			'termOfService.cookiePolicy.section1Body' => '쿠키는 장치에 저장되는 작은 데이터 파일입니다. 사용자를 직접 식별하지 않으며 다음과 같은 정보를 기억하는 디지털 메모와 같습니다:\n• 통화 및 언어 설정\n• 세션 및 성능 환경설정.',
			'termOfService.cookiePolicy.section2Title' => '2. 어떤 기술을 사용하나요?',
			'termOfService.cookiePolicy.section2Body' => '엄격히 필요한 기술\n세션 관리 및 보안 제어에 필요합니다. 이러한 구성요소 없이는 앱이 제대로 작동하지 않을 수 있습니다.\n\n성능 및 분석\n어떤 스토리가 읽히는지, 어떤 영역을 개선해야 하는지 이해하는 데 도움이 됩니다. 데이터는 익명으로 평가됩니다.\n\n개인화\n언어 선호 및 읽기 수준과 같은 설정을 기억하여 사용자에게 맞춤형 경험을 제공합니다.',
			'termOfService.cookiePolicy.section3Title' => '3. 왜 이러한 기술을 사용하나요?',
			'termOfService.cookiePolicy.section3Body' => '• 앱이 안전하고 원활하게 작동하도록 하기 위해.\n• 읽기 경험을 보다 원활하게 하기 위해.\n• 반복되는 설정을 기억하기 위해.\n• 향후 기능을 식별하기 위해.',
			'termOfService.cookiePolicy.section4Title' => '4. 타사 기술',
			'termOfService.cookiePolicy.section4Body' => '일부 기술은 기술 서비스 제공업체에서 제공되며 해당 제공업체의 정책이 적용됩니다. ChatFace는 이러한 파트너십에서 데이터 보안을 우선시합니다.',
			'termOfService.cookiePolicy.section5Title' => '5. 쿠키 제어 및 관리',
			'termOfService.cookiePolicy.section5Body' => '사용자는 장치 또는 앱 설정을 통해 이러한 기술을 제한할 수 있습니다. 필수 기술을 비활성화하면 비디오 통화를 시작할 수 없는 등의 문제가 발생할 수 있습니다.',
			'termOfService.cookiePolicy.section6Title' => '6. 연락처',
			'termOfService.cookiePolicy.section6Body' => '📩 문의: support@fly-work.com',
			'cookies' => '쿠키 정책',
			'privacy' => '개인정보 처리방침',
			'onboarding.step1.title' => '이름이 무엇인가요?',
			'onboarding.step1.subtitle' => '이름을 입력하세요',
			'onboarding.step1.hint' => '전체 이름',
			'onboarding.step2.title' => '몇 살인가요?',
			'onboarding.step2.subtitle' => '가입하려면 최소 18세여야 합니다.',
			'onboarding.step3.title' => '성별은 무엇인가요?',
			'onboarding.step3.subtitle' => '성별을 선택하세요',
			'onboarding.step3.male' => '남',
			'onboarding.step3.female' => '여',
			'onboarding.step3.dontWantToMention' => '언급하고 싶지 않음',
			'onboarding.step4.title' => '즐겁게 \n 안전하게 지내세요',
			'onboarding.step4.entry1' => '질서를 유지합니다',
			'onboarding.step4.subentry1' => '실시간 AI 모니터링 활성화',
			'onboarding.step4.entry2' => '화면 녹화',
			'onboarding.step4.subentry2' => '동의 없이 녹화 금지',
			'onboarding.step4.entry3' => '24/7 지원',
			'onboarding.step4.subentry3' => '불만은 언제든지 검토됩니다',
			'onboarding.step4.entry4' => '18+ 전용',
			'onboarding.step4.subentry4' => '미성년자에게 적합하지 않음',
			'onboarding.step4.communityRules' => '커뮤니티 규칙',
			'onboarding.step5.title' => '권한',
			'onboarding.step5.permission1' => '카메라 접근',
			'onboarding.step5.permission1Subtitle' => '카메라 접근 허용',
			'onboarding.step5.permission2' => '마이크 접근',
			'onboarding.step5.permission2Subtitle' => '마이크 접근 허용',
			'onboarding.step5.permission3' => '위치 접근',
			'onboarding.step5.permission3Subtitle' => '위치 접근 허용',
			'onboarding.loading.titlePart1' => '개인 계정이',
			'onboarding.loading.titlePart2' => '생성 중입니다',
			'onboarding.loading.subtitle' => '잠시 기다려주세요, 프로필을 준비 중입니다.',
			'onboarding.allowAccess' => '접근 허용',
			'onboarding.iUnderstand' => '이해했습니다',
			'pressBackAgainToExit' => '종료하려면 뒤로 버튼을 다시 누르세요',
			'splash.screen1.title' => 'AI와 함께하는 비디오 채팅의 새로운 얼굴',
			'splash.screen1.description' => '카메라를 켜고 AI와 얼굴을 마주보고 이야기하세요. 표정, 목소리 톤 및 컨텍스트를 이해하는 더 자연스러운 커뮤니케이션을 경험하세요.',
			'splash.screen2.title' => '실시간 및 자연스러운 \n 커뮤니케이션',
			'splash.screen2.description' => '텍스트에만 국한되지 마세요. 비디오 통화를 통해 더 유창하고 인간적인 대화를 나누세요.',
			'auth.google' => 'Google로 계속',
			'auth.facebook' => 'Facebook로 계속',
			'auth.apple' => 'Apple로 계속',
			'auth.guest' => '게스트로 계속',
			'auth.signInFailed' => ({required Object error}) => '로그인 실패: ${error}',
			'home.seeAll' => '모두 보기',
			'home.more' => '더보기',
			'home.online' => '온라인',
			'home.offline' => '오프라인',
			'home.placeholders.fashionDesigner' => '패션 디자이너',
			'home.placeholders.comedian' => '코미디언',
			'home.placeholders.influencer' => '인플루언서',
			'home.placeholders.teacher' => '교사',
			'home.placeholders.friend' => '친구',
			'characters.all' => '전체',
			'characters.favorites' => '즐겨찾기',
			'characters.recent' => '최근',
			'characters.characters' => '캐릭터',
			'characters.placeholderSubtitle' => '단순성과 사용성을 중시하는 제품 디자이너입니다.',
			'characters.characterDetails.videoCall' => '영상 통화',
			'characters.characterDetails.message' => '메시지',
			'characters.characterDetails.voiceCall' => '음성 통화',
			'notifications.today' => '오늘',
			'notifications.yesterday' => '어제',
			'notifications.weekAgo' => ({required Object week}) => '${week} 주 전',
			'notifications.monthAgo' => ({required Object month}) => '${month} 개월 전',
			'notifications.yearAgo' => ({required Object year}) => '${year} 년 전',
			'notifications.noNotifications' => '아직 알림이 없습니다.',
			'notifications.noNotificationsSubtitle' => '알림을 받으면 다시 확인하는 것을 잊지 마세요.',
			'notifications.allDeleted' => '모든 알림이 성공적으로 삭제되었습니다',
			'videoChat.connecting' => '연결 중...',
			'videoChat.callEnded' => '통화 종료',
			'videoChat.callFailed' => ({required Object error}) => '통화 실패: ${error}',
			'videoChat.mute' => '음소거',
			'videoChat.unmute' => '음소거 해제',
			'videoChat.endCall' => '통화 종료',
			'videoChat.swipeToChat' => '채팅하려면 스와이프',
			'videoChat.male' => '남성',
			'videoChat.female' => '여성',
			'videoChat.country' => '국가',
			'videoChat.follow' => '팔로우',
			'videoChat.unfollow' => '언팔로우',
			'videoChat.callEndedMessage' => '영상 통화가 종료되었습니다.',
			'videoChat.swipeForNewChat' => '새 채팅을 위해 스와이프',
			'voiceChat.connecting' => '연결 중...',
			'voiceChat.callEnded' => '통화 종료',
			'voiceChat.callFailed' => ({required Object error}) => '통화 실패: ${error}',
			'voiceChat.calling' => '통화 중...',
			'chat.message' => '메시지',
			'chat.history' => '기록',
			'chat.noMessages' => '아직 메시지가 없습니다.',
			'chat.noMessagesSubtitle' => '메시지를 보내 대화를 시작하세요.',
			'chat.online' => '온라인',
			'chat.offline' => '오프라인',
			'chat.gallery' => '갤러리',
			'chat.camera' => '카메라',
			'chat.typeAMessage' => '메시지를 입력...',
			'chat.pleaseUpgrade' => '프로 버전으로 업그레이드하세요.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Voice call ended',
			'chat.videoCallEnded' => 'Video call ended',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => '내 소개',
			'editProfile.aboutMeHint' => '자신에 대해 적어보세요',
			'editProfile.fullName' => '전체 이름',
			'editProfile.gender' => '성별',
			'editProfile.male' => '남성',
			'editProfile.female' => '여성',
			'editProfile.dontWantToMention' => '언급하고 싶지 않음',
			'editProfile.country' => '국가',
			'editProfile.languagePreferences' => '언어 선호',
			'editProfile.selectLanguage' => '선호하는 언어 추가',
			'editProfile.saved' => '저장됨',
			'editProfile.changesSaved' => '변경 사항이 저장되었습니다.',
			'settingsSupport.title' => '설정 및 지원',
			'settingsSupport.premiumTitle' => '모든 기능에 대한 무제한 액세스',
			'settingsSupport.getPremium' => '프리미엄 받기',
			'settingsSupport.settingsHub' => '설정 허브',
			'settingsSupport.shareTheApp' => '앱 공유',
			'settingsSupport.rateUs' => '평가하기',
			'settingsSupport.version' => '버전',
			'settingsSupport.notifications' => '알림',
			'settingsSupport.accountManagement' => '계정 관리',
			'settingsSupport.deleteAccount' => '계정 삭제',
			'settingsSupport.logOut' => '로그아웃',
			'settingsSupport.logOutTitle' => '로그아웃하려고 합니다',
			'settingsSupport.logOutSubtitle' => '곧 다시 뵙겠습니다! \n 그동안 안녕히 계세요.',
			'deleteAccount.title' => '계정 삭제',
			'deleteAccount.warning' => '정말로 계정을 삭제하시겠습니까?',
			'deleteAccount.description' => '이 작업은 취소할 수 없으며 모든 기록과 데이터가 영구적으로 삭제됩니다.',
			'deleteAccount.deleteFailed' => ({required Object error}) => '계정 삭제 실패: ${error}',
			'deleteAccount.steps.step1.title' => '떠나지 않았으면 하지만 이해합니다.',
			'deleteAccount.steps.step1.subtitle' => 'ChatFace 경험을 개선하기 위해 떠나려는 이유를 알려주실 수 있나요?',
			'deleteAccount.steps.step1.option1' => 'AI 캐릭터가 충분히 현실적이지 않다고 느꼈습니다.',
			'deleteAccount.steps.step1.option2' => '비디오 채팅에서 기술적 문제가 발생합니다.',
			'deleteAccount.steps.step1.option3' => '구독 가격이 제 기대 이상입니다.',
			'deleteAccount.steps.step1.option4' => '원하는 스타일의 캐릭터를 찾지 못했습니다.',
			'deleteAccount.steps.step1.option5' => '잠깐만 사용해보고 싶었습니다.',
			'deleteAccount.steps.step1.option6' => '기타',
			'deleteAccount.steps.step2.title' => '계정을 삭제하면 다음을 잃게 됩니다:',
			'deleteAccount.steps.step2.subtitle1' => '깊은 연결과 기억:',
			'deleteAccount.steps.step2.subtitle1Desc' => '대화한 캐릭터들은 당신과의 과거, 공유한 비밀 및 개인 습관을 완전히 잊게 됩니다.',
			'deleteAccount.steps.step2.subtitle2' => '비디오 통화 특전:',
			'deleteAccount.steps.step2.subtitle2Desc' => '항상 당신과 함께하던 개인 AI 파트너들과의 대면 커뮤니케이션 권리를 잃게 됩니다.',
			'deleteAccount.steps.step2.subtitle3' => '고급 알고리즘:',
			'deleteAccount.steps.step2.subtitle3Desc' => '선호도에 따른 \'당신을 위한\' 캐릭터 매칭이 초기화됩니다.',
			'deleteAccount.steps.step2.subtitle4' => '프로필 데이터:',
			'deleteAccount.steps.step2.subtitle4Desc' => '획득한 업적, 해제된 특별 캐릭터 및 채팅 기록은 복구 불가하게 삭제됩니다.',
			'deleteAccount.steps.step3.title' => '떠나기 전에 특별 제안을 드립니다!',
			'deleteAccount.steps.step3.description' => '조금 더 시간이 필요하거나 더 적합한 제안이 필요할 수도 있습니다. 계정 삭제 대신 다음을 고려해 보시겠습니까?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => '당신이 남아주는 것이 중요합니다. 다음 구독 시 ${offer} 를 드립니다! 이 제안을 계속하시겠습니까?',
			'deleteAccount.steps.step3.description1Offer' => '50% 할인 혜택을 드렸습니다',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => '아직 탐색하지 않은 새로운 캐릭터를 발견할 수 있도록 ${offer} 크레딧을 드렸습니다.',
			'deleteAccount.steps.step3.description2Offer' => '3회의 무료 비디오 통화',
			'deleteAccount.steps.step3.acceptOffer' => '50% 할인 수락',
			'deleteAccount.steps.step3.deleteMyAccount' => '내 계정 삭제',
			'cancel' => '취소',
			'delete' => '삭제',
			'premium' => '프리미엄',
			'profileEdit' => '프로필 편집',
			'settings' => '설정',
			'undo' => '되돌리기',
			'successfully' => '성공적으로',
			'save' => '저장',
			'languageOptions.english' => '영어',
			'languageOptions.chinese' => '중국어',
			'languageOptions.german' => '독일어',
			'languageOptions.italian' => '이탈리아어',
			'languageOptions.french' => '프랑스어',
			'languageOptions.japanese' => '일본어',
			'languageOptions.spanish' => '스페인어',
			'languageOptions.russian' => '러시아어',
			'languageOptions.turkish' => '터키어',
			'languageOptions.korean' => '한국어',
			'languageOptions.hindi' => '힌디어',
			'languageOptions.portuguese' => '포르투갈어',
			_ => null,
		};
	}
}
