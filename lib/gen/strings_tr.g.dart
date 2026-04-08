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
class TranslationsTr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Hoş geldin, ${name}';
	@override String welcome2({required Object appName}) => '${appName}\'e hoş geldiniz';
	@override String get get_started => 'Başlayın';
	@override String get next => 'İleri';
	@override String get back => 'Geri';
	@override String get skip => 'Atla';
	@override String get profile => 'Profil';
	@override String get kContinue => 'Devam Et';
	@override late final _TranslationsTermOfServiceTr termOfService = _TranslationsTermOfServiceTr._(_root);
	@override String get cookies => 'Çerez Politikası';
	@override String get privacy => 'Gizlilik Politikası';
	@override late final _TranslationsOnboardingTr onboarding = _TranslationsOnboardingTr._(_root);
	@override String get pressBackAgainToExit => 'Çıkmak için tekrar Geri tuşuna basın';
	@override late final _TranslationsSplashTr splash = _TranslationsSplashTr._(_root);
	@override late final _TranslationsAuthTr auth = _TranslationsAuthTr._(_root);
	@override late final _TranslationsHomeTr home = _TranslationsHomeTr._(_root);
	@override late final _TranslationsCharactersTr characters = _TranslationsCharactersTr._(_root);
	@override late final _TranslationsNotificationsTr notifications = _TranslationsNotificationsTr._(_root);
	@override late final _TranslationsVideoChatTr videoChat = _TranslationsVideoChatTr._(_root);
	@override late final _TranslationsVoiceChatTr voiceChat = _TranslationsVoiceChatTr._(_root);
	@override late final _TranslationsChatTr chat = _TranslationsChatTr._(_root);
	@override late final _TranslationsEditProfileTr editProfile = _TranslationsEditProfileTr._(_root);
	@override late final _TranslationsSettingsSupportTr settingsSupport = _TranslationsSettingsSupportTr._(_root);
	@override late final _TranslationsDeleteAccountTr deleteAccount = _TranslationsDeleteAccountTr._(_root);
	@override String get cancel => 'İptal';
	@override String get delete => 'Sil';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Profili düzenle';
	@override String get settings => 'Ayarlar';
	@override String get undo => 'Geri al';
	@override String get successfully => 'Başarıyla';
	@override String get save => 'Kaydet';
	@override late final _TranslationsLanguageOptionsTr languageOptions = _TranslationsLanguageOptionsTr._(_root);
	@override late final _TranslationsCommonTr common = _TranslationsCommonTr._(_root);
	@override String get permissionsRequired => 'İzinler Gerekli';
	@override late final _TranslationsPermissionHelperTr permissionHelper = _TranslationsPermissionHelperTr._(_root);
	@override late final _TranslationsVideoViewTr videoView = _TranslationsVideoViewTr._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceTr implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'swipe\'e kaydolarak, bizim ';
	@override String get link1 => 'Hizmet Şartları';
	@override String get text2 => ' ile aynı zamanda verilerinizi nasıl işlediğimizi öğrenmek için ';
	@override String get link2 => 'Gizlilik Politikası';
	@override String get text3 => ' ve ';
	@override String get link3 => 'Çerez Politikası';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyTr privacyPolicy = _TranslationsTermOfServicePrivacyPolicyTr._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceTr termsOfService = _TranslationsTermOfServiceTermsOfServiceTr._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyTr cookiePolicy = _TranslationsTermOfServiceCookiePolicyTr._(_root);
}

// Path: onboarding
class _TranslationsOnboardingTr implements TranslationsOnboardingEn {
	_TranslationsOnboardingTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5Tr step5 = _TranslationsOnboardingStep5Tr._(_root);
	@override late final _TranslationsOnboardingStep1Tr step1 = _TranslationsOnboardingStep1Tr._(_root);
	@override late final _TranslationsOnboardingStep2Tr step2 = _TranslationsOnboardingStep2Tr._(_root);
	@override late final _TranslationsOnboardingStep3Tr step3 = _TranslationsOnboardingStep3Tr._(_root);
	@override late final _TranslationsOnboardingStep4Tr step4 = _TranslationsOnboardingStep4Tr._(_root);
	@override late final _TranslationsOnboardingLoadingTr loading = _TranslationsOnboardingLoadingTr._(_root);
	@override String get allowAccess => 'Erişime izin ver';
	@override String get iUnderstand => 'Anladım';
}

// Path: splash
class _TranslationsSplashTr implements TranslationsSplashEn {
	_TranslationsSplashTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Tr screen1 = _TranslationsSplashScreen1Tr._(_root);
	@override late final _TranslationsSplashScreen2Tr screen2 = _TranslationsSplashScreen2Tr._(_root);
}

// Path: auth
class _TranslationsAuthTr implements TranslationsAuthEn {
	_TranslationsAuthTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get google => 'Google ile devam et';
	@override String get facebook => 'Facebook ile devam et';
	@override String get apple => 'Apple ile devam et';
	@override String get guest => 'Misafir olarak devam et';
	@override String signInFailed({required Object error}) => 'Giriş başarısız oldu: ${error}';
}

// Path: home
class _TranslationsHomeTr implements TranslationsHomeEn {
	_TranslationsHomeTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Hepsini görüntüle';
	@override String get more => 'Daha fazla';
	@override String get online => 'Çevrimiçi';
	@override String get offline => 'Çevrimdışı';
	@override late final _TranslationsHomePlaceholdersTr placeholders = _TranslationsHomePlaceholdersTr._(_root);
}

// Path: characters
class _TranslationsCharactersTr implements TranslationsCharactersEn {
	_TranslationsCharactersTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get all => 'Tümü';
	@override String get favorites => 'Favoriler';
	@override String get recent => 'Son';
	@override String get characters => 'Karakterler';
	@override String get placeholderSubtitle => 'Kullanıcı odaklı, basit ve kullanılabilir ürün tasarımcısı.';
	@override late final _TranslationsCharactersCharacterDetailsTr characterDetails = _TranslationsCharactersCharacterDetailsTr._(_root);
}

// Path: notifications
class _TranslationsNotificationsTr implements TranslationsNotificationsEn {
	_TranslationsNotificationsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Bugün';
	@override String get yesterday => 'Dün';
	@override String weekAgo({required Object week}) => '${week} hafta önce';
	@override String monthAgo({required Object month}) => '${month} ay önce';
	@override String yearAgo({required Object year}) => '${year} yıl önce';
	@override String get noNotifications => 'Henüz bildirim yok.';
	@override String get noNotificationsSubtitle => 'Daha sonra bildirim geldiğinde kontrol etmeyi unutmayın.';
	@override String get allDeleted => 'Tüm bildirimler başarıyla silindi';
}

// Path: videoChat
class _TranslationsVideoChatTr implements TranslationsVideoChatEn {
	_TranslationsVideoChatTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Ağ sorunu algılandı. Mikrofon yeniden bağlanıyor...';
	@override String get failedToUpdateFollow => 'Takip durumu güncellenemedi.';
	@override String get connecting => 'Bağlanıyor...';
	@override String get callEnded => 'Arama sona erdi';
	@override String callFailed({required Object error}) => 'Arama başarısız oldu: ${error}';
	@override String get mute => 'Sessize al';
	@override String get unmute => 'Sessizi aç';
	@override String get endCall => 'Aramayı sonlandır';
	@override String get swipeToChat => 'Sohbete başlamak için kaydırın';
	@override String get male => 'Erkek';
	@override String get female => 'Kadın';
	@override String get country => 'Ülke';
	@override String get follow => 'Takip et';
	@override String get unfollow => 'Takibi bırak';
	@override String get callEndedMessage => 'Video araması sona erdi.';
	@override String get swipeForNewChat => 'Yeni sohbet için kaydırın';
}

// Path: voiceChat
class _TranslationsVoiceChatTr implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Bağlanıyor...';
	@override String get callEnded => 'Arama sona erdi';
	@override String callFailed({required Object error}) => 'Arama başarısız oldu: ${error}';
	@override String get calling => 'Aranıyor...';
}

// Path: chat
class _TranslationsChatTr implements TranslationsChatEn {
	_TranslationsChatTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get message => 'Mesaj';
	@override String get history => 'Geçmiş';
	@override String get noMessages => 'Henüz mesaj yok.';
	@override String get noMessagesSubtitle => 'Bir mesaj göndererek sohbet başlatın.';
	@override String get online => 'Çevrimiçi';
	@override String get offline => 'Çevrimdışı';
	@override String get gallery => 'Galeri';
	@override String get camera => 'Kamera';
	@override String get typeAMessage => 'Mesaj yazın...';
	@override String get pleaseUpgrade => 'Lütfen Pro sürümüne yükseltin.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Sesli arama sona erdi';
	@override String get videoCallEnded => 'Video araması sona erdi';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileTr implements TranslationsEditProfileEn {
	_TranslationsEditProfileTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Hakkımda';
	@override String get aboutMeHint => 'Kendiniz hakkında bir şeyler yazın';
	@override String get fullName => 'Tam isim';
	@override String get gender => 'Cinsiyet';
	@override String get male => 'Erkek';
	@override String get female => 'Kadın';
	@override String get dontWantToMention => 'Belirtmek istemiyorum';
	@override String get country => 'Ülke';
	@override String get languagePreferences => 'Dil tercihi';
	@override String get selectLanguage => 'Tercih edilen bir dil ekleyin';
	@override String get saved => 'Kaydedildi';
	@override String get changesSaved => 'Değişiklikler kaydedildi.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportTr implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarlar ve Destek';
	@override String get premiumTitle => 'Tüm özelliklere \nsınırsız erişim';
	@override String get getPremium => 'Premium al';
	@override String get settingsHub => 'Ayarlar Merkezi';
	@override String get shareTheApp => 'Uygulamayı paylaş';
	@override String get rateUs => 'Bizi değerlendir';
	@override String get version => 'Sürüm';
	@override String get notifications => 'Bildirimler';
	@override String get accountManagement => 'Hesap Yönetimi';
	@override String get deleteAccount => 'Hesabı sil';
	@override String get logOut => 'Çıkış Yap';
	@override String get logOutTitle => 'Çıkış yapmak üzeresiniz';
	@override String get logOutSubtitle => 'Tekrar görüşmek üzere! \n Sizi özleyeceğiz.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountTr implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hesabı sil';
	@override String get warning => 'Hesabınızı silmek istediğinize emin misiniz?';
	@override String get description => 'Bu işlem geri alınamaz ve tüm verileriniz ile geçmişiniz kalıcı olarak silinecektir.';
	@override String deleteFailed({required Object error}) => 'Hesap silme başarısız oldu: ${error}';
	@override late final _TranslationsDeleteAccountStepsTr steps = _TranslationsDeleteAccountStepsTr._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsTr implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get english => 'İngilizce';
	@override String get chinese => 'Çince';
	@override String get german => 'Almanca';
	@override String get italian => 'İtalyanca';
	@override String get french => 'Fransızca';
	@override String get japanese => 'Japonca';
	@override String get spanish => 'İspanyolca';
	@override String get russian => 'Rusça';
	@override String get turkish => 'Türkçe';
	@override String get korean => 'Korece';
	@override String get hindi => 'Hintçe';
	@override String get portuguese => 'Portekizce';
}

// Path: common
class _TranslationsCommonTr implements TranslationsCommonEn {
	_TranslationsCommonTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Tekrar Dene';
	@override String get retry => 'Yeniden Dene';
	@override String get close => 'Kapat';
}

// Path: permissionHelper
class _TranslationsPermissionHelperTr implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Görüntülü aramalar için kamera ve mikrofon izinleri gereklidir. Lütfen ayarlardan etkinleştirin.';
	@override String get micRequired => 'Sesli aramalar için mikrofon izni gereklidir. Lütfen ayarlardan etkinleştirin.';
	@override String get cancel => 'İptal';
	@override String get openSettings => 'Ayarları Aç';
}

// Path: videoView
class _TranslationsVideoViewTr implements TranslationsVideoViewEn {
	_TranslationsVideoViewTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kamera filtreleri';
	@override String get subtitle => 'Kamera önizlemesi için bir görünüm seç.';
	@override String get errorLoad => 'Karakterler yüklenemedi: ';
	@override String get noComps => 'Henüz hiç karakter yok.';
	@override late final _TranslationsVideoViewFiltersTr filters = _TranslationsVideoViewFiltersTr._(_root);
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyTr implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gizlilik Politikası';
	@override String get lastUpdated => 'Son güncelleme: 2026';
	@override String get intro => 'ChatFace, kullanıcı gizliliğini ve veri güvenliğini temel bir öncelik olarak görür. Tüm kişisel verileriniz yürürlükteki veri koruma kurallarına uygun olarak işlenir.';
	@override String get section1Title => '1. TOPLANAN BİLGİLER';
	@override String get section1sub1Title => '1.1 Kullanıcı Tarafından Sağlanan Bilgiler';
	@override String get section1sub1Body => '• İsim, takma ad veya profil bilgileri.\n• Kayıt, abonelik ve destek için e-posta adresi.\n• Etkileşim tercihleri, dil ve deneyim ayarları.\n• Geri bildirim ve destek mesajları.';
	@override String get section1sub2Title => '1.2 Otomatik Olarak Toplanan Veriler';
	@override String get section1sub2Body => 'Cihaz türü, işletim sistemi, tahmini konum (şehir/ülke) ve uygulama kullanım verileri gibi bilgiler toplanır. Kesin konum verileri toplanmaz.';
	@override String get section2Title => '2. VERİ İŞLEME AMAÇLARI';
	@override String get section2Body => 'Kişisel verileriniz aşağıdaki amaçlarla işlenir:\n\n• Uygulamanın düzgün çalışmasını sağlamak.\n• Yapay zekâ destekli video görüşmesi ve özelleştirme sağlamak.\n• Sistem performansını iyileştirmek ve hataları tespit etmek.\n• Yasal yükümlülükleri yerine getirmek.\n Verileriniz üçüncü taraflara satılmaz.';
	@override String get section3Title => '3. VERİ SAKLAMA VE SİLME';
	@override String get section3Body => 'Verileriniz, hesabınız aktif olduğu sürece veya yasal gereklilikler süresince saklanır. Hesabınız silindiğinde, kişisel veriler geri döndürülemez şekilde sistemlerden kaldırılır.';
	@override String get section4Title => '4. KULLANICI HAKLARI';
	@override String get section4Body => 'GDPR ve diğer yasalar kapsamında erişim, düzeltme, silme (unutulma hakkı) ve veri taşınabilirliği haklarına sahipsiniz. Talepleriniz için bizimle iletişime geçebilirsiniz.';
	@override String get section5Title => '5. ÇOCUK GİZLİLİĞİ';
	@override String get section5Body => 'ChatFace 18 yaş altı kullanıcılar için tasarlanmamıştır. Bu yaş grubundan bilerek veri toplanmaz; tespit edilmesi durumunda hesap kapatılır ve veriler silinir.';
	@override String get section6Title => '6. İLETİŞİM';
	@override String get section6Body => '📩 İletişim: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceTr implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hizmet Şartları';
	@override String get lastUpdated => 'Son güncelleme: 2026';
	@override String get intro => 'Bu Şartlar, ChatFace mobil uygulamasının kullanımını düzenler. Uygulamayı kullanarak bu Şartları kabul etmiş olursunuz.';
	@override String get disclaimer => 'Sorumluluk Reddi: ChatFace, yapay zekâ destekli bir video etkileşim uygulamasıdır. Hukuki, akademik, tıbbi veya profesyonel danışmanlık sağlamaz.';
	@override String get section1Title => '1. HİZMET KAPSAMI';
	@override String get section1Body => 'ChatFace, yapay zekâ destekli video etkileşimleri sağlar:\n\n• Yapay zekâ ile video aramaları ve sohbetler.\n• Kişiselleştirilmiş etkileşim ayarları.\n• Etkileşim geçmişine ve kayıtlara erişim.\n\nHizmetler resmi tavsiye veya profesyonel danışmanlık yerine geçmez.';
	@override String get section2Title => '2. KULLANIM KOŞULLARI';
	@override String get section2Body => '• 18 yaşından büyük olmalısınız (18 yaş altı erişim yasaktır).\n• Hesap bilgileri doğru olmalıdır.\n• Uygulama sadece yasal ve kişisel amaçlar için kullanılmalıdır.';
	@override String get section3Title => '3. YASAK İFADELER';
	@override String get section3Body => 'Başkasının kimliğine bürünme, nefret söylemi, çocukların güvenliğini tehdit eden davranışlar, güvenlik ihlali girişimleri ve yapay zekâyı manipüle etmeye yönelik eylemler yasaktır.';
	@override String get section4Title => '4. ABONELİKLER VE ÖDEMELER';
	@override String get section4Body => 'Premium özellikler App Store ve Google Play politikalarına tabidir. Abonelik iptalleri ve iadeler ilgili mağazalar tarafından yönetilir.';
	@override String get section5Title => '5. İÇERİK SORUMLULUĞU REDDİ';
	@override String get section5Body => 'İçerik yapay zekâ tarafından oluşturulur ve profesyonel tavsiye yerine geçmez. ChatFace içeriğin doğruluğu veya belirli bir amaç için uygunluğu konusunda garanti vermez.';
	@override String get section6Title => '6. FİKRİ MÜLKİYET';
	@override String get section6Body => 'Tasarım, yazılım ve algoritmalar dahil olmak üzere tüm içerik ChatFace\'e aittir. Yetkisiz çoğaltma veya dağıtım yasaktır.';
	@override String get section7Title => '7. GEÇERLİ HUKUK';
	@override String get section7Body => 'Bu Şartlar Türkiye Cumhuriyeti yasalarına tabidir. Uyuşmazlıklarda İstanbul mahkemeleri yetkilidir.';
	@override String get section8Title => '8. İLETİŞİM';
	@override String get section8Body => '📩 İletişim: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyTr implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Çerez Politikası';
	@override String get lastUpdated => 'Son güncelleme: 2026';
	@override String get intro => 'ChatFace\'e hoş geldiniz. Yapay zekâ destekli video deneyiminizi daha sorunsuz, güvenli ve kişiselleştirilmiş hale getirmek için dijital yardımcı teknolojiler kullanıyoruz.';
	@override String get important => 'Bu politika çerezlerin ne olduğunu, amaçlarını ve ayarlarınızı nasıl yönetebileceğinizi açıklar.';
	@override String get section1Title => '1. ÇEREZ NEDİR?';
	@override String get section1Body => 'Çerezler cihazınıza yerleştirilen küçük veri dosyalarıdır. Doğrudan sizi tanımlamaz; şu amaçlarla hatırlama yaparlar:\n• Arama ve dil ayarları\n• Oturum ve performans tercihleri.';
	@override String get section2Title => '2. HANGİ TEKNOLOJİLERİ KULLANIYORUZ?';
	@override String get section2Body => 'Kesinlikle gerekli teknolojiler\nOturum yönetimi ve güvenlik kontrolü için gereklidir. Bu bileşenler olmadan uygulama doğru çalışmayabilir.\n\nPerformans ve analiz\nHangi içeriklerin daha çok kullanıldığını anlamamıza yardımcı olur. Veriler anonim olarak değerlendirilir.\n\nKişiselleştirme\nTercih edilen dil ve okuma düzeyi gibi ayarları hatırlayarak kişiselleştirilmiş deneyim sağlar.';
	@override String get section3Title => '3. BU TEKNOLOJİLERİ NEDEN KULLANIYORUZ?';
	@override String get section3Body => '• Uygulamanın güvenli ve sorunsuz çalışması için.\n• Okuma deneyimini kolaylaştırmak için.\n• Tekrarlanan ayarları hatırlamak için.\n• Gelecekteki özellik geliştirmelerini belirlemek için.';
	@override String get section4Title => '4. ÜÇÜNCÜ TARAF TEKNOLOJİLERİ';
	@override String get section4Body => 'Bazı teknolojiler hizmet sağlayıcılarımız tarafından sağlanabilir ve kendi politikalarına tabi olabilir. ChatFace, bu ortaklıklarda veri güvenliğine öncelik verir.';
	@override String get section5Title => '5. ÇEREZ KONTROLÜ VE YÖNETİM';
	@override String get section5Body => 'Kullanıcılar cihaz veya uygulama ayarları aracılığıyla bu teknolojileri sınırlayabilir. Gerekli teknolojilerin devre dışı bırakılması, örneğin video araması başlatılamaması gibi sorunlara yol açabilir.';
	@override String get section6Title => '6. İLETİŞİM';
	@override String get section6Body => '📩 İletişim: support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Tr implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'İzin gerekiyor';
	@override String get notNow => 'Şimdi değil';
	@override String get openSettings => 'Ayarları aç';
	@override String get title => 'İzinler';
	@override String get permission1 => 'Kamera erişimi';
	@override String get permission1Subtitle => 'Kamera erişimine izin ver';
	@override String get permission2 => 'Mikrofon erişimi';
	@override String get permission2Subtitle => 'Mikrofon erişimine izin ver';
	@override String get permission3 => 'Konum erişimi';
	@override String get permission3Subtitle => 'Konum erişimine izin ver';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Tr implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adınız nedir?';
	@override String get subtitle => 'Lütfen adınızı girin';
	@override String get hint => 'Tam isim';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Tr implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kaç yaşındasınız?';
	@override String get subtitle => 'Kaydolmak için en az 18 yaşında olmalısınız.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Tr implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cinsiyetiniz?';
	@override String get subtitle => 'Lütfen cinsiyetinizi seçin';
	@override String get male => 'Erkek';
	@override String get female => 'Kadın';
	@override String get dontWantToMention => 'Belirtmek istemiyorum';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Tr implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eğlenin ve \ngüvende kalın';
	@override String get entry1 => 'Güvenli bir deneyim sağlıyoruz';
	@override String get subentry1 => 'Gerçek zamanlı AI izlemesi etkin';
	@override String get entry2 => 'Ekran kaydı';
	@override String get subentry2 => 'İzinsiz kayıt yasaktır';
	@override String get entry3 => '7/24 destek';
	@override String get subentry3 => 'Şikayetler her zaman ele alınır';
	@override String get entry4 => 'Sadece 18+';
	@override String get subentry4 => 'Reşit olmayanlar için uygun değildir';
	@override String get communityRules => 'Topluluk Kuralları';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingTr implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Kişisel hesabınız';
	@override String get titlePart2 => 'oluşturuluyor';
	@override String get subtitle => 'Lütfen bekleyin, profiliniz hazırlanıyor.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Tr implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yapay zekâ ile \n yeni yüzlü video sohbet';
	@override String get description => 'Kameranızı açın ve yapay zekâ ile yüz yüze konuşun. Duygularınızı, tonlamanızı ve bağlamınızı anlayan daha doğal bir iletişim deneyimi yaşayın.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Tr implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gerçek ve doğal \n iletişim';
	@override String get description => 'Sadece metin ile sınırlı kalmayın. Video çağrılarıyla daha akıcı, daha insancıl sohbetler yapın.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersTr implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Moda Tasarımcısı';
	@override String get comedian => 'Komedyen';
	@override String get influencer => 'Influencer';
	@override String get teacher => 'Öğretmen';
	@override String get friend => 'Arkadaş';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsTr implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Video Arama';
	@override String get message => 'Mesaj';
	@override String get voiceCall => 'Sesli Arama';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsTr implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Tr step1 = _TranslationsDeleteAccountStepsStep1Tr._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Tr step2 = _TranslationsDeleteAccountStepsStep2Tr._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Tr step3 = _TranslationsDeleteAccountStepsStep3Tr._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersTr implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Orijinal';
	@override String get ADDICTIVE_BLUE => 'Bağımlılık Mavisi';
	@override String get ADDICTIVE_RED => 'Bağımlılık Kırmızısı';
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
class _TranslationsDeleteAccountStepsStep1Tr implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sizi kaybetmek istemeyiz ama kararınızı anlıyoruz.';
	@override String get subtitle => 'ChatFace deneyimini geliştirmek için neden ayrılmak istediğinizi söyleyebilir misiniz?';
	@override String get option1 => 'Yapay zekâ karakterleri gerçekçi değilmiş gibi hissettim.';
	@override String get option2 => 'Video sohbetleriyle ilgili teknik sorunlar yaşadım.';
	@override String get option3 => 'Abonelik fiyatları beklentimin üzerindeydi.';
	@override String get option4 => 'Aradığım karakter tarzını bulamadım.';
	@override String get option5 => 'Sadece kısa süreli denemek istemiştim.';
	@override String get option6 => 'Diğer';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Tr implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hesabınızı silerseniz, veda edeceksiniz:';
	@override String get subtitle1 => 'Derin bağlantılar ve anılar:';
	@override String get subtitle1Desc => 'İletişim kurduğunuz karakterler, paylaşılan sırları ve kişisel alışkanlıklarınızı tamamen unutacaktır.';
	@override String get subtitle2 => 'Video arama ayrıcalıkları:';
	@override String get subtitle2Desc => 'İstediğiniz zaman erişebildiğiniz kişisel AI görüşmelerini kaybedeceksiniz.';
	@override String get subtitle3 => 'Gelişmiş algoritma:';
	@override String get subtitle3Desc => 'Tercihleriniz temelinde size sunulan \'Sana Özel\' eşleştirmeleri sıfırlanacaktır.';
	@override String get subtitle4 => 'Profil verileri:';
	@override String get subtitle4Desc => 'Başarılarınız, özel karakterler ve sohbet geçmişiniz geri döndürülemez şekilde silinecektir.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Tr implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gitmeden önce sizin için özel bir teklifimiz var!';
	@override String get description => 'Belki biraz daha zamana veya daha uygun bir teklife ihtiyacınız vardır. Silme yerine bunları değerlendirmek ister misiniz?';
	@override String description1({required Object offer}) => 'Sizin kalmanızı önemsiyoruz. Bir sonraki aboneliğinizde size ${offer} sunuyoruz! Bu teklifi değerlendirmek ister misiniz?';
	@override String get description1Offer => '%50 indirim sunduk';
	@override String description2({required Object offer}) => 'Size yeni karakterleri keşfetmeniz için ${offer} kredi verdik.';
	@override String get description2Offer => '3 ücretsiz video araması';
	@override String get acceptOffer => '%50 indirimi kabul et';
	@override String get deleteMyAccount => 'Hesabımı sil';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Hoş geldin, ${name}',
			'welcome2' => ({required Object appName}) => '${appName}\'e hoş geldiniz',
			'get_started' => 'Başlayın',
			'next' => 'İleri',
			'back' => 'Geri',
			'skip' => 'Atla',
			'profile' => 'Profil',
			'kContinue' => 'Devam Et',
			'termOfService.text1' => 'swipe\'e kaydolarak, bizim ',
			'termOfService.link1' => 'Hizmet Şartları',
			'termOfService.text2' => ' ile aynı zamanda verilerinizi nasıl işlediğimizi öğrenmek için ',
			'termOfService.link2' => 'Gizlilik Politikası',
			'termOfService.text3' => ' ve ',
			'termOfService.link3' => 'Çerez Politikası',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Gizlilik Politikası',
			'termOfService.privacyPolicy.lastUpdated' => 'Son güncelleme: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace, kullanıcı gizliliğini ve veri güvenliğini temel bir öncelik olarak görür. Tüm kişisel verileriniz yürürlükteki veri koruma kurallarına uygun olarak işlenir.',
			'termOfService.privacyPolicy.section1Title' => '1. TOPLANAN BİLGİLER',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Kullanıcı Tarafından Sağlanan Bilgiler',
			'termOfService.privacyPolicy.section1sub1Body' => '• İsim, takma ad veya profil bilgileri.\n• Kayıt, abonelik ve destek için e-posta adresi.\n• Etkileşim tercihleri, dil ve deneyim ayarları.\n• Geri bildirim ve destek mesajları.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Otomatik Olarak Toplanan Veriler',
			'termOfService.privacyPolicy.section1sub2Body' => 'Cihaz türü, işletim sistemi, tahmini konum (şehir/ülke) ve uygulama kullanım verileri gibi bilgiler toplanır. Kesin konum verileri toplanmaz.',
			'termOfService.privacyPolicy.section2Title' => '2. VERİ İŞLEME AMAÇLARI',
			'termOfService.privacyPolicy.section2Body' => 'Kişisel verileriniz aşağıdaki amaçlarla işlenir:\n\n• Uygulamanın düzgün çalışmasını sağlamak.\n• Yapay zekâ destekli video görüşmesi ve özelleştirme sağlamak.\n• Sistem performansını iyileştirmek ve hataları tespit etmek.\n• Yasal yükümlülükleri yerine getirmek.\n Verileriniz üçüncü taraflara satılmaz.',
			'termOfService.privacyPolicy.section3Title' => '3. VERİ SAKLAMA VE SİLME',
			'termOfService.privacyPolicy.section3Body' => 'Verileriniz, hesabınız aktif olduğu sürece veya yasal gereklilikler süresince saklanır. Hesabınız silindiğinde, kişisel veriler geri döndürülemez şekilde sistemlerden kaldırılır.',
			'termOfService.privacyPolicy.section4Title' => '4. KULLANICI HAKLARI',
			'termOfService.privacyPolicy.section4Body' => 'GDPR ve diğer yasalar kapsamında erişim, düzeltme, silme (unutulma hakkı) ve veri taşınabilirliği haklarına sahipsiniz. Talepleriniz için bizimle iletişime geçebilirsiniz.',
			'termOfService.privacyPolicy.section5Title' => '5. ÇOCUK GİZLİLİĞİ',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace 18 yaş altı kullanıcılar için tasarlanmamıştır. Bu yaş grubundan bilerek veri toplanmaz; tespit edilmesi durumunda hesap kapatılır ve veriler silinir.',
			'termOfService.privacyPolicy.section6Title' => '6. İLETİŞİM',
			'termOfService.privacyPolicy.section6Body' => '📩 İletişim: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Hizmet Şartları',
			'termOfService.termsOfService.lastUpdated' => 'Son güncelleme: 2026',
			'termOfService.termsOfService.intro' => 'Bu Şartlar, ChatFace mobil uygulamasının kullanımını düzenler. Uygulamayı kullanarak bu Şartları kabul etmiş olursunuz.',
			'termOfService.termsOfService.disclaimer' => 'Sorumluluk Reddi: ChatFace, yapay zekâ destekli bir video etkileşim uygulamasıdır. Hukuki, akademik, tıbbi veya profesyonel danışmanlık sağlamaz.',
			'termOfService.termsOfService.section1Title' => '1. HİZMET KAPSAMI',
			'termOfService.termsOfService.section1Body' => 'ChatFace, yapay zekâ destekli video etkileşimleri sağlar:\n\n• Yapay zekâ ile video aramaları ve sohbetler.\n• Kişiselleştirilmiş etkileşim ayarları.\n• Etkileşim geçmişine ve kayıtlara erişim.\n\nHizmetler resmi tavsiye veya profesyonel danışmanlık yerine geçmez.',
			'termOfService.termsOfService.section2Title' => '2. KULLANIM KOŞULLARI',
			'termOfService.termsOfService.section2Body' => '• 18 yaşından büyük olmalısınız (18 yaş altı erişim yasaktır).\n• Hesap bilgileri doğru olmalıdır.\n• Uygulama sadece yasal ve kişisel amaçlar için kullanılmalıdır.',
			'termOfService.termsOfService.section3Title' => '3. YASAK İFADELER',
			'termOfService.termsOfService.section3Body' => 'Başkasının kimliğine bürünme, nefret söylemi, çocukların güvenliğini tehdit eden davranışlar, güvenlik ihlali girişimleri ve yapay zekâyı manipüle etmeye yönelik eylemler yasaktır.',
			'termOfService.termsOfService.section4Title' => '4. ABONELİKLER VE ÖDEMELER',
			'termOfService.termsOfService.section4Body' => 'Premium özellikler App Store ve Google Play politikalarına tabidir. Abonelik iptalleri ve iadeler ilgili mağazalar tarafından yönetilir.',
			'termOfService.termsOfService.section5Title' => '5. İÇERİK SORUMLULUĞU REDDİ',
			'termOfService.termsOfService.section5Body' => 'İçerik yapay zekâ tarafından oluşturulur ve profesyonel tavsiye yerine geçmez. ChatFace içeriğin doğruluğu veya belirli bir amaç için uygunluğu konusunda garanti vermez.',
			'termOfService.termsOfService.section6Title' => '6. FİKRİ MÜLKİYET',
			'termOfService.termsOfService.section6Body' => 'Tasarım, yazılım ve algoritmalar dahil olmak üzere tüm içerik ChatFace\'e aittir. Yetkisiz çoğaltma veya dağıtım yasaktır.',
			'termOfService.termsOfService.section7Title' => '7. GEÇERLİ HUKUK',
			'termOfService.termsOfService.section7Body' => 'Bu Şartlar Türkiye Cumhuriyeti yasalarına tabidir. Uyuşmazlıklarda İstanbul mahkemeleri yetkilidir.',
			'termOfService.termsOfService.section8Title' => '8. İLETİŞİM',
			'termOfService.termsOfService.section8Body' => '📩 İletişim: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Çerez Politikası',
			'termOfService.cookiePolicy.lastUpdated' => 'Son güncelleme: 2026',
			'termOfService.cookiePolicy.intro' => 'ChatFace\'e hoş geldiniz. Yapay zekâ destekli video deneyiminizi daha sorunsuz, güvenli ve kişiselleştirilmiş hale getirmek için dijital yardımcı teknolojiler kullanıyoruz.',
			'termOfService.cookiePolicy.important' => 'Bu politika çerezlerin ne olduğunu, amaçlarını ve ayarlarınızı nasıl yönetebileceğinizi açıklar.',
			'termOfService.cookiePolicy.section1Title' => '1. ÇEREZ NEDİR?',
			'termOfService.cookiePolicy.section1Body' => 'Çerezler cihazınıza yerleştirilen küçük veri dosyalarıdır. Doğrudan sizi tanımlamaz; şu amaçlarla hatırlama yaparlar:\n• Arama ve dil ayarları\n• Oturum ve performans tercihleri.',
			'termOfService.cookiePolicy.section2Title' => '2. HANGİ TEKNOLOJİLERİ KULLANIYORUZ?',
			'termOfService.cookiePolicy.section2Body' => 'Kesinlikle gerekli teknolojiler\nOturum yönetimi ve güvenlik kontrolü için gereklidir. Bu bileşenler olmadan uygulama doğru çalışmayabilir.\n\nPerformans ve analiz\nHangi içeriklerin daha çok kullanıldığını anlamamıza yardımcı olur. Veriler anonim olarak değerlendirilir.\n\nKişiselleştirme\nTercih edilen dil ve okuma düzeyi gibi ayarları hatırlayarak kişiselleştirilmiş deneyim sağlar.',
			'termOfService.cookiePolicy.section3Title' => '3. BU TEKNOLOJİLERİ NEDEN KULLANIYORUZ?',
			'termOfService.cookiePolicy.section3Body' => '• Uygulamanın güvenli ve sorunsuz çalışması için.\n• Okuma deneyimini kolaylaştırmak için.\n• Tekrarlanan ayarları hatırlamak için.\n• Gelecekteki özellik geliştirmelerini belirlemek için.',
			'termOfService.cookiePolicy.section4Title' => '4. ÜÇÜNCÜ TARAF TEKNOLOJİLERİ',
			'termOfService.cookiePolicy.section4Body' => 'Bazı teknolojiler hizmet sağlayıcılarımız tarafından sağlanabilir ve kendi politikalarına tabi olabilir. ChatFace, bu ortaklıklarda veri güvenliğine öncelik verir.',
			'termOfService.cookiePolicy.section5Title' => '5. ÇEREZ KONTROLÜ VE YÖNETİM',
			'termOfService.cookiePolicy.section5Body' => 'Kullanıcılar cihaz veya uygulama ayarları aracılığıyla bu teknolojileri sınırlayabilir. Gerekli teknolojilerin devre dışı bırakılması, örneğin video araması başlatılamaması gibi sorunlara yol açabilir.',
			'termOfService.cookiePolicy.section6Title' => '6. İLETİŞİM',
			'termOfService.cookiePolicy.section6Body' => '📩 İletişim: support@fly-work.com',
			'cookies' => 'Çerez Politikası',
			'privacy' => 'Gizlilik Politikası',
			'onboarding.step5.permissionRequired' => 'İzin gerekiyor',
			'onboarding.step5.notNow' => 'Şimdi değil',
			'onboarding.step5.openSettings' => 'Ayarları aç',
			'onboarding.step5.title' => 'İzinler',
			'onboarding.step5.permission1' => 'Kamera erişimi',
			'onboarding.step5.permission1Subtitle' => 'Kamera erişimine izin ver',
			'onboarding.step5.permission2' => 'Mikrofon erişimi',
			'onboarding.step5.permission2Subtitle' => 'Mikrofon erişimine izin ver',
			'onboarding.step5.permission3' => 'Konum erişimi',
			'onboarding.step5.permission3Subtitle' => 'Konum erişimine izin ver',
			'onboarding.step1.title' => 'Adınız nedir?',
			'onboarding.step1.subtitle' => 'Lütfen adınızı girin',
			'onboarding.step1.hint' => 'Tam isim',
			'onboarding.step2.title' => 'Kaç yaşındasınız?',
			'onboarding.step2.subtitle' => 'Kaydolmak için en az 18 yaşında olmalısınız.',
			'onboarding.step3.title' => 'Cinsiyetiniz?',
			'onboarding.step3.subtitle' => 'Lütfen cinsiyetinizi seçin',
			'onboarding.step3.male' => 'Erkek',
			'onboarding.step3.female' => 'Kadın',
			'onboarding.step3.dontWantToMention' => 'Belirtmek istemiyorum',
			'onboarding.step4.title' => 'Eğlenin ve \ngüvende kalın',
			'onboarding.step4.entry1' => 'Güvenli bir deneyim sağlıyoruz',
			'onboarding.step4.subentry1' => 'Gerçek zamanlı AI izlemesi etkin',
			'onboarding.step4.entry2' => 'Ekran kaydı',
			'onboarding.step4.subentry2' => 'İzinsiz kayıt yasaktır',
			'onboarding.step4.entry3' => '7/24 destek',
			'onboarding.step4.subentry3' => 'Şikayetler her zaman ele alınır',
			'onboarding.step4.entry4' => 'Sadece 18+',
			'onboarding.step4.subentry4' => 'Reşit olmayanlar için uygun değildir',
			'onboarding.step4.communityRules' => 'Topluluk Kuralları',
			'onboarding.loading.titlePart1' => 'Kişisel hesabınız',
			'onboarding.loading.titlePart2' => 'oluşturuluyor',
			'onboarding.loading.subtitle' => 'Lütfen bekleyin, profiliniz hazırlanıyor.',
			'onboarding.allowAccess' => 'Erişime izin ver',
			'onboarding.iUnderstand' => 'Anladım',
			'pressBackAgainToExit' => 'Çıkmak için tekrar Geri tuşuna basın',
			'splash.screen1.title' => 'Yapay zekâ ile \n yeni yüzlü video sohbet',
			'splash.screen1.description' => 'Kameranızı açın ve yapay zekâ ile yüz yüze konuşun. Duygularınızı, tonlamanızı ve bağlamınızı anlayan daha doğal bir iletişim deneyimi yaşayın.',
			'splash.screen2.title' => 'Gerçek ve doğal \n iletişim',
			'splash.screen2.description' => 'Sadece metin ile sınırlı kalmayın. Video çağrılarıyla daha akıcı, daha insancıl sohbetler yapın.',
			'auth.google' => 'Google ile devam et',
			'auth.facebook' => 'Facebook ile devam et',
			'auth.apple' => 'Apple ile devam et',
			'auth.guest' => 'Misafir olarak devam et',
			'auth.signInFailed' => ({required Object error}) => 'Giriş başarısız oldu: ${error}',
			'home.seeAll' => 'Hepsini görüntüle',
			'home.more' => 'Daha fazla',
			'home.online' => 'Çevrimiçi',
			'home.offline' => 'Çevrimdışı',
			'home.placeholders.fashionDesigner' => 'Moda Tasarımcısı',
			'home.placeholders.comedian' => 'Komedyen',
			'home.placeholders.influencer' => 'Influencer',
			'home.placeholders.teacher' => 'Öğretmen',
			'home.placeholders.friend' => 'Arkadaş',
			'characters.all' => 'Tümü',
			'characters.favorites' => 'Favoriler',
			'characters.recent' => 'Son',
			'characters.characters' => 'Karakterler',
			'characters.placeholderSubtitle' => 'Kullanıcı odaklı, basit ve kullanılabilir ürün tasarımcısı.',
			'characters.characterDetails.videoCall' => 'Video Arama',
			'characters.characterDetails.message' => 'Mesaj',
			'characters.characterDetails.voiceCall' => 'Sesli Arama',
			'notifications.today' => 'Bugün',
			'notifications.yesterday' => 'Dün',
			'notifications.weekAgo' => ({required Object week}) => '${week} hafta önce',
			'notifications.monthAgo' => ({required Object month}) => '${month} ay önce',
			'notifications.yearAgo' => ({required Object year}) => '${year} yıl önce',
			'notifications.noNotifications' => 'Henüz bildirim yok.',
			'notifications.noNotificationsSubtitle' => 'Daha sonra bildirim geldiğinde kontrol etmeyi unutmayın.',
			'notifications.allDeleted' => 'Tüm bildirimler başarıyla silindi',
			'videoChat.networkHiccup' => 'Ağ sorunu algılandı. Mikrofon yeniden bağlanıyor...',
			'videoChat.failedToUpdateFollow' => 'Takip durumu güncellenemedi.',
			'videoChat.connecting' => 'Bağlanıyor...',
			'videoChat.callEnded' => 'Arama sona erdi',
			'videoChat.callFailed' => ({required Object error}) => 'Arama başarısız oldu: ${error}',
			'videoChat.mute' => 'Sessize al',
			'videoChat.unmute' => 'Sessizi aç',
			'videoChat.endCall' => 'Aramayı sonlandır',
			'videoChat.swipeToChat' => 'Sohbete başlamak için kaydırın',
			'videoChat.male' => 'Erkek',
			'videoChat.female' => 'Kadın',
			'videoChat.country' => 'Ülke',
			'videoChat.follow' => 'Takip et',
			'videoChat.unfollow' => 'Takibi bırak',
			'videoChat.callEndedMessage' => 'Video araması sona erdi.',
			'videoChat.swipeForNewChat' => 'Yeni sohbet için kaydırın',
			'voiceChat.connecting' => 'Bağlanıyor...',
			'voiceChat.callEnded' => 'Arama sona erdi',
			'voiceChat.callFailed' => ({required Object error}) => 'Arama başarısız oldu: ${error}',
			'voiceChat.calling' => 'Aranıyor...',
			'chat.message' => 'Mesaj',
			'chat.history' => 'Geçmiş',
			'chat.noMessages' => 'Henüz mesaj yok.',
			'chat.noMessagesSubtitle' => 'Bir mesaj göndererek sohbet başlatın.',
			'chat.online' => 'Çevrimiçi',
			'chat.offline' => 'Çevrimdışı',
			'chat.gallery' => 'Galeri',
			'chat.camera' => 'Kamera',
			'chat.typeAMessage' => 'Mesaj yazın...',
			'chat.pleaseUpgrade' => 'Lütfen Pro sürümüne yükseltin.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Sesli arama sona erdi',
			'chat.videoCallEnded' => 'Video araması sona erdi',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Hakkımda',
			'editProfile.aboutMeHint' => 'Kendiniz hakkında bir şeyler yazın',
			'editProfile.fullName' => 'Tam isim',
			'editProfile.gender' => 'Cinsiyet',
			'editProfile.male' => 'Erkek',
			'editProfile.female' => 'Kadın',
			'editProfile.dontWantToMention' => 'Belirtmek istemiyorum',
			'editProfile.country' => 'Ülke',
			'editProfile.languagePreferences' => 'Dil tercihi',
			'editProfile.selectLanguage' => 'Tercih edilen bir dil ekleyin',
			'editProfile.saved' => 'Kaydedildi',
			'editProfile.changesSaved' => 'Değişiklikler kaydedildi.',
			'settingsSupport.title' => 'Ayarlar ve Destek',
			'settingsSupport.premiumTitle' => 'Tüm özelliklere \nsınırsız erişim',
			'settingsSupport.getPremium' => 'Premium al',
			'settingsSupport.settingsHub' => 'Ayarlar Merkezi',
			'settingsSupport.shareTheApp' => 'Uygulamayı paylaş',
			'settingsSupport.rateUs' => 'Bizi değerlendir',
			'settingsSupport.version' => 'Sürüm',
			'settingsSupport.notifications' => 'Bildirimler',
			'settingsSupport.accountManagement' => 'Hesap Yönetimi',
			'settingsSupport.deleteAccount' => 'Hesabı sil',
			'settingsSupport.logOut' => 'Çıkış Yap',
			'settingsSupport.logOutTitle' => 'Çıkış yapmak üzeresiniz',
			'settingsSupport.logOutSubtitle' => 'Tekrar görüşmek üzere! \n Sizi özleyeceğiz.',
			'deleteAccount.title' => 'Hesabı sil',
			'deleteAccount.warning' => 'Hesabınızı silmek istediğinize emin misiniz?',
			'deleteAccount.description' => 'Bu işlem geri alınamaz ve tüm verileriniz ile geçmişiniz kalıcı olarak silinecektir.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Hesap silme başarısız oldu: ${error}',
			'deleteAccount.steps.step1.title' => 'Sizi kaybetmek istemeyiz ama kararınızı anlıyoruz.',
			'deleteAccount.steps.step1.subtitle' => 'ChatFace deneyimini geliştirmek için neden ayrılmak istediğinizi söyleyebilir misiniz?',
			'deleteAccount.steps.step1.option1' => 'Yapay zekâ karakterleri gerçekçi değilmiş gibi hissettim.',
			'deleteAccount.steps.step1.option2' => 'Video sohbetleriyle ilgili teknik sorunlar yaşadım.',
			'deleteAccount.steps.step1.option3' => 'Abonelik fiyatları beklentimin üzerindeydi.',
			'deleteAccount.steps.step1.option4' => 'Aradığım karakter tarzını bulamadım.',
			'deleteAccount.steps.step1.option5' => 'Sadece kısa süreli denemek istemiştim.',
			'deleteAccount.steps.step1.option6' => 'Diğer',
			'deleteAccount.steps.step2.title' => 'Hesabınızı silerseniz, veda edeceksiniz:',
			'deleteAccount.steps.step2.subtitle1' => 'Derin bağlantılar ve anılar:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'İletişim kurduğunuz karakterler, paylaşılan sırları ve kişisel alışkanlıklarınızı tamamen unutacaktır.',
			'deleteAccount.steps.step2.subtitle2' => 'Video arama ayrıcalıkları:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'İstediğiniz zaman erişebildiğiniz kişisel AI görüşmelerini kaybedeceksiniz.',
			'deleteAccount.steps.step2.subtitle3' => 'Gelişmiş algoritma:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Tercihleriniz temelinde size sunulan \'Sana Özel\' eşleştirmeleri sıfırlanacaktır.',
			'deleteAccount.steps.step2.subtitle4' => 'Profil verileri:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Başarılarınız, özel karakterler ve sohbet geçmişiniz geri döndürülemez şekilde silinecektir.',
			'deleteAccount.steps.step3.title' => 'Gitmeden önce sizin için özel bir teklifimiz var!',
			'deleteAccount.steps.step3.description' => 'Belki biraz daha zamana veya daha uygun bir teklife ihtiyacınız vardır. Silme yerine bunları değerlendirmek ister misiniz?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Sizin kalmanızı önemsiyoruz. Bir sonraki aboneliğinizde size ${offer} sunuyoruz! Bu teklifi değerlendirmek ister misiniz?',
			'deleteAccount.steps.step3.description1Offer' => '%50 indirim sunduk',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Size yeni karakterleri keşfetmeniz için ${offer} kredi verdik.',
			'deleteAccount.steps.step3.description2Offer' => '3 ücretsiz video araması',
			'deleteAccount.steps.step3.acceptOffer' => '%50 indirimi kabul et',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Hesabımı sil',
			'cancel' => 'İptal',
			'delete' => 'Sil',
			'premium' => 'Premium',
			'profileEdit' => 'Profili düzenle',
			'settings' => 'Ayarlar',
			'undo' => 'Geri al',
			'successfully' => 'Başarıyla',
			'save' => 'Kaydet',
			'languageOptions.english' => 'İngilizce',
			'languageOptions.chinese' => 'Çince',
			'languageOptions.german' => 'Almanca',
			'languageOptions.italian' => 'İtalyanca',
			'languageOptions.french' => 'Fransızca',
			'languageOptions.japanese' => 'Japonca',
			'languageOptions.spanish' => 'İspanyolca',
			'languageOptions.russian' => 'Rusça',
			'languageOptions.turkish' => 'Türkçe',
			'languageOptions.korean' => 'Korece',
			'languageOptions.hindi' => 'Hintçe',
			'languageOptions.portuguese' => 'Portekizce',
			'common.tryAgain' => 'Tekrar Dene',
			'common.retry' => 'Yeniden Dene',
			'common.close' => 'Kapat',
			'permissionsRequired' => 'İzinler Gerekli',
			'permissionHelper.camAndMicRequired' => 'Görüntülü aramalar için kamera ve mikrofon izinleri gereklidir. Lütfen ayarlardan etkinleştirin.',
			'permissionHelper.micRequired' => 'Sesli aramalar için mikrofon izni gereklidir. Lütfen ayarlardan etkinleştirin.',
			'permissionHelper.cancel' => 'İptal',
			'permissionHelper.openSettings' => 'Ayarları Aç',
			'videoView.title' => 'Kamera filtreleri',
			'videoView.subtitle' => 'Kamera önizlemesi için bir görünüm seç.',
			'videoView.errorLoad' => 'Karakterler yüklenemedi: ',
			'videoView.noComps' => 'Henüz hiç karakter yok.',
			'videoView.filters.ORIGINAL' => 'Orijinal',
			'videoView.filters.ADDICTIVE_BLUE' => 'Bağımlılık Mavisi',
			'videoView.filters.ADDICTIVE_RED' => 'Bağımlılık Kırmızısı',
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
