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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Добро пожаловать, ${name}';
	@override String welcome2({required Object appName}) => 'Добро пожаловать в ${appName}';
	@override String get get_started => 'Начать';
	@override String get next => 'Далее';
	@override String get back => 'Назад';
	@override String get skip => 'Пропустить';
	@override String get profile => 'Профиль';
	@override String get kContinue => 'Продолжить';
	@override late final _TranslationsTermOfServiceRu termOfService = _TranslationsTermOfServiceRu._(_root);
	@override String get cookies => 'Политика файлов cookie';
	@override String get privacy => 'Политика конфиденциальности';
	@override late final _TranslationsOnboardingRu onboarding = _TranslationsOnboardingRu._(_root);
	@override String get pressBackAgainToExit => 'Нажмите Назад ещё раз, чтобы выйти';
	@override late final _TranslationsSplashRu splash = _TranslationsSplashRu._(_root);
	@override late final _TranslationsAuthRu auth = _TranslationsAuthRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsCharactersRu characters = _TranslationsCharactersRu._(_root);
	@override late final _TranslationsNotificationsRu notifications = _TranslationsNotificationsRu._(_root);
	@override late final _TranslationsVideoChatRu videoChat = _TranslationsVideoChatRu._(_root);
	@override late final _TranslationsVoiceChatRu voiceChat = _TranslationsVoiceChatRu._(_root);
	@override late final _TranslationsChatRu chat = _TranslationsChatRu._(_root);
	@override late final _TranslationsEditProfileRu editProfile = _TranslationsEditProfileRu._(_root);
	@override late final _TranslationsSettingsSupportRu settingsSupport = _TranslationsSettingsSupportRu._(_root);
	@override late final _TranslationsDeleteAccountRu deleteAccount = _TranslationsDeleteAccountRu._(_root);
	@override String get cancel => 'Отмена';
	@override String get delete => 'Удалить';
	@override String get premium => 'Премиум';
	@override String get profileEdit => 'Редактировать профиль';
	@override String get settings => 'Настройки';
	@override String get undo => 'Отменить';
	@override String get successfully => 'Успешно';
	@override String get save => 'Сохранить';
	@override late final _TranslationsLanguageOptionsRu languageOptions = _TranslationsLanguageOptionsRu._(_root);
	@override late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
	@override String get permissionsRequired => 'Требуются разрешения';
	@override late final _TranslationsPermissionHelperRu permissionHelper = _TranslationsPermissionHelperRu._(_root);
	@override late final _TranslationsVideoViewRu videoView = _TranslationsVideoViewRu._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceRu implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Регистрируясь в swipe, вы соглашаетесь с нашими ';
	@override String get link1 => 'Условиями обслуживания';
	@override String get text2 => '. Узнайте, как мы обрабатываем ваши данные в нашей ';
	@override String get link2 => 'Политике конфиденциальности';
	@override String get text3 => ' и ';
	@override String get link3 => 'Политике файлов cookie';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyRu privacyPolicy = _TranslationsTermOfServicePrivacyPolicyRu._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceRu termsOfService = _TranslationsTermOfServiceTermsOfServiceRu._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyRu cookiePolicy = _TranslationsTermOfServiceCookiePolicyRu._(_root);
}

// Path: onboarding
class _TranslationsOnboardingRu implements TranslationsOnboardingEn {
	_TranslationsOnboardingRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5Ru step5 = _TranslationsOnboardingStep5Ru._(_root);
	@override late final _TranslationsOnboardingStep1Ru step1 = _TranslationsOnboardingStep1Ru._(_root);
	@override late final _TranslationsOnboardingStep2Ru step2 = _TranslationsOnboardingStep2Ru._(_root);
	@override late final _TranslationsOnboardingStep3Ru step3 = _TranslationsOnboardingStep3Ru._(_root);
	@override late final _TranslationsOnboardingStep4Ru step4 = _TranslationsOnboardingStep4Ru._(_root);
	@override late final _TranslationsOnboardingLoadingRu loading = _TranslationsOnboardingLoadingRu._(_root);
	@override String get allowAccess => 'Разрешить доступ';
	@override String get iUnderstand => 'Понял';
}

// Path: splash
class _TranslationsSplashRu implements TranslationsSplashEn {
	_TranslationsSplashRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Ru screen1 = _TranslationsSplashScreen1Ru._(_root);
	@override late final _TranslationsSplashScreen2Ru screen2 = _TranslationsSplashScreen2Ru._(_root);
}

// Path: auth
class _TranslationsAuthRu implements TranslationsAuthEn {
	_TranslationsAuthRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get google => 'Продолжить с Google';
	@override String get facebook => 'Продолжить с Facebook';
	@override String get apple => 'Продолжить с Apple';
	@override String get guest => 'Продолжить как гость';
	@override String signInFailed({required Object error}) => 'Ошибка входа: ${error}';
}

// Path: home
class _TranslationsHomeRu implements TranslationsHomeEn {
	_TranslationsHomeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Посмотреть все';
	@override String get more => 'Ещё';
	@override String get online => 'В сети';
	@override String get offline => 'Не в сети';
	@override late final _TranslationsHomePlaceholdersRu placeholders = _TranslationsHomePlaceholdersRu._(_root);
}

// Path: characters
class _TranslationsCharactersRu implements TranslationsCharactersEn {
	_TranslationsCharactersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get all => 'Все';
	@override String get favorites => 'Избранное';
	@override String get recent => 'Недавние';
	@override String get characters => 'Персонажи';
	@override String get placeholderSubtitle => 'Дизайнер продуктов, ориентированный на простоту и удобство использования.';
	@override late final _TranslationsCharactersCharacterDetailsRu characterDetails = _TranslationsCharactersCharacterDetailsRu._(_root);
}

// Path: notifications
class _TranslationsNotificationsRu implements TranslationsNotificationsEn {
	_TranslationsNotificationsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get today => 'Сегодня';
	@override String get yesterday => 'Вчера';
	@override String weekAgo({required Object week}) => '${week} неделя назад';
	@override String monthAgo({required Object month}) => '${month} месяц назад';
	@override String yearAgo({required Object year}) => '${year} год назад';
	@override String get noNotifications => 'Пока нет уведомлений.';
	@override String get noNotificationsSubtitle => 'Не забудьте проверить позже, когда получите уведомление.';
	@override String get allDeleted => 'Все уведомления успешно удалены';
}

// Path: videoChat
class _TranslationsVideoChatRu implements TranslationsVideoChatEn {
	_TranslationsVideoChatRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Обнаружена проблема с сетью. Переподключение микрофона...';
	@override String get failedToUpdateFollow => 'Не удалось обновить статус.';
	@override String get connecting => 'Подключение...';
	@override String get callEnded => 'Звонок завершён';
	@override String callFailed({required Object error}) => 'Звонок не удался: ${error}';
	@override String get mute => 'Отключить звук';
	@override String get unmute => 'Включить звук';
	@override String get endCall => 'Завершить звонок';
	@override String get swipeToChat => 'Проведите, чтобы начать чат';
	@override String get male => 'Мужчина';
	@override String get female => 'Женщина';
	@override String get country => 'Страна';
	@override String get follow => 'Подписаться';
	@override String get unfollow => 'Отписаться';
	@override String get callEndedMessage => 'Видеозвонок завершён.';
	@override String get swipeForNewChat => 'Проведите для нового чата';
}

// Path: voiceChat
class _TranslationsVoiceChatRu implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Подключение...';
	@override String get callEnded => 'Звонок завершён';
	@override String callFailed({required Object error}) => 'Звонок не удался: ${error}';
	@override String get calling => 'Звонок...';
}

// Path: chat
class _TranslationsChatRu implements TranslationsChatEn {
	_TranslationsChatRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get message => 'Сообщение';
	@override String get history => 'История';
	@override String get noMessages => 'Пока нет сообщений.';
	@override String get noMessagesSubtitle => 'Начните разговор, отправив сообщение.';
	@override String get online => 'В сети';
	@override String get offline => 'Не в сети';
	@override String get gallery => 'Галерея';
	@override String get camera => 'Камера';
	@override String get typeAMessage => 'Введите сообщение...';
	@override String get pleaseUpgrade => 'Пожалуйста, обновитесь до версии Pro.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Голосовой звонок завершён';
	@override String get videoCallEnded => 'Видеозвонок завершён';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileRu implements TranslationsEditProfileEn {
	_TranslationsEditProfileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Обо мне';
	@override String get aboutMeHint => 'Напишите что-нибудь о себе';
	@override String get fullName => 'Полное имя';
	@override String get gender => 'Пол';
	@override String get male => 'Мужчина';
	@override String get female => 'Женщина';
	@override String get dontWantToMention => 'Не хочу указывать';
	@override String get country => 'Страна';
	@override String get languagePreferences => 'Языковые предпочтения';
	@override String get selectLanguage => 'Добавьте предпочитаемый язык';
	@override String get saved => 'Сохранено';
	@override String get changesSaved => 'Изменения сохранены.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportRu implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки и поддержка';
	@override String get premiumTitle => 'Неограниченный доступ \nко всем функциям';
	@override String get getPremium => 'Получить Premium';
	@override String get settingsHub => 'Центр настроек';
	@override String get shareTheApp => 'Поделиться приложением';
	@override String get rateUs => 'Оцените нас';
	@override String get version => 'Версия';
	@override String get notifications => 'Уведомления';
	@override String get accountManagement => 'Управление аккаунтом';
	@override String get deleteAccount => 'Удалить аккаунт';
	@override String get logOut => 'Выйти';
	@override String get logOutTitle => 'Вы собираетесь выйти';
	@override String get logOutSubtitle => 'До скорой встречи!\nМы будем по вам скучать.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountRu implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Удалить аккаунт';
	@override String get warning => 'Вы уверены, что хотите удалить аккаунт?';
	@override String get description => 'Это действие нельзя будет отменить, и все ваши данные и история будут удалены навсегда.';
	@override String deleteFailed({required Object error}) => 'Сбой удаления аккаунта: ${error}';
	@override late final _TranslationsDeleteAccountStepsRu steps = _TranslationsDeleteAccountStepsRu._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsRu implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get english => 'Английский';
	@override String get chinese => 'Китайский';
	@override String get german => 'Немецкий';
	@override String get italian => 'Итальянский';
	@override String get french => 'Французский';
	@override String get japanese => 'Японский';
	@override String get spanish => 'Испанский';
	@override String get russian => 'Русский';
	@override String get turkish => 'Турецкий';
	@override String get korean => 'Корейский';
	@override String get hindi => 'Хинди';
	@override String get portuguese => 'Португальский';
}

// Path: common
class _TranslationsCommonRu implements TranslationsCommonEn {
	_TranslationsCommonRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Попробовать снова';
	@override String get retry => 'Повторить';
	@override String get close => 'Закрыть';
}

// Path: permissionHelper
class _TranslationsPermissionHelperRu implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Для видеозвонков требуются разрешения камеры и микрофона. Включите их в настройках.';
	@override String get micRequired => 'Для голосовых звонков требуется разрешение на микрофон. Включите в настройках.';
	@override String get cancel => 'Отмена';
	@override String get openSettings => 'Открыть настройки';
}

// Path: videoView
class _TranslationsVideoViewRu implements TranslationsVideoViewEn {
	_TranslationsVideoViewRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Фильтры камеры';
	@override String get subtitle => 'Выберите внешний вид для предварительного просмотра камеры.';
	@override String get errorLoad => 'Не удалось загрузить компаньонов: ';
	@override String get noComps => 'Пока нет доступных компаньонов.';
	@override late final _TranslationsVideoViewFiltersRu filters = _TranslationsVideoViewFiltersRu._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyRu implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Политика конфиденциальности';
	@override String get lastUpdated => 'Последнее обновление: 2026';
	@override String get intro => 'ChatFace рассматривает конфиденциальность пользователей и безопасность данных как основной принцип. Все ваши персональные данные обрабатываются в соответствии с действующими правилами защиты данных.';
	@override String get section1Title => '1. СОБИРАЕМАЯ ИНФОРМАЦИЯ';
	@override String get section1sub1Title => '1.1 Данные, предоставленные пользователем';
	@override String get section1sub1Body => '• Имя, прозвище или информация профиля.\n• Адрес электронной почты (для регистрации, подписки и поддержки). \n• Предпочтения взаимодействия, настройки языка и взаимодействия. \n• Сообщения с отзывами и в поддержку.';
	@override String get section1sub2Title => '1.2 Данные, собираемые автоматически';
	@override String get section1sub2Body => 'Собирается информация, такая как тип устройства, операционная система, приблизительное местоположение (город/страна) и данные об использовании приложения. Точные данные о местоположении не собираются.';
	@override String get section2Title => '2. ЦЕЛИ ОБРАБОТКИ ДАННЫХ';
	@override String get section2Body => 'Ваши персональные данные обрабатываются для следующих целей:\n\n• Обеспечение бесперебойной работы приложения.\n• Предоставление и персонализация видео-звонков с поддержкой ИИ.\n• Оптимизация производительности системы и обнаружение ошибок.\n• Выполнение юридических обязательств.\n Ваши данные никогда не продаются третьим лицам.';
	@override String get section3Title => '3. ХРАНЕНИЕ И УДАЛЕНИЕ ДАННЫХ';
	@override String get section3Body => 'Ваши данные хранятся до тех пор, пока ваша учетная запись активна или в течение срока юридических обязательств. Когда учетная запись удаляется, все персональные данные безвозвратно удаляются из систем.';
	@override String get section4Title => '4. ПРАВА ПОЛЬЗОВАТЕЛЕЙ';
	@override String get section4Body => 'В рамках GDPR и других законов у вас есть право на доступ, исправление, удаление (право быть забытым) и запрос переносимости данных. Вы можете связаться с нами для ваших запросов.';
	@override String get section5Title => '5. КОНФИДЕНЦИАЛЬНОСТЬ ДЕТЕЙ';
	@override String get section5Body => 'ChatFace не предназначен для пользователей младше 18 лет. Мы не сознательно собираем данные этой возрастной группы; такие учетные записи будут закрыты и данные удалены при выявлении.';
	@override String get section6Title => '6. КОНТАКТЫ';
	@override String get section6Body => '📩 По вопросам: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceRu implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Условия обслуживания';
	@override String get lastUpdated => 'Последнее обновление: 2026';
	@override String get intro => 'Эти Условия регулируют использование мобильного приложения ChatFace. Используя приложение, вы соглашаетесь с этими Условиями.';
	@override String get disclaimer => 'Отказ от ответственности: ChatFace — это приложение для видео-взаимодействия на базе ИИ. Оно не предоставляет юридических, академических, медицинских или профессиональных консультаций.';
	@override String get section1Title => '1. ОБЪЕМ УСЛУГ';
	@override String get section1Body => 'ChatFace предоставляет возможности видео-взаимодействия с поддержкой ИИ:\n\n• Видео-звонки и разговоры с ИИ.\n• Персонализированные настройки взаимодействия.\n• Доступ к истории взаимодействий и записям.\n\nУслуги не являются официальными заключениями или гарантией профессиональных консультаций.';
	@override String get section2Title => '2. УСЛОВИЯ ИСПОЛЬЗОВАНИЯ';
	@override String get section2Body => '• Вы должны быть не моложе 18 лет (доступ для лиц младше 18 запрещен).\n• Вы должны предоставлять точную информацию об учетной записи.\n• Приложение должно использоваться только в законных и личных целях.';
	@override String get section3Title => '3. ЗАПРЕЩЕННОЕ ИСПОЛЬЗОВАНИЕ';
	@override String get section3Body => 'Выдача себя за другого, разжигание ненависти, создание угрозы для безопасности детей, попытки нарушения безопасности и манипуляция системами ИИ строго запрещены.';
	@override String get section4Title => '4. ПОДПИСКИ И ПЛАТЕЖИ';
	@override String get section4Body => 'Премиум-функции подлежат политике App Store и Google Play. Отмены подписки и возвраты управляются через соответствующие магазины.';
	@override String get section5Title => '5. ОТКАЗ ОТ ОТВЕТСТВЕННОСТИ ЗА КОНТЕНТ';
	@override String get section5Body => 'Контент создается ИИ и не заменяет профессиональные советы. ChatFace не гарантирует точность или пригодность для конкретной цели.';
	@override String get section6Title => '6. ИНТЕЛЛЕКТУАЛЬНАЯ СОБСТВЕННОСТЬ';
	@override String get section6Body => 'Весь контент, включая дизайн, программное обеспечение и алгоритмы, принадлежит ChatFace. Неавторизованное воспроизведение или распространение запрещено.';
	@override String get section7Title => '7. ПРИМЕНИМОЕ ПРАВО';
	@override String get section7Body => 'Эти Условия регулируются законодательством Республики Турции. Центральные суды Стамбула обладают юрисдикцией по спорам.';
	@override String get section8Title => '8. КОНТАКТЫ';
	@override String get section8Body => '📩 По вопросам: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyRu implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Политика файлов cookie';
	@override String get lastUpdated => 'Последнее обновление: 2026';
	@override String get intro => 'Добро пожаловать в ChatFace. Мы используем цифровые вспомогательные технологии, чтобы сделать ваш опыт видеозвонков с ИИ более плавным, безопасным и персонализированным.';
	@override String get important => 'Эта политика объясняет, что такое cookie, их назначения и как вы можете управлять своими настройками.';
	@override String get section1Title => '1. ЧТО ТАКОЕ COOKIE?';
	@override String get section1Body => 'Cookie — это небольшие файлы данных, размещаемые на вашем устройстве. Они не идентифицируют вас напрямую; они действуют как цифровые заметки, которые запоминают:\n• Настройки вызова и языка\n• Настройки сеанса и производительности.';
	@override String get section2Title => '2. КАКИЕ ТЕХНОЛОГИИ МЫ ИСПОЛЬЗУЕМ?';
	@override String get section2Body => 'Строго необходимые технологии\nТребуются для управления сеансами и контроля безопасности. Приложение может некорректно работать без этих компонентов.\n\nПроизводительность и аналитика\nПомогает нам понять, какие истории читаются и какие области нуждаются в улучшении. Данные оцениваются анонимно.\n\nПерсонализация\nЗапоминает настройки, такие как предпочтительный язык и уровень чтения, чтобы предоставить персонализированный опыт.';
	@override String get section3Title => '3. ЗАЧЕМ МЫ ИСПОЛЬЗУЕМ ЭТИ ТЕХНОЛОГИИ?';
	@override String get section3Body => '• Для обеспечения безопасной и плавной работы приложения.\n• Для упрощения процесса чтения.\n• Для запоминания повторяющихся настроек.\n• Для выявления функций для будущей разработки.';
	@override String get section4Title => '4. ТЕХНОЛОГИИ ТРЕТЬИХ ЛИЦ';
	@override String get section4Body => 'Некоторые технологии могут предоставляться техническими поставщиками услуг и подпадать под их собственные политики. ChatFace уделяет приоритетное внимание безопасности данных в этих партнерствах.';
	@override String get section5Title => '5. КОНТРОЛЬ И УПРАВЛЕНИЕ COOKIE';
	@override String get section5Body => 'Пользователи могут ограничить эти технологии через настройки устройства или приложения. Отключение необходимых технологий может привести к проблемам, например, невозможности начать видеозвонки.';
	@override String get section6Title => '6. КОНТАКТЫ';
	@override String get section6Body => '📩 По вопросам: support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Ru implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'Требуется разрешение';
	@override String get notNow => 'Не сейчас';
	@override String get openSettings => 'Открыть настройки';
	@override String get title => 'Разрешения';
	@override String get permission1 => 'Доступ к камере';
	@override String get permission1Subtitle => 'Разрешить доступ к камере';
	@override String get permission2 => 'Доступ к микрофону';
	@override String get permission2Subtitle => 'Разрешить доступ к микрофону';
	@override String get permission3 => 'Доступ к местоположению';
	@override String get permission3Subtitle => 'Разрешить доступ к местоположению';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Ru implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Как вас зовут?';
	@override String get subtitle => 'Пожалуйста, введите ваше имя';
	@override String get hint => 'Полное имя';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Ru implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сколько вам лет?';
	@override String get subtitle => 'Для регистрации вам должно быть не менее 18 лет.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Ru implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ваш пол?';
	@override String get subtitle => 'Пожалуйста, выберите ваш пол';
	@override String get male => 'Мужчина';
	@override String get female => 'Женщина';
	@override String get dontWantToMention => 'Предпочитаю не указывать';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Ru implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Развлекайтесь и \n оставайтесь в безопасности';
	@override String get entry1 => 'Мы поддерживаем порядок';
	@override String get subentry1 => 'Включен мониторинг ИИ в реальном времени';
	@override String get entry2 => 'Запись экрана';
	@override String get subentry2 => 'Запись без согласия запрещена';
	@override String get entry3 => 'Круглосуточная поддержка';
	@override String get subentry3 => 'Жалобы рассматриваются в любое время суток';
	@override String get entry4 => 'Только 18+';
	@override String get subentry4 => 'Не подходит для несовершеннолетних';
	@override String get communityRules => 'Правила сообщества';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingRu implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Ваша личная учетная запись';
	@override String get titlePart2 => 'создаётся';
	@override String get subtitle => 'Пожалуйста, подождите, ваш профиль готовится.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Ru implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Новое лицо видео-\nчата с ИИ';
	@override String get description => 'Включите камеру и говорите лицом к лицу с ИИ. Испытайте более естественное общение, которое понимает выражения лица, интонацию и контекст.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Ru implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Реальное и естественное \n общение';
	@override String get description => 'Не ограничивайтесь текстом. Ведите более плавные, более человечные разговоры через видеозвонки.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersRu implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Дизайнер моды';
	@override String get comedian => 'Комик';
	@override String get influencer => 'Инфлюенсер';
	@override String get teacher => 'Учитель';
	@override String get friend => 'Друг';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsRu implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Видеозвонок';
	@override String get message => 'Сообщение';
	@override String get voiceCall => 'Голосовой звонок';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsRu implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Ru step1 = _TranslationsDeleteAccountStepsStep1Ru._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Ru step2 = _TranslationsDeleteAccountStepsStep2Ru._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Ru step3 = _TranslationsDeleteAccountStepsStep3Ru._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersRu implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Оригинал';
	@override String get ADDICTIVE_BLUE => 'Захватывающий Синий';
	@override String get ADDICTIVE_RED => 'Захватывающий Красный';
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
class _TranslationsDeleteAccountStepsStep1Ru implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мы не хотим, чтобы вы уходили, но мы понимаем.';
	@override String get subtitle => 'Не могли бы вы рассказать, почему вы хотите уйти, чтобы мы могли улучшить ChatFace?';
	@override String get option1 => 'Мне не показались реалистичными ИИ-персонажи.';
	@override String get option2 => 'У меня технические проблемы с видеочатами.';
	@override String get option3 => 'Цены на подписку выше моих ожиданий.';
	@override String get option4 => 'Я не смог найти тем персонажей, которых искал.';
	@override String get option5 => 'Я просто хотел попробовать ненадолго.';
	@override String get option6 => 'Другое';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Ru implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Если вы удалите свой аккаунт, вы попрощаетесь с:';
	@override String get subtitle1 => 'Глубокие связи и память:';
	@override String get subtitle1Desc => 'Персонажи, с которыми вы общаетесь, полностью забудут ваше прошлое с ними.';
	@override String get subtitle2 => 'Привилегия видеозвонков:';
	@override String get subtitle2Desc => 'Вы потеряете право общаться лицом к лицу с вашими ИИ-партнерами.';
	@override String get subtitle3 => 'Продвинутый алгоритм:';
	@override String get subtitle3Desc => 'Ваши совпадения персонажей «Только для вас» будут сброшены.';
	@override String get subtitle4 => 'Данные профиля:';
	@override String get subtitle4Desc => 'Ваши достижения, специальные персонажи и история чатов будут необратимо удалены.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Ru implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Перед вашим уходом у нас есть специальное предложение!';
	@override String get description => 'Вместо удаления вашего аккаунта, не хотели бы вы рассмотреть это?';
	@override String description1({required Object offer}) => 'Ваше присутствие ценно для нас. ${offer} на вашу следующую подписку!';
	@override String get description1Offer => 'Мы применили скидку 50%';
	@override String description2({required Object offer}) => 'Мы дали вам ${offer} кредитов, чтобы вы могли открывать новых персонажей.';
	@override String get description2Offer => '3 бесплатных видеозвонка';
	@override String get acceptOffer => 'Принять скидку 50%';
	@override String get deleteMyAccount => 'Удалить мой аккаунт';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Добро пожаловать, ${name}',
			'welcome2' => ({required Object appName}) => 'Добро пожаловать в ${appName}',
			'get_started' => 'Начать',
			'next' => 'Далее',
			'back' => 'Назад',
			'skip' => 'Пропустить',
			'profile' => 'Профиль',
			'kContinue' => 'Продолжить',
			'termOfService.text1' => 'Регистрируясь в swipe, вы соглашаетесь с нашими ',
			'termOfService.link1' => 'Условиями обслуживания',
			'termOfService.text2' => '. Узнайте, как мы обрабатываем ваши данные в нашей ',
			'termOfService.link2' => 'Политике конфиденциальности',
			'termOfService.text3' => ' и ',
			'termOfService.link3' => 'Политике файлов cookie',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Политика конфиденциальности',
			'termOfService.privacyPolicy.lastUpdated' => 'Последнее обновление: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace рассматривает конфиденциальность пользователей и безопасность данных как основной принцип. Все ваши персональные данные обрабатываются в соответствии с действующими правилами защиты данных.',
			'termOfService.privacyPolicy.section1Title' => '1. СОБИРАЕМАЯ ИНФОРМАЦИЯ',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Данные, предоставленные пользователем',
			'termOfService.privacyPolicy.section1sub1Body' => '• Имя, прозвище или информация профиля.\n• Адрес электронной почты (для регистрации, подписки и поддержки). \n• Предпочтения взаимодействия, настройки языка и взаимодействия. \n• Сообщения с отзывами и в поддержку.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Данные, собираемые автоматически',
			'termOfService.privacyPolicy.section1sub2Body' => 'Собирается информация, такая как тип устройства, операционная система, приблизительное местоположение (город/страна) и данные об использовании приложения. Точные данные о местоположении не собираются.',
			'termOfService.privacyPolicy.section2Title' => '2. ЦЕЛИ ОБРАБОТКИ ДАННЫХ',
			'termOfService.privacyPolicy.section2Body' => 'Ваши персональные данные обрабатываются для следующих целей:\n\n• Обеспечение бесперебойной работы приложения.\n• Предоставление и персонализация видео-звонков с поддержкой ИИ.\n• Оптимизация производительности системы и обнаружение ошибок.\n• Выполнение юридических обязательств.\n Ваши данные никогда не продаются третьим лицам.',
			'termOfService.privacyPolicy.section3Title' => '3. ХРАНЕНИЕ И УДАЛЕНИЕ ДАННЫХ',
			'termOfService.privacyPolicy.section3Body' => 'Ваши данные хранятся до тех пор, пока ваша учетная запись активна или в течение срока юридических обязательств. Когда учетная запись удаляется, все персональные данные безвозвратно удаляются из систем.',
			'termOfService.privacyPolicy.section4Title' => '4. ПРАВА ПОЛЬЗОВАТЕЛЕЙ',
			'termOfService.privacyPolicy.section4Body' => 'В рамках GDPR и других законов у вас есть право на доступ, исправление, удаление (право быть забытым) и запрос переносимости данных. Вы можете связаться с нами для ваших запросов.',
			'termOfService.privacyPolicy.section5Title' => '5. КОНФИДЕНЦИАЛЬНОСТЬ ДЕТЕЙ',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace не предназначен для пользователей младше 18 лет. Мы не сознательно собираем данные этой возрастной группы; такие учетные записи будут закрыты и данные удалены при выявлении.',
			'termOfService.privacyPolicy.section6Title' => '6. КОНТАКТЫ',
			'termOfService.privacyPolicy.section6Body' => '📩 По вопросам: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Условия обслуживания',
			'termOfService.termsOfService.lastUpdated' => 'Последнее обновление: 2026',
			'termOfService.termsOfService.intro' => 'Эти Условия регулируют использование мобильного приложения ChatFace. Используя приложение, вы соглашаетесь с этими Условиями.',
			'termOfService.termsOfService.disclaimer' => 'Отказ от ответственности: ChatFace — это приложение для видео-взаимодействия на базе ИИ. Оно не предоставляет юридических, академических, медицинских или профессиональных консультаций.',
			'termOfService.termsOfService.section1Title' => '1. ОБЪЕМ УСЛУГ',
			'termOfService.termsOfService.section1Body' => 'ChatFace предоставляет возможности видео-взаимодействия с поддержкой ИИ:\n\n• Видео-звонки и разговоры с ИИ.\n• Персонализированные настройки взаимодействия.\n• Доступ к истории взаимодействий и записям.\n\nУслуги не являются официальными заключениями или гарантией профессиональных консультаций.',
			'termOfService.termsOfService.section2Title' => '2. УСЛОВИЯ ИСПОЛЬЗОВАНИЯ',
			'termOfService.termsOfService.section2Body' => '• Вы должны быть не моложе 18 лет (доступ для лиц младше 18 запрещен).\n• Вы должны предоставлять точную информацию об учетной записи.\n• Приложение должно использоваться только в законных и личных целях.',
			'termOfService.termsOfService.section3Title' => '3. ЗАПРЕЩЕННОЕ ИСПОЛЬЗОВАНИЕ',
			'termOfService.termsOfService.section3Body' => 'Выдача себя за другого, разжигание ненависти, создание угрозы для безопасности детей, попытки нарушения безопасности и манипуляция системами ИИ строго запрещены.',
			'termOfService.termsOfService.section4Title' => '4. ПОДПИСКИ И ПЛАТЕЖИ',
			'termOfService.termsOfService.section4Body' => 'Премиум-функции подлежат политике App Store и Google Play. Отмены подписки и возвраты управляются через соответствующие магазины.',
			'termOfService.termsOfService.section5Title' => '5. ОТКАЗ ОТ ОТВЕТСТВЕННОСТИ ЗА КОНТЕНТ',
			'termOfService.termsOfService.section5Body' => 'Контент создается ИИ и не заменяет профессиональные советы. ChatFace не гарантирует точность или пригодность для конкретной цели.',
			'termOfService.termsOfService.section6Title' => '6. ИНТЕЛЛЕКТУАЛЬНАЯ СОБСТВЕННОСТЬ',
			'termOfService.termsOfService.section6Body' => 'Весь контент, включая дизайн, программное обеспечение и алгоритмы, принадлежит ChatFace. Неавторизованное воспроизведение или распространение запрещено.',
			'termOfService.termsOfService.section7Title' => '7. ПРИМЕНИМОЕ ПРАВО',
			'termOfService.termsOfService.section7Body' => 'Эти Условия регулируются законодательством Республики Турции. Центральные суды Стамбула обладают юрисдикцией по спорам.',
			'termOfService.termsOfService.section8Title' => '8. КОНТАКТЫ',
			'termOfService.termsOfService.section8Body' => '📩 По вопросам: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Политика файлов cookie',
			'termOfService.cookiePolicy.lastUpdated' => 'Последнее обновление: 2026',
			'termOfService.cookiePolicy.intro' => 'Добро пожаловать в ChatFace. Мы используем цифровые вспомогательные технологии, чтобы сделать ваш опыт видеозвонков с ИИ более плавным, безопасным и персонализированным.',
			'termOfService.cookiePolicy.important' => 'Эта политика объясняет, что такое cookie, их назначения и как вы можете управлять своими настройками.',
			'termOfService.cookiePolicy.section1Title' => '1. ЧТО ТАКОЕ COOKIE?',
			'termOfService.cookiePolicy.section1Body' => 'Cookie — это небольшие файлы данных, размещаемые на вашем устройстве. Они не идентифицируют вас напрямую; они действуют как цифровые заметки, которые запоминают:\n• Настройки вызова и языка\n• Настройки сеанса и производительности.',
			'termOfService.cookiePolicy.section2Title' => '2. КАКИЕ ТЕХНОЛОГИИ МЫ ИСПОЛЬЗУЕМ?',
			'termOfService.cookiePolicy.section2Body' => 'Строго необходимые технологии\nТребуются для управления сеансами и контроля безопасности. Приложение может некорректно работать без этих компонентов.\n\nПроизводительность и аналитика\nПомогает нам понять, какие истории читаются и какие области нуждаются в улучшении. Данные оцениваются анонимно.\n\nПерсонализация\nЗапоминает настройки, такие как предпочтительный язык и уровень чтения, чтобы предоставить персонализированный опыт.',
			'termOfService.cookiePolicy.section3Title' => '3. ЗАЧЕМ МЫ ИСПОЛЬЗУЕМ ЭТИ ТЕХНОЛОГИИ?',
			'termOfService.cookiePolicy.section3Body' => '• Для обеспечения безопасной и плавной работы приложения.\n• Для упрощения процесса чтения.\n• Для запоминания повторяющихся настроек.\n• Для выявления функций для будущей разработки.',
			'termOfService.cookiePolicy.section4Title' => '4. ТЕХНОЛОГИИ ТРЕТЬИХ ЛИЦ',
			'termOfService.cookiePolicy.section4Body' => 'Некоторые технологии могут предоставляться техническими поставщиками услуг и подпадать под их собственные политики. ChatFace уделяет приоритетное внимание безопасности данных в этих партнерствах.',
			'termOfService.cookiePolicy.section5Title' => '5. КОНТРОЛЬ И УПРАВЛЕНИЕ COOKIE',
			'termOfService.cookiePolicy.section5Body' => 'Пользователи могут ограничить эти технологии через настройки устройства или приложения. Отключение необходимых технологий может привести к проблемам, например, невозможности начать видеозвонки.',
			'termOfService.cookiePolicy.section6Title' => '6. КОНТАКТЫ',
			'termOfService.cookiePolicy.section6Body' => '📩 По вопросам: support@fly-work.com',
			'cookies' => 'Политика файлов cookie',
			'privacy' => 'Политика конфиденциальности',
			'onboarding.step5.permissionRequired' => 'Требуется разрешение',
			'onboarding.step5.notNow' => 'Не сейчас',
			'onboarding.step5.openSettings' => 'Открыть настройки',
			'onboarding.step5.title' => 'Разрешения',
			'onboarding.step5.permission1' => 'Доступ к камере',
			'onboarding.step5.permission1Subtitle' => 'Разрешить доступ к камере',
			'onboarding.step5.permission2' => 'Доступ к микрофону',
			'onboarding.step5.permission2Subtitle' => 'Разрешить доступ к микрофону',
			'onboarding.step5.permission3' => 'Доступ к местоположению',
			'onboarding.step5.permission3Subtitle' => 'Разрешить доступ к местоположению',
			'onboarding.step1.title' => 'Как вас зовут?',
			'onboarding.step1.subtitle' => 'Пожалуйста, введите ваше имя',
			'onboarding.step1.hint' => 'Полное имя',
			'onboarding.step2.title' => 'Сколько вам лет?',
			'onboarding.step2.subtitle' => 'Для регистрации вам должно быть не менее 18 лет.',
			'onboarding.step3.title' => 'Ваш пол?',
			'onboarding.step3.subtitle' => 'Пожалуйста, выберите ваш пол',
			'onboarding.step3.male' => 'Мужчина',
			'onboarding.step3.female' => 'Женщина',
			'onboarding.step3.dontWantToMention' => 'Предпочитаю не указывать',
			'onboarding.step4.title' => 'Развлекайтесь и \n оставайтесь в безопасности',
			'onboarding.step4.entry1' => 'Мы поддерживаем порядок',
			'onboarding.step4.subentry1' => 'Включен мониторинг ИИ в реальном времени',
			'onboarding.step4.entry2' => 'Запись экрана',
			'onboarding.step4.subentry2' => 'Запись без согласия запрещена',
			'onboarding.step4.entry3' => 'Круглосуточная поддержка',
			'onboarding.step4.subentry3' => 'Жалобы рассматриваются в любое время суток',
			'onboarding.step4.entry4' => 'Только 18+',
			'onboarding.step4.subentry4' => 'Не подходит для несовершеннолетних',
			'onboarding.step4.communityRules' => 'Правила сообщества',
			'onboarding.loading.titlePart1' => 'Ваша личная учетная запись',
			'onboarding.loading.titlePart2' => 'создаётся',
			'onboarding.loading.subtitle' => 'Пожалуйста, подождите, ваш профиль готовится.',
			'onboarding.allowAccess' => 'Разрешить доступ',
			'onboarding.iUnderstand' => 'Понял',
			'pressBackAgainToExit' => 'Нажмите Назад ещё раз, чтобы выйти',
			'splash.screen1.title' => 'Новое лицо видео-\nчата с ИИ',
			'splash.screen1.description' => 'Включите камеру и говорите лицом к лицу с ИИ. Испытайте более естественное общение, которое понимает выражения лица, интонацию и контекст.',
			'splash.screen2.title' => 'Реальное и естественное \n общение',
			'splash.screen2.description' => 'Не ограничивайтесь текстом. Ведите более плавные, более человечные разговоры через видеозвонки.',
			'auth.google' => 'Продолжить с Google',
			'auth.facebook' => 'Продолжить с Facebook',
			'auth.apple' => 'Продолжить с Apple',
			'auth.guest' => 'Продолжить как гость',
			'auth.signInFailed' => ({required Object error}) => 'Ошибка входа: ${error}',
			'home.seeAll' => 'Посмотреть все',
			'home.more' => 'Ещё',
			'home.online' => 'В сети',
			'home.offline' => 'Не в сети',
			'home.placeholders.fashionDesigner' => 'Дизайнер моды',
			'home.placeholders.comedian' => 'Комик',
			'home.placeholders.influencer' => 'Инфлюенсер',
			'home.placeholders.teacher' => 'Учитель',
			'home.placeholders.friend' => 'Друг',
			'characters.all' => 'Все',
			'characters.favorites' => 'Избранное',
			'characters.recent' => 'Недавние',
			'characters.characters' => 'Персонажи',
			'characters.placeholderSubtitle' => 'Дизайнер продуктов, ориентированный на простоту и удобство использования.',
			'characters.characterDetails.videoCall' => 'Видеозвонок',
			'characters.characterDetails.message' => 'Сообщение',
			'characters.characterDetails.voiceCall' => 'Голосовой звонок',
			'notifications.today' => 'Сегодня',
			'notifications.yesterday' => 'Вчера',
			'notifications.weekAgo' => ({required Object week}) => '${week} неделя назад',
			'notifications.monthAgo' => ({required Object month}) => '${month} месяц назад',
			'notifications.yearAgo' => ({required Object year}) => '${year} год назад',
			'notifications.noNotifications' => 'Пока нет уведомлений.',
			'notifications.noNotificationsSubtitle' => 'Не забудьте проверить позже, когда получите уведомление.',
			'notifications.allDeleted' => 'Все уведомления успешно удалены',
			'videoChat.networkHiccup' => 'Обнаружена проблема с сетью. Переподключение микрофона...',
			'videoChat.failedToUpdateFollow' => 'Не удалось обновить статус.',
			'videoChat.connecting' => 'Подключение...',
			'videoChat.callEnded' => 'Звонок завершён',
			'videoChat.callFailed' => ({required Object error}) => 'Звонок не удался: ${error}',
			'videoChat.mute' => 'Отключить звук',
			'videoChat.unmute' => 'Включить звук',
			'videoChat.endCall' => 'Завершить звонок',
			'videoChat.swipeToChat' => 'Проведите, чтобы начать чат',
			'videoChat.male' => 'Мужчина',
			'videoChat.female' => 'Женщина',
			'videoChat.country' => 'Страна',
			'videoChat.follow' => 'Подписаться',
			'videoChat.unfollow' => 'Отписаться',
			'videoChat.callEndedMessage' => 'Видеозвонок завершён.',
			'videoChat.swipeForNewChat' => 'Проведите для нового чата',
			'voiceChat.connecting' => 'Подключение...',
			'voiceChat.callEnded' => 'Звонок завершён',
			'voiceChat.callFailed' => ({required Object error}) => 'Звонок не удался: ${error}',
			'voiceChat.calling' => 'Звонок...',
			'chat.message' => 'Сообщение',
			'chat.history' => 'История',
			'chat.noMessages' => 'Пока нет сообщений.',
			'chat.noMessagesSubtitle' => 'Начните разговор, отправив сообщение.',
			'chat.online' => 'В сети',
			'chat.offline' => 'Не в сети',
			'chat.gallery' => 'Галерея',
			'chat.camera' => 'Камера',
			'chat.typeAMessage' => 'Введите сообщение...',
			'chat.pleaseUpgrade' => 'Пожалуйста, обновитесь до версии Pro.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Голосовой звонок завершён',
			'chat.videoCallEnded' => 'Видеозвонок завершён',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Обо мне',
			'editProfile.aboutMeHint' => 'Напишите что-нибудь о себе',
			'editProfile.fullName' => 'Полное имя',
			'editProfile.gender' => 'Пол',
			'editProfile.male' => 'Мужчина',
			'editProfile.female' => 'Женщина',
			'editProfile.dontWantToMention' => 'Не хочу указывать',
			'editProfile.country' => 'Страна',
			'editProfile.languagePreferences' => 'Языковые предпочтения',
			'editProfile.selectLanguage' => 'Добавьте предпочитаемый язык',
			'editProfile.saved' => 'Сохранено',
			'editProfile.changesSaved' => 'Изменения сохранены.',
			'settingsSupport.title' => 'Настройки и поддержка',
			'settingsSupport.premiumTitle' => 'Неограниченный доступ \nко всем функциям',
			'settingsSupport.getPremium' => 'Получить Premium',
			'settingsSupport.settingsHub' => 'Центр настроек',
			'settingsSupport.shareTheApp' => 'Поделиться приложением',
			'settingsSupport.rateUs' => 'Оцените нас',
			'settingsSupport.version' => 'Версия',
			'settingsSupport.notifications' => 'Уведомления',
			'settingsSupport.accountManagement' => 'Управление аккаунтом',
			'settingsSupport.deleteAccount' => 'Удалить аккаунт',
			'settingsSupport.logOut' => 'Выйти',
			'settingsSupport.logOutTitle' => 'Вы собираетесь выйти',
			'settingsSupport.logOutSubtitle' => 'До скорой встречи!\nМы будем по вам скучать.',
			'deleteAccount.title' => 'Удалить аккаунт',
			'deleteAccount.warning' => 'Вы уверены, что хотите удалить аккаунт?',
			'deleteAccount.description' => 'Это действие нельзя будет отменить, и все ваши данные и история будут удалены навсегда.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Сбой удаления аккаунта: ${error}',
			'deleteAccount.steps.step1.title' => 'Мы не хотим, чтобы вы уходили, но мы понимаем.',
			'deleteAccount.steps.step1.subtitle' => 'Не могли бы вы рассказать, почему вы хотите уйти, чтобы мы могли улучшить ChatFace?',
			'deleteAccount.steps.step1.option1' => 'Мне не показались реалистичными ИИ-персонажи.',
			'deleteAccount.steps.step1.option2' => 'У меня технические проблемы с видеочатами.',
			'deleteAccount.steps.step1.option3' => 'Цены на подписку выше моих ожиданий.',
			'deleteAccount.steps.step1.option4' => 'Я не смог найти тем персонажей, которых искал.',
			'deleteAccount.steps.step1.option5' => 'Я просто хотел попробовать ненадолго.',
			'deleteAccount.steps.step1.option6' => 'Другое',
			'deleteAccount.steps.step2.title' => 'Если вы удалите свой аккаунт, вы попрощаетесь с:',
			'deleteAccount.steps.step2.subtitle1' => 'Глубокие связи и память:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'Персонажи, с которыми вы общаетесь, полностью забудут ваше прошлое с ними.',
			'deleteAccount.steps.step2.subtitle2' => 'Привилегия видеозвонков:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Вы потеряете право общаться лицом к лицу с вашими ИИ-партнерами.',
			'deleteAccount.steps.step2.subtitle3' => 'Продвинутый алгоритм:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Ваши совпадения персонажей «Только для вас» будут сброшены.',
			'deleteAccount.steps.step2.subtitle4' => 'Данные профиля:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Ваши достижения, специальные персонажи и история чатов будут необратимо удалены.',
			'deleteAccount.steps.step3.title' => 'Перед вашим уходом у нас есть специальное предложение!',
			'deleteAccount.steps.step3.description' => 'Вместо удаления вашего аккаунта, не хотели бы вы рассмотреть это?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Ваше присутствие ценно для нас. ${offer} на вашу следующую подписку!',
			'deleteAccount.steps.step3.description1Offer' => 'Мы применили скидку 50%',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Мы дали вам ${offer} кредитов, чтобы вы могли открывать новых персонажей.',
			'deleteAccount.steps.step3.description2Offer' => '3 бесплатных видеозвонка',
			'deleteAccount.steps.step3.acceptOffer' => 'Принять скидку 50%',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Удалить мой аккаунт',
			'cancel' => 'Отмена',
			'delete' => 'Удалить',
			'premium' => 'Премиум',
			'profileEdit' => 'Редактировать профиль',
			'settings' => 'Настройки',
			'undo' => 'Отменить',
			'successfully' => 'Успешно',
			'save' => 'Сохранить',
			'languageOptions.english' => 'Английский',
			'languageOptions.chinese' => 'Китайский',
			'languageOptions.german' => 'Немецкий',
			'languageOptions.italian' => 'Итальянский',
			'languageOptions.french' => 'Французский',
			'languageOptions.japanese' => 'Японский',
			'languageOptions.spanish' => 'Испанский',
			'languageOptions.russian' => 'Русский',
			'languageOptions.turkish' => 'Турецкий',
			'languageOptions.korean' => 'Корейский',
			'languageOptions.hindi' => 'Хинди',
			'languageOptions.portuguese' => 'Португальский',
			'common.tryAgain' => 'Попробовать снова',
			'common.retry' => 'Повторить',
			'common.close' => 'Закрыть',
			'permissionsRequired' => 'Требуются разрешения',
			'permissionHelper.camAndMicRequired' => 'Для видеозвонков требуются разрешения камеры и микрофона. Включите их в настройках.',
			'permissionHelper.micRequired' => 'Для голосовых звонков требуется разрешение на микрофон. Включите в настройках.',
			'permissionHelper.cancel' => 'Отмена',
			'permissionHelper.openSettings' => 'Открыть настройки',
			'videoView.title' => 'Фильтры камеры',
			'videoView.subtitle' => 'Выберите внешний вид для предварительного просмотра камеры.',
			'videoView.errorLoad' => 'Не удалось загрузить компаньонов: ',
			'videoView.noComps' => 'Пока нет доступных компаньонов.',
			'videoView.filters.ORIGINAL' => 'Оригинал',
			'videoView.filters.ADDICTIVE_BLUE' => 'Захватывающий Синий',
			'videoView.filters.ADDICTIVE_RED' => 'Захватывающий Красный',
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
