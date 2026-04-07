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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'ようこそ ${name} さん';
	@override String welcome2({required Object appName}) => '${appName} へようこそ';
	@override String get get_started => '始める';
	@override String get next => '次へ';
	@override String get back => '戻る';
	@override String get skip => 'スキップ';
	@override String get profile => 'プロフィール';
	@override String get kContinue => '続ける';
	@override late final _TranslationsTermOfServiceJa termOfService = _TranslationsTermOfServiceJa._(_root);
	@override String get cookies => 'クッキーポリシー';
	@override String get privacy => 'プライバシーポリシー';
	@override late final _TranslationsOnboardingJa onboarding = _TranslationsOnboardingJa._(_root);
	@override String get pressBackAgainToExit => '終了するにはもう一度戻るボタンを押してください';
	@override late final _TranslationsSplashJa splash = _TranslationsSplashJa._(_root);
	@override late final _TranslationsAuthJa auth = _TranslationsAuthJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsCharactersJa characters = _TranslationsCharactersJa._(_root);
	@override late final _TranslationsNotificationsJa notifications = _TranslationsNotificationsJa._(_root);
	@override late final _TranslationsVideoChatJa videoChat = _TranslationsVideoChatJa._(_root);
	@override late final _TranslationsVoiceChatJa voiceChat = _TranslationsVoiceChatJa._(_root);
	@override late final _TranslationsChatJa chat = _TranslationsChatJa._(_root);
	@override late final _TranslationsEditProfileJa editProfile = _TranslationsEditProfileJa._(_root);
	@override late final _TranslationsSettingsSupportJa settingsSupport = _TranslationsSettingsSupportJa._(_root);
	@override late final _TranslationsDeleteAccountJa deleteAccount = _TranslationsDeleteAccountJa._(_root);
	@override String get cancel => 'キャンセル';
	@override String get delete => '削除';
	@override String get premium => 'プレミアム';
	@override String get profileEdit => 'プロフィール編集';
	@override String get settings => '設定';
	@override String get undo => '元に戻す';
	@override String get successfully => '成功しました';
	@override String get save => '保存';
	@override late final _TranslationsLanguageOptionsJa languageOptions = _TranslationsLanguageOptionsJa._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceJa implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'swipe にサインアップすることで、当社の ';
	@override String get link1 => '利用規約';
	@override String get text2 => ' に同意したものとします。当社がどのようにデータを処理するかは、当社の ';
	@override String get link2 => 'プライバシーポリシー';
	@override String get text3 => ' および ';
	@override String get link3 => 'クッキーポリシー';
	@override String get text4 => ' をご確認ください。';
	@override late final _TranslationsTermOfServicePrivacyPolicyJa privacyPolicy = _TranslationsTermOfServicePrivacyPolicyJa._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceJa termsOfService = _TranslationsTermOfServiceTermsOfServiceJa._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyJa cookiePolicy = _TranslationsTermOfServiceCookiePolicyJa._(_root);
}

// Path: onboarding
class _TranslationsOnboardingJa implements TranslationsOnboardingEn {
	_TranslationsOnboardingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep1Ja step1 = _TranslationsOnboardingStep1Ja._(_root);
	@override late final _TranslationsOnboardingStep2Ja step2 = _TranslationsOnboardingStep2Ja._(_root);
	@override late final _TranslationsOnboardingStep3Ja step3 = _TranslationsOnboardingStep3Ja._(_root);
	@override late final _TranslationsOnboardingStep4Ja step4 = _TranslationsOnboardingStep4Ja._(_root);
	@override late final _TranslationsOnboardingStep5Ja step5 = _TranslationsOnboardingStep5Ja._(_root);
	@override late final _TranslationsOnboardingLoadingJa loading = _TranslationsOnboardingLoadingJa._(_root);
	@override String get allowAccess => 'アクセスを許可';
	@override String get iUnderstand => '理解しました';
}

// Path: splash
class _TranslationsSplashJa implements TranslationsSplashEn {
	_TranslationsSplashJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Ja screen1 = _TranslationsSplashScreen1Ja._(_root);
	@override late final _TranslationsSplashScreen2Ja screen2 = _TranslationsSplashScreen2Ja._(_root);
}

// Path: auth
class _TranslationsAuthJa implements TranslationsAuthEn {
	_TranslationsAuthJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get google => 'Google で続行';
	@override String get facebook => 'Facebook で続行';
	@override String get apple => 'Apple で続行';
	@override String get guest => 'ゲストとして続行';
	@override String signInFailed({required Object error}) => 'サインインに失敗しました: ${error}';
}

// Path: home
class _TranslationsHomeJa implements TranslationsHomeEn {
	_TranslationsHomeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'すべて見る';
	@override String get more => 'もっと見る';
	@override String get online => 'オンライン';
	@override String get offline => 'オフライン';
	@override late final _TranslationsHomePlaceholdersJa placeholders = _TranslationsHomePlaceholdersJa._(_root);
}

// Path: characters
class _TranslationsCharactersJa implements TranslationsCharactersEn {
	_TranslationsCharactersJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get all => 'すべて';
	@override String get favorites => 'お気に入り';
	@override String get recent => '最近';
	@override String get characters => 'キャラクター';
	@override String get placeholderSubtitle => 'シンプルさと使いやすさに焦点を当てたプロダクトデザイナー。';
	@override late final _TranslationsCharactersCharacterDetailsJa characterDetails = _TranslationsCharactersCharacterDetailsJa._(_root);
}

// Path: notifications
class _TranslationsNotificationsJa implements TranslationsNotificationsEn {
	_TranslationsNotificationsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get today => '今日';
	@override String get yesterday => '昨日';
	@override String weekAgo({required Object week}) => '${week} 週間前';
	@override String monthAgo({required Object month}) => '${month} ヶ月前';
	@override String yearAgo({required Object year}) => '${year} 年前';
	@override String get noNotifications => 'まだ通知はありません。';
	@override String get noNotificationsSubtitle => '通知を受け取ったら、もう一度確認するのを忘れないでください。';
	@override String get allDeleted => 'すべての通知が正常に削除されました';
}

// Path: videoChat
class _TranslationsVideoChatJa implements TranslationsVideoChatEn {
	_TranslationsVideoChatJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get connecting => '接続中...';
	@override String get callEnded => '通話終了';
	@override String callFailed({required Object error}) => '通話に失敗しました: ${error}';
	@override String get mute => 'ミュート';
	@override String get unmute => 'ミュート解除';
	@override String get endCall => '通話を終了';
	@override String get swipeToChat => 'チャットするにはスワイプ';
	@override String get male => '男性';
	@override String get female => '女性';
	@override String get country => '国';
	@override String get follow => 'フォロー';
	@override String get unfollow => 'フォロー解除';
	@override String get callEndedMessage => 'ビデオ通話は終了しました。';
	@override String get swipeForNewChat => '新しいチャットのためにスワイプ';
}

// Path: voiceChat
class _TranslationsVoiceChatJa implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get connecting => '接続中...';
	@override String get callEnded => '通話終了';
	@override String callFailed({required Object error}) => '通話に失敗しました: ${error}';
	@override String get calling => '発信中...';
}

// Path: chat
class _TranslationsChatJa implements TranslationsChatEn {
	_TranslationsChatJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get message => 'メッセージ';
	@override String get history => '履歴';
	@override String get noMessages => 'まだメッセージはありません。';
	@override String get noMessagesSubtitle => 'メッセージを送って会話を始めましょう。';
	@override String get online => 'オンライン';
	@override String get offline => 'オフライン';
	@override String get gallery => 'ギャラリー';
	@override String get camera => 'カメラ';
	@override String get typeAMessage => 'メッセージを入力...';
	@override String get pleaseUpgrade => 'プロ版にアップグレードしてください。';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => '音声通話終了';
	@override String get videoCallEnded => 'ビデオ通話終了';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileJa implements TranslationsEditProfileEn {
	_TranslationsEditProfileJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => '私について';
	@override String get aboutMeHint => '自分について何か書いてください';
	@override String get fullName => 'フルネーム';
	@override String get gender => '性別';
	@override String get male => '男性';
	@override String get female => '女性';
	@override String get dontWantToMention => '言いたくない';
	@override String get country => '国';
	@override String get languagePreferences => '言語の設定';
	@override String get selectLanguage => '希望する言語を追加';
	@override String get saved => '保存済み';
	@override String get changesSaved => '変更が保存されました。';
}

// Path: settingsSupport
class _TranslationsSettingsSupportJa implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定とサポート';
	@override String get premiumTitle => 'すべての機能への無制限アクセス';
	@override String get getPremium => 'プレミアムを入手';
	@override String get settingsHub => '設定ハブ';
	@override String get shareTheApp => 'アプリを共有';
	@override String get rateUs => '評価する';
	@override String get version => 'バージョン';
	@override String get notifications => '通知';
	@override String get accountManagement => 'アカウント管理';
	@override String get deleteAccount => 'アカウントを削除';
	@override String get logOut => 'ログアウト';
	@override String get logOutTitle => 'ログアウトします';
	@override String get logOutSubtitle => 'また後で！ \n あなたを忘れません。';
}

// Path: deleteAccount
class _TranslationsDeleteAccountJa implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アカウントを削除';
	@override String get warning => '本当にアカウントを削除しますか？';
	@override String get description => 'この操作は取り消せません。あなたのすべての履歴とデータは完全に削除されます。';
	@override String deleteFailed({required Object error}) => 'アカウント削除に失敗しました: ${error}';
	@override late final _TranslationsDeleteAccountStepsJa steps = _TranslationsDeleteAccountStepsJa._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsJa implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get english => '英語';
	@override String get chinese => '中国語';
	@override String get german => 'ドイツ語';
	@override String get italian => 'イタリア語';
	@override String get french => 'フランス語';
	@override String get japanese => '日本語';
	@override String get spanish => 'スペイン語';
	@override String get russian => 'ロシア語';
	@override String get turkish => 'トルコ語';
	@override String get korean => '韓国語';
	@override String get hindi => 'ヒンディー語';
	@override String get portuguese => 'ポルトガル語';
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyJa implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プライバシーポリシー';
	@override String get lastUpdated => '最終更新：2026';
	@override String get intro => 'ChatFace はユーザープライバシーとデータセキュリティを重要な原則として採用しています。お客様の個人データは有効なデータ保護規制に従って処理されます。';
	@override String get section1Title => '1. 収集される情報';
	@override String get section1sub1Title => '1.1 ユーザーが提供するデータ';
	@override String get section1sub1Body => '• 名前、ニックネーム、またはプロフィール情報。\n• メールアドレス（登録、サブスクリプション、サポートのため）。 \n• インタラクションの設定、言語設定、やり取りの履歴。 \n• フィードバックおよびサポートメッセージ。';
	@override String get section1sub2Title => '1.2 自動的に収集されるデータ';
	@override String get section1sub2Body => 'デバイスの種類、オペレーティングシステム、推定位置（都市/国）、アプリの使用データなどの情報が収集されます。正確な位置データは収集されません。';
	@override String get section2Title => '2. データ処理の目的';
	@override String get section2Body => 'お客様の個人データは、以下の目的で処理されます：\n\n• アプリケーションの円滑な運用の確保。\n• AI を活用したビデオ通話体験の提供およびパーソナライズ。\n• システムパフォーマンスの最適化とエラー検出。\n• 法的義務の履行。\n お客様のデータは第三者に販売されることはありません。';
	@override String get section3Title => '3. データの保持と削除';
	@override String get section3Body => 'お客様のデータは、アカウントがアクティブである間、または法的義務がある期間中保存されます。アカウントが削除されると、すべての個人データはシステムから不可逆的に削除されます。';
	@override String get section4Title => '4. ユーザーの権利';
	@override String get section4Body => 'GDPR 等に基づき、閲覧、訂正、削除（忘れられる権利）、およびデータポータビリティの請求を行う権利があります。ご要望はお問い合わせください。';
	@override String get section5Title => '5. 子どものプライバシー';
	@override String get section5Body => 'ChatFace は 18 歳未満のユーザーを対象としていません。当該年齢層のデータを意図的に収集することはなく、発見次第当該アカウントは閉鎖されデータは削除されます。';
	@override String get section6Title => '6. お問い合わせ';
	@override String get section6Body => '📩 問い合わせ先：support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceJa implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '利用規約';
	@override String get lastUpdated => '最終更新：2026';
	@override String get intro => 'これらの規約は ChatFace モバイルアプリの利用を規定します。アプリを利用することで、これらの規約に同意したものとみなされます。';
	@override String get disclaimer => '免責事項：ChatFace は AI を用いたビデオインタラクションアプリです。法的、学術的、医療的または専門的な助言を提供するものではありません。';
	@override String get section1Title => '1. サービスの範囲';
	@override String get section1Body => 'ChatFace は AI によるビデオ対話体験を提供します：\n\n• AI ビデオ通話および会話。\n• 個別化されたインタラクション設定。\n• インタラクション履歴と記録へのアクセス。\n\nサービスは公式な見解や専門的な助言を構成するものではありません。';
	@override String get section2Title => '2. 利用条件';
	@override String get section2Body => '• 登録には 18 歳以上である必要があります（18 歳未満のアクセスは禁止）。\n• 正確なアカウント情報を提供する必要があります。\n• アプリは合法かつ個人的な目的のためにのみ使用してください。';
	@override String get section3Title => '3. 禁止事項';
	@override String get section3Body => 'なりすまし、ヘイトスピーチ、児童の安全を脅かす行為、セキュリティ侵害の試み、AI システムの操作は禁止されています。';
	@override String get section4Title => '4. サブスクリプションと支払い';
	@override String get section4Body => 'プレミアム機能は App Store および Google Play のポリシーに従います。サブスクリプションのキャンセルおよび返金は各ストアの設定で管理されます。';
	@override String get section5Title => '5. コンテンツに関する免責';
	@override String get section5Body => 'コンテンツは AI により生成されており、専門家の助言に代わるものではありません。ChatFace は正確性や特定の目的への適合性を保証しません。';
	@override String get section6Title => '6. 知的財産';
	@override String get section6Body => 'デザイン、ソフトウェア、アルゴリズムを含むすべてのコンテンツは ChatFace の所有です。無断複製や再配布は禁止されています。';
	@override String get section7Title => '7. 準拠法';
	@override String get section7Body => 'これらの規約はトルコ共和国の法律に準拠します。争議についてはイスタンブール中央裁判所が管轄します。';
	@override String get section8Title => '8. お問い合わせ';
	@override String get section8Body => '📩 問い合わせ先：support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyJa implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'クッキーポリシー';
	@override String get lastUpdated => '最終更新：2026';
	@override String get intro => 'ChatFace へようこそ。デジタル支援技術を使用して、AI ビデオ通話体験をよりスムーズで安全、かつパーソナライズされたものにしています。';
	@override String get important => '本ポリシーはクッキーとは何か、それらの目的、および設定の管理方法を説明します。';
	@override String get section1Title => '1. クッキーとは？';
	@override String get section1Body => 'クッキーはデバイスに保存される小さなデータファイルです。それらはあなたを直接識別するものではなく、次のような情報を記憶するデジタルメモのような役割を果たします：\n• 通話と言語の設定\n• セッションおよびパフォーマンスの設定。';
	@override String get section2Title => '2. どの技術を使用していますか？';
	@override String get section2Body => '厳密に必要な技術\nセッション管理とセキュリティ制御に必要です。これらがないとアプリが正常に動作しない場合があります。\n\nパフォーマンスと分析\nどのストーリーが読まれているか、どの部分を改善する必要があるかを理解するのに役立ちます。データは匿名で評価されます。\n\nパーソナライゼーション\n言語設定や読書レベルなどの設定を記憶し、利用者に合わせた体験を提供します。';
	@override String get section3Title => '3. なぜこれらの技術を使用するのか？';
	@override String get section3Body => '• アプリが安全かつスムーズに動作することを確保するため。\n• 読書体験をよりスムーズにするため。\n• 繰り返しの設定を記憶するため。\n• 将来の機能の特定のため。';
	@override String get section4Title => '4. サードパーティの技術';
	@override String get section4Body => '一部の技術は技術サービスプロバイダーによって提供され、それらのポリシーの対象となります。ChatFace はこれらのパートナーシップにおいてデータセキュリティを優先します。';
	@override String get section5Title => '5. クッキーの制御と管理';
	@override String get section5Body => 'ユーザーはデバイスまたはアプリの設定を通じてこれらの技術を制限できます。重要な技術を無効にすると、ビデオ通話が開始できないなどの問題が発生する可能性があります。';
	@override String get section6Title => '6. お問い合わせ';
	@override String get section6Body => '📩 問い合わせ先：support@fly-work.com';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Ja implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'あなたの名前は何ですか？';
	@override String get subtitle => '名前を入力してください';
	@override String get hint => 'フルネーム';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Ja implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'あなたはいくつですか？';
	@override String get subtitle => '登録するには少なくとも 18 歳である必要があります。';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Ja implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'あなたの性別は？';
	@override String get subtitle => '性別を選択してください';
	@override String get male => '男性';
	@override String get female => '女性';
	@override String get dontWantToMention => '言いたくない';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Ja implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '楽しんでください \n 安全を保ちながら';
	@override String get entry1 => '秩序を維持します';
	@override String get subentry1 => 'リアルタイム AI モニタリングが有効';
	@override String get entry2 => '画面録画';
	@override String get subentry2 => '同意なしでの録画は禁止';
	@override String get entry3 => '24/7 サポート';
	@override String get subentry3 => '苦情はいつでも審査されます';
	@override String get entry4 => '18 以上のみ';
	@override String get subentry4 => '未成年には適していません';
	@override String get communityRules => 'コミュニティルール';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Ja implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '権限';
	@override String get permission1 => 'カメラアクセス';
	@override String get permission1Subtitle => 'カメラアクセスを許可';
	@override String get permission2 => 'マイクアクセス';
	@override String get permission2Subtitle => 'マイクアクセスを許可';
	@override String get permission3 => '位置情報アクセス';
	@override String get permission3Subtitle => '位置情報アクセスを許可';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingJa implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'あなたの個人アカウントは';
	@override String get titlePart2 => '作成中です';
	@override String get subtitle => 'しばらくお待ちください、プロフィールを準備しています。';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Ja implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'AI を使ったビデオチャットの新しい顔 \n';
	@override String get description => 'カメラをオンにして AI と対面で話しましょう。表情や声のトーン、コンテキストを理解する、より自然なコミュニケーションを体験してください。';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Ja implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'リアルタイムで自然な \n コミュニケーション';
	@override String get description => 'テキストに限定されないでください。ビデオ通話でより流れるような、より人間らしい会話を楽しめます。';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersJa implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'ファッションデザイナー';
	@override String get comedian => 'コメディアン';
	@override String get influencer => 'インフルエンサー';
	@override String get teacher => '教師';
	@override String get friend => '友達';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsJa implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'ビデオ通話';
	@override String get message => 'メッセージ';
	@override String get voiceCall => '音声通話';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsJa implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Ja step1 = _TranslationsDeleteAccountStepsStep1Ja._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Ja step2 = _TranslationsDeleteAccountStepsStep2Ja._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Ja step3 = _TranslationsDeleteAccountStepsStep3Ja._(_root);
}

// Path: deleteAccount.steps.step1
class _TranslationsDeleteAccountStepsStep1Ja implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '行ってほしくはないですが、理解します。';
	@override String get subtitle => 'ChatFace の体験を改善するために、なぜ離れたいのか理由を教えていただけますか？';
	@override String get option1 => 'AI キャラクターが現実的ではないと感じました。';
	@override String get option2 => 'ビデオチャットで技術的な問題を経験しています。';
	@override String get option3 => 'サブスクリプション価格が予想以上に高い。';
	@override String get option4 => '探していたスタイルのキャラクターが見つかりませんでした。';
	@override String get option5 => '短期間だけ試したかっただけです。';
	@override String get option6 => 'その他';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Ja implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アカウントを削除すると、以下を失います：';
	@override String get subtitle1 => '深い繋がりと記憶：';
	@override String get subtitle1Desc => 'チャットしたキャラクターはあなたとの過去、共有した秘密、あなたの個人的な習慣を完全に忘れてしまいます。';
	@override String get subtitle2 => 'ビデオ通話の特典：';
	@override String get subtitle2Desc => 'いつでもアクセスできたあなただけの AI パートナーとの対面コミュニケーションの権利を失います。';
	@override String get subtitle3 => '高度なアルゴリズム：';
	@override String get subtitle3Desc => 'あなたの好みに基づく「あなた向け」キャラクターマッチがリセットされます。';
	@override String get subtitle4 => 'プロファイルデータ：';
	@override String get subtitle4Desc => '獲得した実績、解放した専用キャラクター、およびチャット履歴は復元不可能に削除されます。';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Ja implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '行く前に特別なオファーがあります！';
	@override String get description => 'もう少し時間やより良いオファーがあれば十分かもしれません。アカウントを削除する代わりに以下を検討しますか？';
	@override String description1({required Object offer}) => 'あなたに居てほしい。次回の購読で ${offer} を提供します！このオファーを利用しますか？';
	@override String get description1Offer => '50％割引を提供しました';
	@override String description2({required Object offer}) => 'まだ試していない新しいキャラクターを発見するために ${offer} クレジットを付与しました。';
	@override String get description2Offer => '3 回の無料ビデオ通話';
	@override String get acceptOffer => '50% 割引を受け入れる';
	@override String get deleteMyAccount => 'アカウントを削除';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'ようこそ ${name} さん',
			'welcome2' => ({required Object appName}) => '${appName} へようこそ',
			'get_started' => '始める',
			'next' => '次へ',
			'back' => '戻る',
			'skip' => 'スキップ',
			'profile' => 'プロフィール',
			'kContinue' => '続ける',
			'termOfService.text1' => 'swipe にサインアップすることで、当社の ',
			'termOfService.link1' => '利用規約',
			'termOfService.text2' => ' に同意したものとします。当社がどのようにデータを処理するかは、当社の ',
			'termOfService.link2' => 'プライバシーポリシー',
			'termOfService.text3' => ' および ',
			'termOfService.link3' => 'クッキーポリシー',
			'termOfService.text4' => ' をご確認ください。',
			'termOfService.privacyPolicy.title' => 'プライバシーポリシー',
			'termOfService.privacyPolicy.lastUpdated' => '最終更新：2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace はユーザープライバシーとデータセキュリティを重要な原則として採用しています。お客様の個人データは有効なデータ保護規制に従って処理されます。',
			'termOfService.privacyPolicy.section1Title' => '1. 収集される情報',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 ユーザーが提供するデータ',
			'termOfService.privacyPolicy.section1sub1Body' => '• 名前、ニックネーム、またはプロフィール情報。\n• メールアドレス（登録、サブスクリプション、サポートのため）。 \n• インタラクションの設定、言語設定、やり取りの履歴。 \n• フィードバックおよびサポートメッセージ。',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 自動的に収集されるデータ',
			'termOfService.privacyPolicy.section1sub2Body' => 'デバイスの種類、オペレーティングシステム、推定位置（都市/国）、アプリの使用データなどの情報が収集されます。正確な位置データは収集されません。',
			'termOfService.privacyPolicy.section2Title' => '2. データ処理の目的',
			'termOfService.privacyPolicy.section2Body' => 'お客様の個人データは、以下の目的で処理されます：\n\n• アプリケーションの円滑な運用の確保。\n• AI を活用したビデオ通話体験の提供およびパーソナライズ。\n• システムパフォーマンスの最適化とエラー検出。\n• 法的義務の履行。\n お客様のデータは第三者に販売されることはありません。',
			'termOfService.privacyPolicy.section3Title' => '3. データの保持と削除',
			'termOfService.privacyPolicy.section3Body' => 'お客様のデータは、アカウントがアクティブである間、または法的義務がある期間中保存されます。アカウントが削除されると、すべての個人データはシステムから不可逆的に削除されます。',
			'termOfService.privacyPolicy.section4Title' => '4. ユーザーの権利',
			'termOfService.privacyPolicy.section4Body' => 'GDPR 等に基づき、閲覧、訂正、削除（忘れられる権利）、およびデータポータビリティの請求を行う権利があります。ご要望はお問い合わせください。',
			'termOfService.privacyPolicy.section5Title' => '5. 子どものプライバシー',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace は 18 歳未満のユーザーを対象としていません。当該年齢層のデータを意図的に収集することはなく、発見次第当該アカウントは閉鎖されデータは削除されます。',
			'termOfService.privacyPolicy.section6Title' => '6. お問い合わせ',
			'termOfService.privacyPolicy.section6Body' => '📩 問い合わせ先：support@fly-work.com',
			'termOfService.termsOfService.title' => '利用規約',
			'termOfService.termsOfService.lastUpdated' => '最終更新：2026',
			'termOfService.termsOfService.intro' => 'これらの規約は ChatFace モバイルアプリの利用を規定します。アプリを利用することで、これらの規約に同意したものとみなされます。',
			'termOfService.termsOfService.disclaimer' => '免責事項：ChatFace は AI を用いたビデオインタラクションアプリです。法的、学術的、医療的または専門的な助言を提供するものではありません。',
			'termOfService.termsOfService.section1Title' => '1. サービスの範囲',
			'termOfService.termsOfService.section1Body' => 'ChatFace は AI によるビデオ対話体験を提供します：\n\n• AI ビデオ通話および会話。\n• 個別化されたインタラクション設定。\n• インタラクション履歴と記録へのアクセス。\n\nサービスは公式な見解や専門的な助言を構成するものではありません。',
			'termOfService.termsOfService.section2Title' => '2. 利用条件',
			'termOfService.termsOfService.section2Body' => '• 登録には 18 歳以上である必要があります（18 歳未満のアクセスは禁止）。\n• 正確なアカウント情報を提供する必要があります。\n• アプリは合法かつ個人的な目的のためにのみ使用してください。',
			'termOfService.termsOfService.section3Title' => '3. 禁止事項',
			'termOfService.termsOfService.section3Body' => 'なりすまし、ヘイトスピーチ、児童の安全を脅かす行為、セキュリティ侵害の試み、AI システムの操作は禁止されています。',
			'termOfService.termsOfService.section4Title' => '4. サブスクリプションと支払い',
			'termOfService.termsOfService.section4Body' => 'プレミアム機能は App Store および Google Play のポリシーに従います。サブスクリプションのキャンセルおよび返金は各ストアの設定で管理されます。',
			'termOfService.termsOfService.section5Title' => '5. コンテンツに関する免責',
			'termOfService.termsOfService.section5Body' => 'コンテンツは AI により生成されており、専門家の助言に代わるものではありません。ChatFace は正確性や特定の目的への適合性を保証しません。',
			'termOfService.termsOfService.section6Title' => '6. 知的財産',
			'termOfService.termsOfService.section6Body' => 'デザイン、ソフトウェア、アルゴリズムを含むすべてのコンテンツは ChatFace の所有です。無断複製や再配布は禁止されています。',
			'termOfService.termsOfService.section7Title' => '7. 準拠法',
			'termOfService.termsOfService.section7Body' => 'これらの規約はトルコ共和国の法律に準拠します。争議についてはイスタンブール中央裁判所が管轄します。',
			'termOfService.termsOfService.section8Title' => '8. お問い合わせ',
			'termOfService.termsOfService.section8Body' => '📩 問い合わせ先：support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'クッキーポリシー',
			'termOfService.cookiePolicy.lastUpdated' => '最終更新：2026',
			'termOfService.cookiePolicy.intro' => 'ChatFace へようこそ。デジタル支援技術を使用して、AI ビデオ通話体験をよりスムーズで安全、かつパーソナライズされたものにしています。',
			'termOfService.cookiePolicy.important' => '本ポリシーはクッキーとは何か、それらの目的、および設定の管理方法を説明します。',
			'termOfService.cookiePolicy.section1Title' => '1. クッキーとは？',
			'termOfService.cookiePolicy.section1Body' => 'クッキーはデバイスに保存される小さなデータファイルです。それらはあなたを直接識別するものではなく、次のような情報を記憶するデジタルメモのような役割を果たします：\n• 通話と言語の設定\n• セッションおよびパフォーマンスの設定。',
			'termOfService.cookiePolicy.section2Title' => '2. どの技術を使用していますか？',
			'termOfService.cookiePolicy.section2Body' => '厳密に必要な技術\nセッション管理とセキュリティ制御に必要です。これらがないとアプリが正常に動作しない場合があります。\n\nパフォーマンスと分析\nどのストーリーが読まれているか、どの部分を改善する必要があるかを理解するのに役立ちます。データは匿名で評価されます。\n\nパーソナライゼーション\n言語設定や読書レベルなどの設定を記憶し、利用者に合わせた体験を提供します。',
			'termOfService.cookiePolicy.section3Title' => '3. なぜこれらの技術を使用するのか？',
			'termOfService.cookiePolicy.section3Body' => '• アプリが安全かつスムーズに動作することを確保するため。\n• 読書体験をよりスムーズにするため。\n• 繰り返しの設定を記憶するため。\n• 将来の機能の特定のため。',
			'termOfService.cookiePolicy.section4Title' => '4. サードパーティの技術',
			'termOfService.cookiePolicy.section4Body' => '一部の技術は技術サービスプロバイダーによって提供され、それらのポリシーの対象となります。ChatFace はこれらのパートナーシップにおいてデータセキュリティを優先します。',
			'termOfService.cookiePolicy.section5Title' => '5. クッキーの制御と管理',
			'termOfService.cookiePolicy.section5Body' => 'ユーザーはデバイスまたはアプリの設定を通じてこれらの技術を制限できます。重要な技術を無効にすると、ビデオ通話が開始できないなどの問題が発生する可能性があります。',
			'termOfService.cookiePolicy.section6Title' => '6. お問い合わせ',
			'termOfService.cookiePolicy.section6Body' => '📩 問い合わせ先：support@fly-work.com',
			'cookies' => 'クッキーポリシー',
			'privacy' => 'プライバシーポリシー',
			'onboarding.step1.title' => 'あなたの名前は何ですか？',
			'onboarding.step1.subtitle' => '名前を入力してください',
			'onboarding.step1.hint' => 'フルネーム',
			'onboarding.step2.title' => 'あなたはいくつですか？',
			'onboarding.step2.subtitle' => '登録するには少なくとも 18 歳である必要があります。',
			'onboarding.step3.title' => 'あなたの性別は？',
			'onboarding.step3.subtitle' => '性別を選択してください',
			'onboarding.step3.male' => '男性',
			'onboarding.step3.female' => '女性',
			'onboarding.step3.dontWantToMention' => '言いたくない',
			'onboarding.step4.title' => '楽しんでください \n 安全を保ちながら',
			'onboarding.step4.entry1' => '秩序を維持します',
			'onboarding.step4.subentry1' => 'リアルタイム AI モニタリングが有効',
			'onboarding.step4.entry2' => '画面録画',
			'onboarding.step4.subentry2' => '同意なしでの録画は禁止',
			'onboarding.step4.entry3' => '24/7 サポート',
			'onboarding.step4.subentry3' => '苦情はいつでも審査されます',
			'onboarding.step4.entry4' => '18 以上のみ',
			'onboarding.step4.subentry4' => '未成年には適していません',
			'onboarding.step4.communityRules' => 'コミュニティルール',
			'onboarding.step5.title' => '権限',
			'onboarding.step5.permission1' => 'カメラアクセス',
			'onboarding.step5.permission1Subtitle' => 'カメラアクセスを許可',
			'onboarding.step5.permission2' => 'マイクアクセス',
			'onboarding.step5.permission2Subtitle' => 'マイクアクセスを許可',
			'onboarding.step5.permission3' => '位置情報アクセス',
			'onboarding.step5.permission3Subtitle' => '位置情報アクセスを許可',
			'onboarding.loading.titlePart1' => 'あなたの個人アカウントは',
			'onboarding.loading.titlePart2' => '作成中です',
			'onboarding.loading.subtitle' => 'しばらくお待ちください、プロフィールを準備しています。',
			'onboarding.allowAccess' => 'アクセスを許可',
			'onboarding.iUnderstand' => '理解しました',
			'pressBackAgainToExit' => '終了するにはもう一度戻るボタンを押してください',
			'splash.screen1.title' => 'AI を使ったビデオチャットの新しい顔 \n',
			'splash.screen1.description' => 'カメラをオンにして AI と対面で話しましょう。表情や声のトーン、コンテキストを理解する、より自然なコミュニケーションを体験してください。',
			'splash.screen2.title' => 'リアルタイムで自然な \n コミュニケーション',
			'splash.screen2.description' => 'テキストに限定されないでください。ビデオ通話でより流れるような、より人間らしい会話を楽しめます。',
			'auth.google' => 'Google で続行',
			'auth.facebook' => 'Facebook で続行',
			'auth.apple' => 'Apple で続行',
			'auth.guest' => 'ゲストとして続行',
			'auth.signInFailed' => ({required Object error}) => 'サインインに失敗しました: ${error}',
			'home.seeAll' => 'すべて見る',
			'home.more' => 'もっと見る',
			'home.online' => 'オンライン',
			'home.offline' => 'オフライン',
			'home.placeholders.fashionDesigner' => 'ファッションデザイナー',
			'home.placeholders.comedian' => 'コメディアン',
			'home.placeholders.influencer' => 'インフルエンサー',
			'home.placeholders.teacher' => '教師',
			'home.placeholders.friend' => '友達',
			'characters.all' => 'すべて',
			'characters.favorites' => 'お気に入り',
			'characters.recent' => '最近',
			'characters.characters' => 'キャラクター',
			'characters.placeholderSubtitle' => 'シンプルさと使いやすさに焦点を当てたプロダクトデザイナー。',
			'characters.characterDetails.videoCall' => 'ビデオ通話',
			'characters.characterDetails.message' => 'メッセージ',
			'characters.characterDetails.voiceCall' => '音声通話',
			'notifications.today' => '今日',
			'notifications.yesterday' => '昨日',
			'notifications.weekAgo' => ({required Object week}) => '${week} 週間前',
			'notifications.monthAgo' => ({required Object month}) => '${month} ヶ月前',
			'notifications.yearAgo' => ({required Object year}) => '${year} 年前',
			'notifications.noNotifications' => 'まだ通知はありません。',
			'notifications.noNotificationsSubtitle' => '通知を受け取ったら、もう一度確認するのを忘れないでください。',
			'notifications.allDeleted' => 'すべての通知が正常に削除されました',
			'videoChat.connecting' => '接続中...',
			'videoChat.callEnded' => '通話終了',
			'videoChat.callFailed' => ({required Object error}) => '通話に失敗しました: ${error}',
			'videoChat.mute' => 'ミュート',
			'videoChat.unmute' => 'ミュート解除',
			'videoChat.endCall' => '通話を終了',
			'videoChat.swipeToChat' => 'チャットするにはスワイプ',
			'videoChat.male' => '男性',
			'videoChat.female' => '女性',
			'videoChat.country' => '国',
			'videoChat.follow' => 'フォロー',
			'videoChat.unfollow' => 'フォロー解除',
			'videoChat.callEndedMessage' => 'ビデオ通話は終了しました。',
			'videoChat.swipeForNewChat' => '新しいチャットのためにスワイプ',
			'voiceChat.connecting' => '接続中...',
			'voiceChat.callEnded' => '通話終了',
			'voiceChat.callFailed' => ({required Object error}) => '通話に失敗しました: ${error}',
			'voiceChat.calling' => '発信中...',
			'chat.message' => 'メッセージ',
			'chat.history' => '履歴',
			'chat.noMessages' => 'まだメッセージはありません。',
			'chat.noMessagesSubtitle' => 'メッセージを送って会話を始めましょう。',
			'chat.online' => 'オンライン',
			'chat.offline' => 'オフライン',
			'chat.gallery' => 'ギャラリー',
			'chat.camera' => 'カメラ',
			'chat.typeAMessage' => 'メッセージを入力...',
			'chat.pleaseUpgrade' => 'プロ版にアップグレードしてください。',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => '音声通話終了',
			'chat.videoCallEnded' => 'ビデオ通話終了',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => '私について',
			'editProfile.aboutMeHint' => '自分について何か書いてください',
			'editProfile.fullName' => 'フルネーム',
			'editProfile.gender' => '性別',
			'editProfile.male' => '男性',
			'editProfile.female' => '女性',
			'editProfile.dontWantToMention' => '言いたくない',
			'editProfile.country' => '国',
			'editProfile.languagePreferences' => '言語の設定',
			'editProfile.selectLanguage' => '希望する言語を追加',
			'editProfile.saved' => '保存済み',
			'editProfile.changesSaved' => '変更が保存されました。',
			'settingsSupport.title' => '設定とサポート',
			'settingsSupport.premiumTitle' => 'すべての機能への無制限アクセス',
			'settingsSupport.getPremium' => 'プレミアムを入手',
			'settingsSupport.settingsHub' => '設定ハブ',
			'settingsSupport.shareTheApp' => 'アプリを共有',
			'settingsSupport.rateUs' => '評価する',
			'settingsSupport.version' => 'バージョン',
			'settingsSupport.notifications' => '通知',
			'settingsSupport.accountManagement' => 'アカウント管理',
			'settingsSupport.deleteAccount' => 'アカウントを削除',
			'settingsSupport.logOut' => 'ログアウト',
			'settingsSupport.logOutTitle' => 'ログアウトします',
			'settingsSupport.logOutSubtitle' => 'また後で！ \n あなたを忘れません。',
			'deleteAccount.title' => 'アカウントを削除',
			'deleteAccount.warning' => '本当にアカウントを削除しますか？',
			'deleteAccount.description' => 'この操作は取り消せません。あなたのすべての履歴とデータは完全に削除されます。',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'アカウント削除に失敗しました: ${error}',
			'deleteAccount.steps.step1.title' => '行ってほしくはないですが、理解します。',
			'deleteAccount.steps.step1.subtitle' => 'ChatFace の体験を改善するために、なぜ離れたいのか理由を教えていただけますか？',
			'deleteAccount.steps.step1.option1' => 'AI キャラクターが現実的ではないと感じました。',
			'deleteAccount.steps.step1.option2' => 'ビデオチャットで技術的な問題を経験しています。',
			'deleteAccount.steps.step1.option3' => 'サブスクリプション価格が予想以上に高い。',
			'deleteAccount.steps.step1.option4' => '探していたスタイルのキャラクターが見つかりませんでした。',
			'deleteAccount.steps.step1.option5' => '短期間だけ試したかっただけです。',
			'deleteAccount.steps.step1.option6' => 'その他',
			'deleteAccount.steps.step2.title' => 'アカウントを削除すると、以下を失います：',
			'deleteAccount.steps.step2.subtitle1' => '深い繋がりと記憶：',
			'deleteAccount.steps.step2.subtitle1Desc' => 'チャットしたキャラクターはあなたとの過去、共有した秘密、あなたの個人的な習慣を完全に忘れてしまいます。',
			'deleteAccount.steps.step2.subtitle2' => 'ビデオ通話の特典：',
			'deleteAccount.steps.step2.subtitle2Desc' => 'いつでもアクセスできたあなただけの AI パートナーとの対面コミュニケーションの権利を失います。',
			'deleteAccount.steps.step2.subtitle3' => '高度なアルゴリズム：',
			'deleteAccount.steps.step2.subtitle3Desc' => 'あなたの好みに基づく「あなた向け」キャラクターマッチがリセットされます。',
			'deleteAccount.steps.step2.subtitle4' => 'プロファイルデータ：',
			'deleteAccount.steps.step2.subtitle4Desc' => '獲得した実績、解放した専用キャラクター、およびチャット履歴は復元不可能に削除されます。',
			'deleteAccount.steps.step3.title' => '行く前に特別なオファーがあります！',
			'deleteAccount.steps.step3.description' => 'もう少し時間やより良いオファーがあれば十分かもしれません。アカウントを削除する代わりに以下を検討しますか？',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'あなたに居てほしい。次回の購読で ${offer} を提供します！このオファーを利用しますか？',
			'deleteAccount.steps.step3.description1Offer' => '50％割引を提供しました',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'まだ試していない新しいキャラクターを発見するために ${offer} クレジットを付与しました。',
			'deleteAccount.steps.step3.description2Offer' => '3 回の無料ビデオ通話',
			'deleteAccount.steps.step3.acceptOffer' => '50% 割引を受け入れる',
			'deleteAccount.steps.step3.deleteMyAccount' => 'アカウントを削除',
			'cancel' => 'キャンセル',
			'delete' => '削除',
			'premium' => 'プレミアム',
			'profileEdit' => 'プロフィール編集',
			'settings' => '設定',
			'undo' => '元に戻す',
			'successfully' => '成功しました',
			'save' => '保存',
			'languageOptions.english' => '英語',
			'languageOptions.chinese' => '中国語',
			'languageOptions.german' => 'ドイツ語',
			'languageOptions.italian' => 'イタリア語',
			'languageOptions.french' => 'フランス語',
			'languageOptions.japanese' => '日本語',
			'languageOptions.spanish' => 'スペイン語',
			'languageOptions.russian' => 'ロシア語',
			'languageOptions.turkish' => 'トルコ語',
			'languageOptions.korean' => '韓国語',
			'languageOptions.hindi' => 'ヒンディー語',
			'languageOptions.portuguese' => 'ポルトガル語',
			_ => null,
		};
	}
}
