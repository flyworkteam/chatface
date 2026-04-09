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
class TranslationsCh with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ch,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ch>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsCh _root = this; // ignore: unused_field

	@override 
	TranslationsCh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCh(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => '欢迎 ${name}';
	@override String welcome2({required Object appName}) => '欢迎来到 ${appName}';
	@override String get get_started => '开始使用';
	@override String get next => '下一步';
	@override String get back => '返回';
	@override String get skip => '跳过';
	@override String get profile => '个人资料';
	@override String get kContinue => '继续';
	@override late final _TranslationsTermOfServiceCh termOfService = _TranslationsTermOfServiceCh._(_root);
	@override String get cookies => 'Cookie 政策';
	@override String get privacy => '隐私政策';
	@override late final _TranslationsOnboardingCh onboarding = _TranslationsOnboardingCh._(_root);
	@override String get pressBackAgainToExit => '再次按返回退出';
	@override late final _TranslationsSplashCh splash = _TranslationsSplashCh._(_root);
	@override late final _TranslationsAuthCh auth = _TranslationsAuthCh._(_root);
	@override late final _TranslationsHomeCh home = _TranslationsHomeCh._(_root);
	@override late final _TranslationsCharactersCh characters = _TranslationsCharactersCh._(_root);
	@override late final _TranslationsNotificationsCh notifications = _TranslationsNotificationsCh._(_root);
	@override late final _TranslationsVideoChatCh videoChat = _TranslationsVideoChatCh._(_root);
	@override late final _TranslationsVoiceChatCh voiceChat = _TranslationsVoiceChatCh._(_root);
	@override late final _TranslationsChatCh chat = _TranslationsChatCh._(_root);
	@override late final _TranslationsEditProfileCh editProfile = _TranslationsEditProfileCh._(_root);
	@override late final _TranslationsSettingsSupportCh settingsSupport = _TranslationsSettingsSupportCh._(_root);
	@override late final _TranslationsDeleteAccountCh deleteAccount = _TranslationsDeleteAccountCh._(_root);
	@override String get cancel => '取消';
	@override String get delete => '删除';
	@override String get premium => '高级';
	@override String get profileEdit => '编辑个人资料';
	@override String get settings => '设置';
	@override String get undo => '撤销';
	@override String get successfully => '成功';
	@override String get save => '保存';
	@override late final _TranslationsLanguageOptionsCh languageOptions = _TranslationsLanguageOptionsCh._(_root);
	@override late final _TranslationsCommonCh common = _TranslationsCommonCh._(_root);
	@override String get permissionsRequired => '需要权限';
	@override late final _TranslationsPermissionHelperCh permissionHelper = _TranslationsPermissionHelperCh._(_root);
	@override late final _TranslationsVideoViewCh videoView = _TranslationsVideoViewCh._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceCh implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get text1 => '注册 swipe 即表示您同意我们的 ';
	@override String get link1 => '服务条款';
	@override String get text2 => '。了解我们如何在我们的 ';
	@override String get link2 => '隐私政策';
	@override String get text3 => ' 和 ';
	@override String get link3 => 'Cookie 政策';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyCh privacyPolicy = _TranslationsTermOfServicePrivacyPolicyCh._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceCh termsOfService = _TranslationsTermOfServiceTermsOfServiceCh._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyCh cookiePolicy = _TranslationsTermOfServiceCookiePolicyCh._(_root);
}

// Path: onboarding
class _TranslationsOnboardingCh implements TranslationsOnboardingEn {
	_TranslationsOnboardingCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5Ch step5 = _TranslationsOnboardingStep5Ch._(_root);
	@override late final _TranslationsOnboardingStep1Ch step1 = _TranslationsOnboardingStep1Ch._(_root);
	@override late final _TranslationsOnboardingStep2Ch step2 = _TranslationsOnboardingStep2Ch._(_root);
	@override late final _TranslationsOnboardingStep3Ch step3 = _TranslationsOnboardingStep3Ch._(_root);
	@override late final _TranslationsOnboardingStep4Ch step4 = _TranslationsOnboardingStep4Ch._(_root);
	@override late final _TranslationsOnboardingLoadingCh loading = _TranslationsOnboardingLoadingCh._(_root);
	@override String get allowAccess => '允许访问';
	@override String get iUnderstand => '我知道了';
}

// Path: splash
class _TranslationsSplashCh implements TranslationsSplashEn {
	_TranslationsSplashCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Ch screen1 = _TranslationsSplashScreen1Ch._(_root);
	@override late final _TranslationsSplashScreen2Ch screen2 = _TranslationsSplashScreen2Ch._(_root);
}

// Path: auth
class _TranslationsAuthCh implements TranslationsAuthEn {
	_TranslationsAuthCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get google => '使用 Google 登录';
	@override String get facebook => '使用 Facebook 登录';
	@override String get apple => '使用 Apple 登录';
	@override String get guest => '以游客身份继续';
	@override String signInFailed({required Object error}) => '登录失败： ${error}';
}

// Path: home
class _TranslationsHomeCh implements TranslationsHomeEn {
	_TranslationsHomeCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get seeAll => '查看全部';
	@override String get more => '更多';
	@override String get online => '在线';
	@override String get offline => '离线';
	@override late final _TranslationsHomePlaceholdersCh placeholders = _TranslationsHomePlaceholdersCh._(_root);
}

// Path: characters
class _TranslationsCharactersCh implements TranslationsCharactersEn {
	_TranslationsCharactersCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get all => '全部';
	@override String get favorites => '收藏';
	@override String get recent => '最近';
	@override String get characters => '角色';
	@override String get placeholderSubtitle => '专注于简洁性和可用性的产品设计师。';
	@override late final _TranslationsCharactersCharacterDetailsCh characterDetails = _TranslationsCharactersCharacterDetailsCh._(_root);
}

// Path: notifications
class _TranslationsNotificationsCh implements TranslationsNotificationsEn {
	_TranslationsNotificationsCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get today => '今天';
	@override String get yesterday => '昨天';
	@override String weekAgo({required Object week}) => '${week} 周前';
	@override String monthAgo({required Object month}) => '${month} 月前';
	@override String yearAgo({required Object year}) => '${year} 年前';
	@override String get noNotifications => '还没有通知。';
	@override String get noNotificationsSubtitle => '收到通知时别忘了再来查看。';
	@override String get allDeleted => '所有通知已成功删除';
}

// Path: videoChat
class _TranslationsVideoChatCh implements TranslationsVideoChatEn {
	_TranslationsVideoChatCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => '检测到网络问题。正在重新连接...';
	@override String get failedToUpdateFollow => '更新关注状态失败。';
	@override String get connecting => '连接中...';
	@override String get callEnded => '通话结束';
	@override String callFailed({required Object error}) => '通话失败： ${error}';
	@override String get mute => '静音';
	@override String get unmute => '取消静音';
	@override String get endCall => '结束通话';
	@override String get swipeToChat => '滑动开始聊天';
	@override String get male => '男';
	@override String get female => '女';
	@override String get country => '国家';
	@override String get follow => '关注';
	@override String get unfollow => '取消关注';
	@override String get callEndedMessage => '视频通话已结束。';
	@override String get swipeForNewChat => '滑动以开始新聊天';
}

// Path: voiceChat
class _TranslationsVoiceChatCh implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get connecting => '连接中...';
	@override String get callEnded => '通话结束';
	@override String callFailed({required Object error}) => '通话失败： ${error}';
	@override String get calling => '呼叫中...';
}

// Path: chat
class _TranslationsChatCh implements TranslationsChatEn {
	_TranslationsChatCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get message => '消息';
	@override String get readAloud => '朗读';
	@override String get history => '历史';
	@override String get noMessages => '还没有消息。';
	@override String get noMessagesSubtitle => '发送消息开始对话。';
	@override String get online => '在线';
	@override String get offline => '离线';
	@override String get gallery => '图库';
	@override String get camera => '相机';
	@override String get typeAMessage => '输入消息...';
	@override String get pleaseUpgrade => '请升级到专业版。';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => '语音通话已结束';
	@override String get videoCallEnded => '视频通话已结束';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileCh implements TranslationsEditProfileEn {
	_TranslationsEditProfileCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => '关于我';
	@override String get aboutMeHint => '写点关于你自己的事';
	@override String get fullName => '全名';
	@override String get gender => '性别';
	@override String get male => '男';
	@override String get female => '女';
	@override String get dontWantToMention => '我不想说明。';
	@override String get country => '国家';
	@override String get languagePreferences => '语言偏好';
	@override String get selectLanguage => '添加您偏好的语言';
	@override String get saved => '已保存';
	@override String get changesSaved => '更改已保存。';
}

// Path: settingsSupport
class _TranslationsSettingsSupportCh implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '设置与支持';
	@override String get premiumTitle => '无限访问所有功能';
	@override String get getPremium => '获取高级版';
	@override String get settingsHub => '设置中心';
	@override String get shareTheApp => '分享应用';
	@override String get rateUs => '给我们评分';
	@override String get version => '版本';
	@override String get notifications => '通知';
	@override String get accountManagement => '账户管理';
	@override String get deleteAccount => '删除账户';
	@override String get logOut => '登出';
	@override String get logOutTitle => '您即将登出';
	@override String get logOutSubtitle => '很快再见！\n我们会想念你。';
}

// Path: deleteAccount
class _TranslationsDeleteAccountCh implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '删除账户';
	@override String get warning => '您确定要删除您的账户吗？';
	@override String get description => '此操作无法撤销，您的所有历史记录和数据将被永久删除。';
	@override String deleteFailed({required Object error}) => '删除账户失败： ${error}';
	@override late final _TranslationsDeleteAccountStepsCh steps = _TranslationsDeleteAccountStepsCh._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsCh implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get english => '英语';
	@override String get chinese => '中文';
	@override String get german => '德语';
	@override String get italian => '意大利语';
	@override String get french => '法语';
	@override String get japanese => '日语';
	@override String get spanish => '西班牙语';
	@override String get russian => '俄语';
	@override String get turkish => '土耳其语';
	@override String get korean => '韩语';
	@override String get hindi => '印地语';
	@override String get portuguese => '葡萄牙语';
}

// Path: common
class _TranslationsCommonCh implements TranslationsCommonEn {
	_TranslationsCommonCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => '重试';
	@override String get retry => '重试';
	@override String get close => '关闭';
}

// Path: permissionHelper
class _TranslationsPermissionHelperCh implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => '视频通话需要摄像头和麦克风权限。请在设置中启用。';
	@override String get micRequired => '语音通话需要麦克风权限。请在设置中启用。';
	@override String get cancel => '取消';
	@override String get openSettings => '打开设置';
}

// Path: videoView
class _TranslationsVideoViewCh implements TranslationsVideoViewEn {
	_TranslationsVideoViewCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '相机滤镜';
	@override String get subtitle => '为您的相机预览选择外观。';
	@override String get errorLoad => '无法加载伙伴：';
	@override String get noComps => '目前没有伙伴可用。';
	@override late final _TranslationsVideoViewFiltersCh filters = _TranslationsVideoViewFiltersCh._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyCh implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '隐私政策';
	@override String get lastUpdated => '最后更新：2026';
	@override String get intro => 'ChatFace 将用户隐私和数据安全作为核心原则。您的所有个人数据均按照有效的数据保护法规进行处理。';
	@override String get section1Title => '1. 收集的信息';
	@override String get section1sub1Title => '1.1 用户提供的数据';
	@override String get section1sub1Body => '• 姓名、昵称或个人资料信息。\n• 电子邮件地址（用于注册、订阅和支持）。 \n• 互动偏好、语言设置和互动记录。 \n• 反馈和支持消息。';
	@override String get section1sub2Title => '1.2 自动收集的数据';
	@override String get section1sub2Body => '收集的信息包括设备类型、操作系统、近似位置（城市/国家）和应用使用数据。不收集精确位置数据。';
	@override String get section2Title => '2. 数据处理目的';
	@override String get section2Body => '您的个人数据将用于以下目的：\n\n• 确保应用的无缝运行。\n• 提供并个性化 AI 驱动的视频通话体验。\n• 优化系统性能并检测错误。\n• 履行法律义务。\n 您的数据绝不会出售给第三方。';
	@override String get section3Title => '3. 数据保留与删除';
	@override String get section3Body => '只要您的帐户处于活动状态或出于法律义务的期间，我们将存储您的数据。当帐户被删除时，所有个人数据将从系统中不可逆转地删除。';
	@override String get section4Title => '4. 用户权利';
	@override String get section4Body => '根据 GDPR 和相关法规，您有权访问、更正、删除（被遗忘权）并请求数据可移植性。您可联系我们提出请求。';
	@override String get section5Title => '5. 儿童隐私';
	@override String get section5Body => 'ChatFace 不面向 18 岁以下用户。我们不会有意收集该年龄组的数据；一经发现，此类帐户将被关闭并删除数据。';
	@override String get section6Title => '6. 联系方式';
	@override String get section6Body => '📩 咨询：support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceCh implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '服务条款';
	@override String get lastUpdated => '最后更新：2026';
	@override String get intro => '这些条款规范 ChatFace 移动应用的使用。使用本应用即表示您同意这些条款。';
	@override String get disclaimer => '免责声明：ChatFace 是一款 AI 视频互动应用。它不提供法律、学术、医疗或专业咨询服务。';
	@override String get section1Title => '1. 服务范围';
	@override String get section1Body => 'ChatFace 提供 AI 驱动的视频互动体验：\n\n• AI 视频通话与对话。\n• 个性化互动偏好。\n• 访问互动历史和记录。\n\n服务不构成正式意见或专业指导。';
	@override String get section2Title => '2. 使用条件';
	@override String get section2Body => '• 您必须年满 18 岁（禁止 18 岁以下访问）。\n• 您必须提供准确的帐户信息。\n• 应仅将应用用于合法和个人目的。';
	@override String get section3Title => '3. 禁止使用';
	@override String get section3Body => '冒充、仇恨言论、危及儿童安全、尝试入侵安全和操纵 AI 系统均严格禁止。';
	@override String get section4Title => '4. 订阅与付款';
	@override String get section4Body => '高级功能受 App Store 和 Google Play 政策约束。订阅取消和退款由相应商店管理。';
	@override String get section5Title => '5. 内容免责声明';
	@override String get section5Body => '内容由 AI 生成，不替代专业建议。ChatFace 不保证准确性或适用性。';
	@override String get section6Title => '6. 知识产权';
	@override String get section6Body => '所有内容包括设计、软件和算法均归 ChatFace 所有。未经授权不得复制或再分发。';
	@override String get section7Title => '7. 适用法律';
	@override String get section7Body => '这些条款受土耳其共和国法律管辖。伊斯坦布尔中央法院对争议拥有管辖权。';
	@override String get section8Title => '8. 联系方式';
	@override String get section8Body => '📩 咨询：support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyCh implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cookie 政策';
	@override String get lastUpdated => '最后更新：2026';
	@override String get intro => '欢迎使用 ChatFace。我们使用数字辅助技术使您的 AI 视频通话体验更流畅、更安全并更具个性化。';
	@override String get important => '本政策解释了什么是 Cookie、它们的用途以及如何管理您的偏好。';
	@override String get section1Title => '1. 什么是 Cookie？';
	@override String get section1Body => 'Cookie 是存放在您设备上的小数据文件。它们不会直接识别您；它们像数字便签，记住：\n• 通话和语言设置\n• 会话和性能偏好。';
	@override String get section2Title => '2. 我们使用哪些技术？';
	@override String get section2Body => '严格必要的技术\n用于会话管理和安全控制。没有这些组件应用可能无法正常工作。\n\n性能与分析\n帮助我们了解哪些内容被阅读以及哪些区域需要改进。数据以匿名方式评估。\n\n个性化\n记住语言偏好和阅读级别以提供个性化体验。';
	@override String get section3Title => '3. 我们为何使用这些技术？';
	@override String get section3Body => '• 确保应用安全平稳运行。\n• 使使用体验更流畅。\n• 记住重复设置。\n• 为未来功能识别改进方向。';
	@override String get section4Title => '4. 第三方技术';
	@override String get section4Body => '某些技术可能由技术服务提供商提供，并受其自身政策约束。ChatFace 在这些合作中优先考虑数据安全。';
	@override String get section5Title => '5. Cookie 控制与管理';
	@override String get section5Body => '用户可以通过设备或应用设置限制这些技术。禁用必要技术可能导致例如无法启动视频通话等问题。';
	@override String get section6Title => '6. 联系方式';
	@override String get section6Body => '📩 咨询：support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Ch implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => '需要权限';
	@override String get notNow => '暂不';
	@override String get openSettings => '打开设置';
	@override String get title => '权限';
	@override String get permission1 => '相机访问';
	@override String get permission1Subtitle => '允许访问相机';
	@override String get permission2 => '麦克风访问';
	@override String get permission2Subtitle => '允许访问麦克风';
	@override String get permission3 => '位置访问';
	@override String get permission3Subtitle => '允许访问位置';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Ch implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '你叫什么名字？';
	@override String get subtitle => '请输入你的姓名';
	@override String get hint => '全名';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Ch implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '你多少岁？';
	@override String get subtitle => '注册时您必须年满 18 岁。';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Ch implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '你的性别是？';
	@override String get subtitle => '请选择你的性别';
	@override String get male => '男';
	@override String get female => '女';
	@override String get dontWantToMention => '我不想说明。';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Ch implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '玩得开心且\n保持安全';
	@override String get entry1 => '我们维护秩序';
	@override String get subentry1 => '实时 AI 监控开启';
	@override String get entry2 => '屏幕录制';
	@override String get subentry2 => '未经同意不得录制';
	@override String get entry3 => '全天候支持';
	@override String get subentry3 => '投诉将随时审查';
	@override String get entry4 => '仅限 18+';
	@override String get subentry4 => '不适合未成年人';
	@override String get communityRules => '社区规则';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingCh implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => '您的个人帐户正在';
	@override String get titlePart2 => '创建中';
	@override String get subtitle => '请稍候，您的个人资料正在准备中。';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Ch implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '视频聊天的全新面孔 \n 与 AI';
	@override String get description => '打开相机，与 AI 面对面交谈。体验更自然的交流，AI 能理解面部表情、语气和上下文。';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Ch implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '实时且自然的 \n 交流';
	@override String get description => '不要被文字限制。通过视频通话进行更流畅、更有人情味的对话。';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersCh implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => '时装设计师';
	@override String get comedian => '喜剧演员';
	@override String get influencer => '网红';
	@override String get teacher => '教师';
	@override String get friend => '朋友';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsCh implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get videoCall => '视频通话';
	@override String get message => '消息';
	@override String get voiceCall => '语音通话';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsCh implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Ch step1 = _TranslationsDeleteAccountStepsStep1Ch._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Ch step2 = _TranslationsDeleteAccountStepsStep2Ch._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Ch step3 = _TranslationsDeleteAccountStepsStep3Ch._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersCh implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersCh._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => '原来的';
	@override String get ADDICTIVE_BLUE => '令人上瘾的蓝色';
	@override String get ADDICTIVE_RED => '令人上瘾的红色';
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
class _TranslationsDeleteAccountStepsStep1Ch implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '我们不希望您离开，但我们理解。';
	@override String get subtitle => '您能告诉我们为什么想离开，以便我们改善ChatFace体验吗？';
	@override String get option1 => '我觉得人工智能角色不逼真。';
	@override String get option2 => '我在视频聊天时遇到技术问题。';
	@override String get option3 => '订阅价格超出我的预期。';
	@override String get option4 => '我找不到我想要的角色类型。';
	@override String get option5 => '我只是想短暂尝试一下。';
	@override String get option6 => '其他';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Ch implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '如果删除帐户，您将告别：';
	@override String get subtitle1 => '深层联系和记忆：';
	@override String get subtitle1Desc => '与您聊天的角色将完全忘记你们的过去和共享的秘密。';
	@override String get subtitle2 => '视频通话特权：';
	@override String get subtitle2Desc => '您将失去随时与AI伙伴进行面对面交流的权利。';
	@override String get subtitle3 => '高级算法：';
	@override String get subtitle3Desc => '为您量身定制的专属角色匹配将被重置。';
	@override String get subtitle4 => '资料数据：';
	@override String get subtitle4Desc => '您获得的成就、解锁的特殊角色和聊天记录将被不可撤销地删除。';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Ch implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Ch._(this._root);

	final TranslationsCh _root; // ignore: unused_field

	// Translations
	@override String get title => '在您离开之前，我们有一个特别优惠！';
	@override String get description => '也许您只需要更多的时间或更好的优惠。不删除帐户，您会考虑这个吗？';
	@override String description1({required Object offer}) => '保留您对我们来说很重要。下次订阅可享${offer}！';
	@override String get description1Offer => '我们已应用50%折扣';
	@override String description2({required Object offer}) => '我们已为您提供${offer}学分，以便您发现新角色。';
	@override String get description2Offer => '3次免费视频通话';
	@override String get acceptOffer => '接受50%折扣优惠';
	@override String get deleteMyAccount => '删除我的帐户';
}

/// The flat map containing all translations for locale <ch>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsCh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => '欢迎 ${name}',
			'welcome2' => ({required Object appName}) => '欢迎来到 ${appName}',
			'get_started' => '开始使用',
			'next' => '下一步',
			'back' => '返回',
			'skip' => '跳过',
			'profile' => '个人资料',
			'kContinue' => '继续',
			'termOfService.text1' => '注册 swipe 即表示您同意我们的 ',
			'termOfService.link1' => '服务条款',
			'termOfService.text2' => '。了解我们如何在我们的 ',
			'termOfService.link2' => '隐私政策',
			'termOfService.text3' => ' 和 ',
			'termOfService.link3' => 'Cookie 政策',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => '隐私政策',
			'termOfService.privacyPolicy.lastUpdated' => '最后更新：2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace 将用户隐私和数据安全作为核心原则。您的所有个人数据均按照有效的数据保护法规进行处理。',
			'termOfService.privacyPolicy.section1Title' => '1. 收集的信息',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 用户提供的数据',
			'termOfService.privacyPolicy.section1sub1Body' => '• 姓名、昵称或个人资料信息。\n• 电子邮件地址（用于注册、订阅和支持）。 \n• 互动偏好、语言设置和互动记录。 \n• 反馈和支持消息。',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 自动收集的数据',
			'termOfService.privacyPolicy.section1sub2Body' => '收集的信息包括设备类型、操作系统、近似位置（城市/国家）和应用使用数据。不收集精确位置数据。',
			'termOfService.privacyPolicy.section2Title' => '2. 数据处理目的',
			'termOfService.privacyPolicy.section2Body' => '您的个人数据将用于以下目的：\n\n• 确保应用的无缝运行。\n• 提供并个性化 AI 驱动的视频通话体验。\n• 优化系统性能并检测错误。\n• 履行法律义务。\n 您的数据绝不会出售给第三方。',
			'termOfService.privacyPolicy.section3Title' => '3. 数据保留与删除',
			'termOfService.privacyPolicy.section3Body' => '只要您的帐户处于活动状态或出于法律义务的期间，我们将存储您的数据。当帐户被删除时，所有个人数据将从系统中不可逆转地删除。',
			'termOfService.privacyPolicy.section4Title' => '4. 用户权利',
			'termOfService.privacyPolicy.section4Body' => '根据 GDPR 和相关法规，您有权访问、更正、删除（被遗忘权）并请求数据可移植性。您可联系我们提出请求。',
			'termOfService.privacyPolicy.section5Title' => '5. 儿童隐私',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace 不面向 18 岁以下用户。我们不会有意收集该年龄组的数据；一经发现，此类帐户将被关闭并删除数据。',
			'termOfService.privacyPolicy.section6Title' => '6. 联系方式',
			'termOfService.privacyPolicy.section6Body' => '📩 咨询：support@fly-work.com',
			'termOfService.termsOfService.title' => '服务条款',
			'termOfService.termsOfService.lastUpdated' => '最后更新：2026',
			'termOfService.termsOfService.intro' => '这些条款规范 ChatFace 移动应用的使用。使用本应用即表示您同意这些条款。',
			'termOfService.termsOfService.disclaimer' => '免责声明：ChatFace 是一款 AI 视频互动应用。它不提供法律、学术、医疗或专业咨询服务。',
			'termOfService.termsOfService.section1Title' => '1. 服务范围',
			'termOfService.termsOfService.section1Body' => 'ChatFace 提供 AI 驱动的视频互动体验：\n\n• AI 视频通话与对话。\n• 个性化互动偏好。\n• 访问互动历史和记录。\n\n服务不构成正式意见或专业指导。',
			'termOfService.termsOfService.section2Title' => '2. 使用条件',
			'termOfService.termsOfService.section2Body' => '• 您必须年满 18 岁（禁止 18 岁以下访问）。\n• 您必须提供准确的帐户信息。\n• 应仅将应用用于合法和个人目的。',
			'termOfService.termsOfService.section3Title' => '3. 禁止使用',
			'termOfService.termsOfService.section3Body' => '冒充、仇恨言论、危及儿童安全、尝试入侵安全和操纵 AI 系统均严格禁止。',
			'termOfService.termsOfService.section4Title' => '4. 订阅与付款',
			'termOfService.termsOfService.section4Body' => '高级功能受 App Store 和 Google Play 政策约束。订阅取消和退款由相应商店管理。',
			'termOfService.termsOfService.section5Title' => '5. 内容免责声明',
			'termOfService.termsOfService.section5Body' => '内容由 AI 生成，不替代专业建议。ChatFace 不保证准确性或适用性。',
			'termOfService.termsOfService.section6Title' => '6. 知识产权',
			'termOfService.termsOfService.section6Body' => '所有内容包括设计、软件和算法均归 ChatFace 所有。未经授权不得复制或再分发。',
			'termOfService.termsOfService.section7Title' => '7. 适用法律',
			'termOfService.termsOfService.section7Body' => '这些条款受土耳其共和国法律管辖。伊斯坦布尔中央法院对争议拥有管辖权。',
			'termOfService.termsOfService.section8Title' => '8. 联系方式',
			'termOfService.termsOfService.section8Body' => '📩 咨询：support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Cookie 政策',
			'termOfService.cookiePolicy.lastUpdated' => '最后更新：2026',
			'termOfService.cookiePolicy.intro' => '欢迎使用 ChatFace。我们使用数字辅助技术使您的 AI 视频通话体验更流畅、更安全并更具个性化。',
			'termOfService.cookiePolicy.important' => '本政策解释了什么是 Cookie、它们的用途以及如何管理您的偏好。',
			'termOfService.cookiePolicy.section1Title' => '1. 什么是 Cookie？',
			'termOfService.cookiePolicy.section1Body' => 'Cookie 是存放在您设备上的小数据文件。它们不会直接识别您；它们像数字便签，记住：\n• 通话和语言设置\n• 会话和性能偏好。',
			'termOfService.cookiePolicy.section2Title' => '2. 我们使用哪些技术？',
			'termOfService.cookiePolicy.section2Body' => '严格必要的技术\n用于会话管理和安全控制。没有这些组件应用可能无法正常工作。\n\n性能与分析\n帮助我们了解哪些内容被阅读以及哪些区域需要改进。数据以匿名方式评估。\n\n个性化\n记住语言偏好和阅读级别以提供个性化体验。',
			'termOfService.cookiePolicy.section3Title' => '3. 我们为何使用这些技术？',
			'termOfService.cookiePolicy.section3Body' => '• 确保应用安全平稳运行。\n• 使使用体验更流畅。\n• 记住重复设置。\n• 为未来功能识别改进方向。',
			'termOfService.cookiePolicy.section4Title' => '4. 第三方技术',
			'termOfService.cookiePolicy.section4Body' => '某些技术可能由技术服务提供商提供，并受其自身政策约束。ChatFace 在这些合作中优先考虑数据安全。',
			'termOfService.cookiePolicy.section5Title' => '5. Cookie 控制与管理',
			'termOfService.cookiePolicy.section5Body' => '用户可以通过设备或应用设置限制这些技术。禁用必要技术可能导致例如无法启动视频通话等问题。',
			'termOfService.cookiePolicy.section6Title' => '6. 联系方式',
			'termOfService.cookiePolicy.section6Body' => '📩 咨询：support@fly-work.com',
			'cookies' => 'Cookie 政策',
			'privacy' => '隐私政策',
			'onboarding.step5.permissionRequired' => '需要权限',
			'onboarding.step5.notNow' => '暂不',
			'onboarding.step5.openSettings' => '打开设置',
			'onboarding.step5.title' => '权限',
			'onboarding.step5.permission1' => '相机访问',
			'onboarding.step5.permission1Subtitle' => '允许访问相机',
			'onboarding.step5.permission2' => '麦克风访问',
			'onboarding.step5.permission2Subtitle' => '允许访问麦克风',
			'onboarding.step5.permission3' => '位置访问',
			'onboarding.step5.permission3Subtitle' => '允许访问位置',
			'onboarding.step1.title' => '你叫什么名字？',
			'onboarding.step1.subtitle' => '请输入你的姓名',
			'onboarding.step1.hint' => '全名',
			'onboarding.step2.title' => '你多少岁？',
			'onboarding.step2.subtitle' => '注册时您必须年满 18 岁。',
			'onboarding.step3.title' => '你的性别是？',
			'onboarding.step3.subtitle' => '请选择你的性别',
			'onboarding.step3.male' => '男',
			'onboarding.step3.female' => '女',
			'onboarding.step3.dontWantToMention' => '我不想说明。',
			'onboarding.step4.title' => '玩得开心且\n保持安全',
			'onboarding.step4.entry1' => '我们维护秩序',
			'onboarding.step4.subentry1' => '实时 AI 监控开启',
			'onboarding.step4.entry2' => '屏幕录制',
			'onboarding.step4.subentry2' => '未经同意不得录制',
			'onboarding.step4.entry3' => '全天候支持',
			'onboarding.step4.subentry3' => '投诉将随时审查',
			'onboarding.step4.entry4' => '仅限 18+',
			'onboarding.step4.subentry4' => '不适合未成年人',
			'onboarding.step4.communityRules' => '社区规则',
			'onboarding.loading.titlePart1' => '您的个人帐户正在',
			'onboarding.loading.titlePart2' => '创建中',
			'onboarding.loading.subtitle' => '请稍候，您的个人资料正在准备中。',
			'onboarding.allowAccess' => '允许访问',
			'onboarding.iUnderstand' => '我知道了',
			'pressBackAgainToExit' => '再次按返回退出',
			'splash.screen1.title' => '视频聊天的全新面孔 \n 与 AI',
			'splash.screen1.description' => '打开相机，与 AI 面对面交谈。体验更自然的交流，AI 能理解面部表情、语气和上下文。',
			'splash.screen2.title' => '实时且自然的 \n 交流',
			'splash.screen2.description' => '不要被文字限制。通过视频通话进行更流畅、更有人情味的对话。',
			'auth.google' => '使用 Google 登录',
			'auth.facebook' => '使用 Facebook 登录',
			'auth.apple' => '使用 Apple 登录',
			'auth.guest' => '以游客身份继续',
			'auth.signInFailed' => ({required Object error}) => '登录失败： ${error}',
			'home.seeAll' => '查看全部',
			'home.more' => '更多',
			'home.online' => '在线',
			'home.offline' => '离线',
			'home.placeholders.fashionDesigner' => '时装设计师',
			'home.placeholders.comedian' => '喜剧演员',
			'home.placeholders.influencer' => '网红',
			'home.placeholders.teacher' => '教师',
			'home.placeholders.friend' => '朋友',
			'characters.all' => '全部',
			'characters.favorites' => '收藏',
			'characters.recent' => '最近',
			'characters.characters' => '角色',
			'characters.placeholderSubtitle' => '专注于简洁性和可用性的产品设计师。',
			'characters.characterDetails.videoCall' => '视频通话',
			'characters.characterDetails.message' => '消息',
			'characters.characterDetails.voiceCall' => '语音通话',
			'notifications.today' => '今天',
			'notifications.yesterday' => '昨天',
			'notifications.weekAgo' => ({required Object week}) => '${week} 周前',
			'notifications.monthAgo' => ({required Object month}) => '${month} 月前',
			'notifications.yearAgo' => ({required Object year}) => '${year} 年前',
			'notifications.noNotifications' => '还没有通知。',
			'notifications.noNotificationsSubtitle' => '收到通知时别忘了再来查看。',
			'notifications.allDeleted' => '所有通知已成功删除',
			'videoChat.networkHiccup' => '检测到网络问题。正在重新连接...',
			'videoChat.failedToUpdateFollow' => '更新关注状态失败。',
			'videoChat.connecting' => '连接中...',
			'videoChat.callEnded' => '通话结束',
			'videoChat.callFailed' => ({required Object error}) => '通话失败： ${error}',
			'videoChat.mute' => '静音',
			'videoChat.unmute' => '取消静音',
			'videoChat.endCall' => '结束通话',
			'videoChat.swipeToChat' => '滑动开始聊天',
			'videoChat.male' => '男',
			'videoChat.female' => '女',
			'videoChat.country' => '国家',
			'videoChat.follow' => '关注',
			'videoChat.unfollow' => '取消关注',
			'videoChat.callEndedMessage' => '视频通话已结束。',
			'videoChat.swipeForNewChat' => '滑动以开始新聊天',
			'voiceChat.connecting' => '连接中...',
			'voiceChat.callEnded' => '通话结束',
			'voiceChat.callFailed' => ({required Object error}) => '通话失败： ${error}',
			'voiceChat.calling' => '呼叫中...',
			'chat.message' => '消息',
			'chat.readAloud' => '朗读',
			'chat.history' => '历史',
			'chat.noMessages' => '还没有消息。',
			'chat.noMessagesSubtitle' => '发送消息开始对话。',
			'chat.online' => '在线',
			'chat.offline' => '离线',
			'chat.gallery' => '图库',
			'chat.camera' => '相机',
			'chat.typeAMessage' => '输入消息...',
			'chat.pleaseUpgrade' => '请升级到专业版。',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => '语音通话已结束',
			'chat.videoCallEnded' => '视频通话已结束',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => '关于我',
			'editProfile.aboutMeHint' => '写点关于你自己的事',
			'editProfile.fullName' => '全名',
			'editProfile.gender' => '性别',
			'editProfile.male' => '男',
			'editProfile.female' => '女',
			'editProfile.dontWantToMention' => '我不想说明。',
			'editProfile.country' => '国家',
			'editProfile.languagePreferences' => '语言偏好',
			'editProfile.selectLanguage' => '添加您偏好的语言',
			'editProfile.saved' => '已保存',
			'editProfile.changesSaved' => '更改已保存。',
			'settingsSupport.title' => '设置与支持',
			'settingsSupport.premiumTitle' => '无限访问所有功能',
			'settingsSupport.getPremium' => '获取高级版',
			'settingsSupport.settingsHub' => '设置中心',
			'settingsSupport.shareTheApp' => '分享应用',
			'settingsSupport.rateUs' => '给我们评分',
			'settingsSupport.version' => '版本',
			'settingsSupport.notifications' => '通知',
			'settingsSupport.accountManagement' => '账户管理',
			'settingsSupport.deleteAccount' => '删除账户',
			'settingsSupport.logOut' => '登出',
			'settingsSupport.logOutTitle' => '您即将登出',
			'settingsSupport.logOutSubtitle' => '很快再见！\n我们会想念你。',
			'deleteAccount.title' => '删除账户',
			'deleteAccount.warning' => '您确定要删除您的账户吗？',
			'deleteAccount.description' => '此操作无法撤销，您的所有历史记录和数据将被永久删除。',
			'deleteAccount.deleteFailed' => ({required Object error}) => '删除账户失败： ${error}',
			'deleteAccount.steps.step1.title' => '我们不希望您离开，但我们理解。',
			'deleteAccount.steps.step1.subtitle' => '您能告诉我们为什么想离开，以便我们改善ChatFace体验吗？',
			'deleteAccount.steps.step1.option1' => '我觉得人工智能角色不逼真。',
			'deleteAccount.steps.step1.option2' => '我在视频聊天时遇到技术问题。',
			'deleteAccount.steps.step1.option3' => '订阅价格超出我的预期。',
			'deleteAccount.steps.step1.option4' => '我找不到我想要的角色类型。',
			'deleteAccount.steps.step1.option5' => '我只是想短暂尝试一下。',
			'deleteAccount.steps.step1.option6' => '其他',
			'deleteAccount.steps.step2.title' => '如果删除帐户，您将告别：',
			'deleteAccount.steps.step2.subtitle1' => '深层联系和记忆：',
			'deleteAccount.steps.step2.subtitle1Desc' => '与您聊天的角色将完全忘记你们的过去和共享的秘密。',
			'deleteAccount.steps.step2.subtitle2' => '视频通话特权：',
			'deleteAccount.steps.step2.subtitle2Desc' => '您将失去随时与AI伙伴进行面对面交流的权利。',
			'deleteAccount.steps.step2.subtitle3' => '高级算法：',
			'deleteAccount.steps.step2.subtitle3Desc' => '为您量身定制的专属角色匹配将被重置。',
			'deleteAccount.steps.step2.subtitle4' => '资料数据：',
			'deleteAccount.steps.step2.subtitle4Desc' => '您获得的成就、解锁的特殊角色和聊天记录将被不可撤销地删除。',
			'deleteAccount.steps.step3.title' => '在您离开之前，我们有一个特别优惠！',
			'deleteAccount.steps.step3.description' => '也许您只需要更多的时间或更好的优惠。不删除帐户，您会考虑这个吗？',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => '保留您对我们来说很重要。下次订阅可享${offer}！',
			'deleteAccount.steps.step3.description1Offer' => '我们已应用50%折扣',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => '我们已为您提供${offer}学分，以便您发现新角色。',
			'deleteAccount.steps.step3.description2Offer' => '3次免费视频通话',
			'deleteAccount.steps.step3.acceptOffer' => '接受50%折扣优惠',
			'deleteAccount.steps.step3.deleteMyAccount' => '删除我的帐户',
			'cancel' => '取消',
			'delete' => '删除',
			'premium' => '高级',
			'profileEdit' => '编辑个人资料',
			'settings' => '设置',
			'undo' => '撤销',
			'successfully' => '成功',
			'save' => '保存',
			'languageOptions.english' => '英语',
			'languageOptions.chinese' => '中文',
			'languageOptions.german' => '德语',
			'languageOptions.italian' => '意大利语',
			'languageOptions.french' => '法语',
			'languageOptions.japanese' => '日语',
			'languageOptions.spanish' => '西班牙语',
			'languageOptions.russian' => '俄语',
			'languageOptions.turkish' => '土耳其语',
			'languageOptions.korean' => '韩语',
			'languageOptions.hindi' => '印地语',
			'languageOptions.portuguese' => '葡萄牙语',
			'common.tryAgain' => '重试',
			'common.retry' => '重试',
			'common.close' => '关闭',
			'permissionsRequired' => '需要权限',
			'permissionHelper.camAndMicRequired' => '视频通话需要摄像头和麦克风权限。请在设置中启用。',
			'permissionHelper.micRequired' => '语音通话需要麦克风权限。请在设置中启用。',
			'permissionHelper.cancel' => '取消',
			'permissionHelper.openSettings' => '打开设置',
			'videoView.title' => '相机滤镜',
			'videoView.subtitle' => '为您的相机预览选择外观。',
			'videoView.errorLoad' => '无法加载伙伴：',
			'videoView.noComps' => '目前没有伙伴可用。',
			'videoView.filters.ORIGINAL' => '原来的',
			'videoView.filters.ADDICTIVE_BLUE' => '令人上瘾的蓝色',
			'videoView.filters.ADDICTIVE_RED' => '令人上瘾的红色',
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
