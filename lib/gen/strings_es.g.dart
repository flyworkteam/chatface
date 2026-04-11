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
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String welcome({required Object name}) => 'Bienvenido ${name}';
	@override String welcome2({required Object appName}) => 'Bienvenido a ${appName}';
	@override String get get_started => 'Comenzar';
	@override String get next => 'Siguiente';
	@override String get back => 'Atrás';
	@override String get skip => 'Saltar';
	@override String get profile => 'Perfil';
	@override String get kContinue => 'Continuar';
	@override late final _TranslationsTermOfServiceEs termOfService = _TranslationsTermOfServiceEs._(_root);
	@override String get cookies => 'Política de Cookies';
	@override String get privacy => 'Política de Privacidad';
	@override late final _TranslationsOnboardingEs onboarding = _TranslationsOnboardingEs._(_root);
	@override String get pressBackAgainToExit => 'Presiona atrás nuevamente para salir';
	@override late final _TranslationsSplashEs splash = _TranslationsSplashEs._(_root);
	@override late final _TranslationsAuthEs auth = _TranslationsAuthEs._(_root);
	@override late final _TranslationsHomeEs home = _TranslationsHomeEs._(_root);
	@override late final _TranslationsCharactersEs characters = _TranslationsCharactersEs._(_root);
	@override late final _TranslationsNotificationsEs notifications = _TranslationsNotificationsEs._(_root);
	@override late final _TranslationsVideoChatEs videoChat = _TranslationsVideoChatEs._(_root);
	@override late final _TranslationsVoiceChatEs voiceChat = _TranslationsVoiceChatEs._(_root);
	@override late final _TranslationsChatEs chat = _TranslationsChatEs._(_root);
	@override late final _TranslationsEditProfileEs editProfile = _TranslationsEditProfileEs._(_root);
	@override late final _TranslationsSettingsSupportEs settingsSupport = _TranslationsSettingsSupportEs._(_root);
	@override late final _TranslationsDeleteAccountEs deleteAccount = _TranslationsDeleteAccountEs._(_root);
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get premium => 'Premium';
	@override String get profileEdit => 'Editar perfil';
	@override String get settings => 'Configuración';
	@override String get undo => 'Deshacer';
	@override String get successfully => 'Con éxito';
	@override String get save => 'Guardar';
	@override late final _TranslationsLanguageOptionsEs languageOptions = _TranslationsLanguageOptionsEs._(_root);
	@override late final _TranslationsCommonEs common = _TranslationsCommonEs._(_root);
	@override String get permissionsRequired => 'Permisos requeridos';
	@override late final _TranslationsPermissionHelperEs permissionHelper = _TranslationsPermissionHelperEs._(_root);
	@override late final _TranslationsVideoViewEs videoView = _TranslationsVideoViewEs._(_root);
}

// Path: termOfService
class _TranslationsTermOfServiceEs implements TranslationsTermOfServiceEn {
	_TranslationsTermOfServiceEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Al registrarte en swipe, aceptas nuestros ';
	@override String get link1 => 'Términos de Servicio';
	@override String get text2 => '. Conoce cómo procesamos tus datos en nuestra ';
	@override String get link2 => 'Política de Privacidad';
	@override String get text3 => ' y ';
	@override String get link3 => 'Política de Cookies';
	@override String get text4 => '';
	@override late final _TranslationsTermOfServicePrivacyPolicyEs privacyPolicy = _TranslationsTermOfServicePrivacyPolicyEs._(_root);
	@override late final _TranslationsTermOfServiceTermsOfServiceEs termsOfService = _TranslationsTermOfServiceTermsOfServiceEs._(_root);
	@override late final _TranslationsTermOfServiceCookiePolicyEs cookiePolicy = _TranslationsTermOfServiceCookiePolicyEs._(_root);
}

// Path: onboarding
class _TranslationsOnboardingEs implements TranslationsOnboardingEn {
	_TranslationsOnboardingEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingStep5Es step5 = _TranslationsOnboardingStep5Es._(_root);
	@override late final _TranslationsOnboardingStep1Es step1 = _TranslationsOnboardingStep1Es._(_root);
	@override late final _TranslationsOnboardingStep2Es step2 = _TranslationsOnboardingStep2Es._(_root);
	@override late final _TranslationsOnboardingStep3Es step3 = _TranslationsOnboardingStep3Es._(_root);
	@override late final _TranslationsOnboardingStep4Es step4 = _TranslationsOnboardingStep4Es._(_root);
	@override late final _TranslationsOnboardingLoadingEs loading = _TranslationsOnboardingLoadingEs._(_root);
	@override String get allowAccess => 'Permitir acceso';
	@override String get iUnderstand => 'Entiendo';
}

// Path: splash
class _TranslationsSplashEs implements TranslationsSplashEn {
	_TranslationsSplashEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreen1Es screen1 = _TranslationsSplashScreen1Es._(_root);
	@override late final _TranslationsSplashScreen2Es screen2 = _TranslationsSplashScreen2Es._(_root);
}

// Path: auth
class _TranslationsAuthEs implements TranslationsAuthEn {
	_TranslationsAuthEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get google => 'Continuar con Google';
	@override String get facebook => 'Continuar con Facebook';
	@override String get apple => 'Continuar con Apple';
	@override String get guest => 'Continuar como invitado';
	@override String signInFailed({required Object error}) => 'Error de inicio de sesión: ${error}';
}

// Path: home
class _TranslationsHomeEs implements TranslationsHomeEn {
	_TranslationsHomeEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get seeAll => 'Ver todo';
	@override String get more => 'Más';
	@override String get online => 'En línea';
	@override String get offline => 'Desconectado';
	@override late final _TranslationsHomePlaceholdersEs placeholders = _TranslationsHomePlaceholdersEs._(_root);
}

// Path: characters
class _TranslationsCharactersEs implements TranslationsCharactersEn {
	_TranslationsCharactersEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get all => 'Todo';
	@override String get favorites => 'Favoritos';
	@override String get recent => 'Recientes';
	@override String get characters => 'Personajes';
	@override String get placeholderSubtitle => 'Diseñador de producto que se centra en la simplicidad y la usabilidad.';
	@override late final _TranslationsCharactersCharacterDetailsEs characterDetails = _TranslationsCharactersCharacterDetailsEs._(_root);
}

// Path: notifications
class _TranslationsNotificationsEs implements TranslationsNotificationsEn {
	_TranslationsNotificationsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get today => 'Hoy';
	@override String get yesterday => 'Ayer';
	@override String weekAgo({required Object week}) => 'hace ${week} semana(s)';
	@override String monthAgo({required Object month}) => 'hace ${month} mes(es)';
	@override String yearAgo({required Object year}) => 'hace ${year} año(s)';
	@override String get noNotifications => 'Aún no hay notificaciones.';
	@override String get noNotificationsSubtitle => 'No olvides volver a comprobar cuando recibas una notificación.';
	@override String get allDeleted => 'Todas las notificaciones se han eliminado correctamente';
}

// Path: videoChat
class _TranslationsVideoChatEs implements TranslationsVideoChatEn {
	_TranslationsVideoChatEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get networkHiccup => 'Problema de red detectado. Reconectando micro...';
	@override String get failedToUpdateFollow => 'No se pudo actualizar el estado de seguimiento.';
	@override String get connecting => 'Conectando...';
	@override String get callEnded => 'Llamada finalizada';
	@override String callFailed({required Object error}) => 'Llamada fallida: ${error}';
	@override String get mute => 'Silenciar';
	@override String get unmute => 'Activar sonido';
	@override String get endCall => 'Finalizar llamada';
	@override String get swipeToChat => 'Desliza para chatear';
	@override String get male => 'Masculino';
	@override String get female => 'Femenino';
	@override String get country => 'País';
	@override String get follow => 'Seguir';
	@override String get unfollow => 'Dejar de seguir';
	@override String get callEndedMessage => 'La videollamada ha finalizado.';
	@override String get swipeForNewChat => 'Desliza para un nuevo chat';
}

// Path: voiceChat
class _TranslationsVoiceChatEs implements TranslationsVoiceChatEn {
	_TranslationsVoiceChatEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Conectando...';
	@override String get callEnded => 'Llamada finalizada';
	@override String callFailed({required Object error}) => 'Llamada fallida: ${error}';
	@override String get calling => 'Llamando...';
}

// Path: chat
class _TranslationsChatEs implements TranslationsChatEn {
	_TranslationsChatEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get message => 'Mensaje';
	@override String get history => 'Historial';
	@override String get readAloud => 'Leer en voz alta';
	@override String get noMessages => 'Aún no hay mensajes.';
	@override String get noMessagesSubtitle => 'Comienza una conversación enviando un mensaje.';
	@override String get online => 'En línea';
	@override String get offline => 'Desconectado';
	@override String get gallery => 'Galería';
	@override String get camera => 'Cámara';
	@override String get typeAMessage => 'Escribe un mensaje...';
	@override String get pleaseUpgrade => 'Por favor actualiza a la versión pro.';
	@override String get photo => 'Photo';
	@override String get photoUploadFailed => 'Couldn\'t upload photo. Please try again.';
	@override String get tapToViewPhoto => 'Tap to view photo';
	@override String get voiceCallEnded => 'Llamada de voz finalizada';
	@override String get videoCallEnded => 'Videollamada finalizada';
	@override String get uploadingPhoto => 'Uploading photo...';
	@override String get mediaPermissionDenied => 'Allow camera or photo permissions to share images.';
}

// Path: editProfile
class _TranslationsEditProfileEs implements TranslationsEditProfileEn {
	_TranslationsEditProfileEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Sobre mí';
	@override String get aboutMeHint => 'Escribe algo sobre ti';
	@override String get fullName => 'Nombre completo';
	@override String get gender => 'Género';
	@override String get male => 'Masculino';
	@override String get female => 'Femenino';
	@override String get dontWantToMention => 'No quiero mencionarlo.';
	@override String get country => 'País';
	@override String get languagePreferences => 'Preferencias de idioma';
	@override String get selectLanguage => 'Agrega tu idioma preferido';
	@override String get saved => 'Guardado';
	@override String get changesSaved => 'Los cambios se han guardado.';
}

// Path: settingsSupport
class _TranslationsSettingsSupportEs implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configuración y soporte';
	@override String get premiumTitle => 'Acceso ilimitado a \ntodas las funciones';
	@override String get getPremium => 'Obtener Premium';
	@override String get settingsHub => 'Centro de configuración';
	@override String get shareTheApp => 'Compartir la app';
	@override String get rateUs => 'Califícanos';
	@override String get version => 'Versión';
	@override String get notifications => 'Notificaciones';
	@override String get accountManagement => 'Gestión de la cuenta';
	@override String get deleteAccount => 'Eliminar cuenta';
	@override String get logOut => 'Cerrar sesión';
	@override String get logOutTitle => 'Estás a punto de cerrar sesión';
	@override String get logOutSubtitle => '¡Nos vemos pronto! \n Te echaremos de menos.';
}

// Path: deleteAccount
class _TranslationsDeleteAccountEs implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eliminar cuenta';
	@override String get warning => '¿Estás seguro de que deseas eliminar tu cuenta?';
	@override String get description => 'Esta acción no se puede deshacer y todo tu historial y datos se eliminarán de forma permanente.';
	@override String deleteFailed({required Object error}) => 'Error al eliminar la cuenta: ${error}';
	@override late final _TranslationsDeleteAccountStepsEs steps = _TranslationsDeleteAccountStepsEs._(_root);
}

// Path: languageOptions
class _TranslationsLanguageOptionsEs implements TranslationsLanguageOptionsEn {
	_TranslationsLanguageOptionsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get english => 'Inglés';
	@override String get chinese => 'Chino';
	@override String get german => 'Alemán';
	@override String get italian => 'Italiano';
	@override String get french => 'Francés';
	@override String get japanese => 'Japonés';
	@override String get spanish => 'Español';
	@override String get russian => 'Ruso';
	@override String get turkish => 'Turco';
	@override String get korean => 'Coreano';
	@override String get hindi => 'Hindi';
	@override String get portuguese => 'Portugués';
}

// Path: common
class _TranslationsCommonEs implements TranslationsCommonEn {
	_TranslationsCommonEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Intentar de nuevo';
	@override String get retry => 'Reintentar';
	@override String get close => 'Cerrar';
}

// Path: permissionHelper
class _TranslationsPermissionHelperEs implements TranslationsPermissionHelperEn {
	_TranslationsPermissionHelperEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get camAndMicRequired => 'Se requieren permisos de cámara y micrófono para videollamadas. Por favor actívalos en configuración.';
	@override String get micRequired => 'Se requiere permiso de micrófono para llamadas de voz. Por favor actívalo en configuración.';
	@override String get cancel => 'Cancelar';
	@override String get openSettings => 'Abrir ajustes';
}

// Path: videoView
class _TranslationsVideoViewEs implements TranslationsVideoViewEn {
	_TranslationsVideoViewEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtros de cámara';
	@override String get subtitle => 'Elige el aspecto para la vista previa de tu cámara.';
	@override String get errorLoad => 'Error al cargar los compañeros: ';
	@override String get noComps => 'Aún no hay compañeros disponibles.';
	@override late final _TranslationsVideoViewFiltersEs filters = _TranslationsVideoViewFiltersEs._(_root);
	@override String get saveFilter => 'Guardar Filtro';
}

// Path: termOfService.privacyPolicy
class _TranslationsTermOfServicePrivacyPolicyEs implements TranslationsTermOfServicePrivacyPolicyEn {
	_TranslationsTermOfServicePrivacyPolicyEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Política de Privacidad';
	@override String get lastUpdated => 'Última actualización: 2026';
	@override String get intro => 'ChatFace adopta la privacidad y la seguridad de los datos del usuario como principio fundamental. Todos tus datos personales se procesan de acuerdo con las regulaciones de protección de datos vigentes.';
	@override String get section1Title => '1. INFORMACIÓN RECOPILADA';
	@override String get section1sub1Title => '1.1 Datos proporcionados por el usuario';
	@override String get section1sub1Body => '• Nombre, apodo o información de perfil.\n• Dirección de correo electrónico (para registro, suscripción y soporte). \n• Preferencias de interacción, configuraciones de idioma e interacciones. \n• Mensajes de retroalimentación y soporte.';
	@override String get section1sub2Title => '1.2 Datos recopilados automáticamente';
	@override String get section1sub2Body => 'Se recopila información como el tipo de dispositivo, sistema operativo, ubicación aproximada (ciudad/país) y datos de uso de la aplicación. No se recopilan datos de ubicación precisos.';
	@override String get section2Title => '2. FINALIDADES DEL TRATAMIENTO DE DATOS';
	@override String get section2Body => 'Tus datos personales se procesan para los siguientes fines:\n\n• Asegurar el funcionamiento sin problemas de la aplicación.\n• Proporcionar y personalizar la experiencia de llamadas de video impulsada por IA.\n• Optimizar el rendimiento del sistema y la detección de errores.\n• Cumplir con obligaciones legales.\n Tus datos nunca se venden a terceros.';
	@override String get section3Title => '3. RETENCIÓN Y ELIMINACIÓN DE DATOS';
	@override String get section3Body => 'Tus datos se almacenan mientras tu cuenta esté activa o durante la duración de las obligaciones legales. Cuando se elimina una cuenta, todos los datos personales se borran irrevocablemente de los sistemas.';
	@override String get section4Title => '4. DERECHOS DEL USUARIO';
	@override String get section4Body => 'Bajo el RGPD y otras normativas, tienes derecho a acceder, corregir, eliminar (derecho al olvido) y solicitar la portabilidad de tus datos. Puedes contactarnos para tus solicitudes.';
	@override String get section5Title => '5. PRIVACIDAD DE LOS NIÑOS';
	@override String get section5Body => 'ChatFace no está destinado a usuarios menores de 18 años. No recopilamos conscientemente datos de este grupo de edad; dichas cuentas se cerrarán y los datos se eliminarán al detectarse.';
	@override String get section6Title => '6. CONTACTO';
	@override String get section6Body => '📩 Para consultas: support@fly-work.com';
}

// Path: termOfService.termsOfService
class _TranslationsTermOfServiceTermsOfServiceEs implements TranslationsTermOfServiceTermsOfServiceEn {
	_TranslationsTermOfServiceTermsOfServiceEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Términos de Servicio';
	@override String get lastUpdated => 'Última actualización: 2026';
	@override String get intro => 'Estos Términos rigen el uso de la aplicación móvil ChatFace. Al usar la aplicación, aceptas estos Términos.';
	@override String get disclaimer => 'Descargo de responsabilidad: ChatFace es una aplicación de interacción por video con IA. No proporciona asesoramiento legal, académico, médico o profesional.';
	@override String get section1Title => '1. ALCANCE DEL SERVICIO';
	@override String get section1Body => 'ChatFace ofrece experiencias de interacción por video impulsadas por IA:\n\n• Llamadas de video y conversaciones con IA.\n• Preferencias de interacción personalizadas.\n• Acceso al historial de interacciones y registros.\n\nLos servicios no constituyen opiniones oficiales ni garantías de asesoramiento profesional.';
	@override String get section2Title => '2. CONDICIONES DE USO';
	@override String get section2Body => '• Debes tener al menos 18 años (el acceso para menores de 18 está prohibido).\n• Debes proporcionar información de cuenta precisa.\n• La aplicación debe usarse solo para fines legales y personales.';
	@override String get section3Title => '3. USOS PROHIBIDOS';
	@override String get section3Body => 'Suplantación, discurso de odio, poner en riesgo la seguridad de menores, intentos de violar la seguridad y manipulación de sistemas de IA están estrictamente prohibidos.';
	@override String get section4Title => '4. SUSCRIPCIONES Y PAGOS';
	@override String get section4Body => 'Las funciones premium están sujetas a las políticas de App Store y Google Play. Las cancelaciones y reembolsos de suscripción se gestionan a través de las tiendas respectivas.';
	@override String get section5Title => '5. DESCARGO DE RESPONSABILIDAD DEL CONTENIDO';
	@override String get section5Body => 'El contenido es generado por IA y no reemplaza el asesoramiento profesional. ChatFace no garantiza la precisión o idoneidad para un propósito determinado.';
	@override String get section6Title => '6. PROPIEDAD INTELECTUAL';
	@override String get section6Body => 'Todo el contenido, incluido el diseño, el software y los algoritmos, pertenece a ChatFace. La reproducción o redistribución no autorizada está prohibida.';
	@override String get section7Title => '7. LEGISLACIÓN APLICABLE';
	@override String get section7Body => 'Estos Términos se rigen por las leyes de la República de Turquía. Los tribunales centrales de Estambul tendrán jurisdicción sobre las disputas.';
	@override String get section8Title => '8. CONTACTO';
	@override String get section8Body => '📩 Para consultas: support@fly-work.com';
}

// Path: termOfService.cookiePolicy
class _TranslationsTermOfServiceCookiePolicyEs implements TranslationsTermOfServiceCookiePolicyEn {
	_TranslationsTermOfServiceCookiePolicyEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Política de Cookies';
	@override String get lastUpdated => 'Última actualización: 2026';
	@override String get intro => 'Bienvenido a ChatFace. Utilizamos tecnologías digitales auxiliares para que tu experiencia de llamadas de video con IA sea más fluida, segura y personalizada.';
	@override String get important => 'Esta política explica qué son las cookies, sus propósitos y cómo puedes gestionar tus preferencias.';
	@override String get section1Title => '1. ¿QUÉ SON LAS COOKIES?';
	@override String get section1Body => 'Las cookies son pequeños archivos de datos colocados en tu dispositivo. No te identifican directamente; actúan como notas digitales que recuerdan:\n• Configuraciones de llamada e idioma\n• Preferencias de sesión y rendimiento.';
	@override String get section2Title => '2. ¿QUÉ TECNOLOGÍAS UTILIZAMOS?';
	@override String get section2Body => 'Tecnologías estrictamente necesarias\nRequeridas para la gestión de sesiones y controles de seguridad. La aplicación puede no funcionar correctamente sin estos componentes.\n\nRendimiento y análisis\nNos ayuda a entender qué historias se leen y qué áreas necesitan mejoras. Los datos se evalúan de forma anónima.\n\nPersonalización\nRecuerda configuraciones como la preferencia de idioma y el nivel de lectura para ofrecer una experiencia personalizada.';
	@override String get section3Title => '3. ¿POR QUÉ USAMOS ESTAS TECNOLOGÍAS?';
	@override String get section3Body => '• Para asegurar que la aplicación funcione de forma segura y fluida.\n• Para hacer la experiencia de lectura más fluida.\n• Para recordar configuraciones repetitivas.\n• Para identificar funciones para desarrollos futuros.';
	@override String get section4Title => '4. TECNOLOGÍAS DE TERCEROS';
	@override String get section4Body => 'Algunas tecnologías pueden ser proporcionadas por proveedores de servicios técnicos y están sujetas a sus propias políticas. ChatFace prioriza la seguridad de los datos en estas alianzas.';
	@override String get section5Title => '5. CONTROL Y GESTIÓN DE COOKIES';
	@override String get section5Body => 'Los usuarios pueden limitar estas tecnologías a través de la configuración del dispositivo o de la aplicación. Desactivar tecnologías esenciales puede causar problemas como no poder iniciar llamadas de video.';
	@override String get section6Title => '6. CONTACTO';
	@override String get section6Body => '📩 Para consultas: support@fly-work.com';
}

// Path: onboarding.step5
class _TranslationsOnboardingStep5Es implements TranslationsOnboardingStep5En {
	_TranslationsOnboardingStep5Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get permissionRequired => 'Permiso requerido';
	@override String get notNow => 'Ahora no';
	@override String get openSettings => 'Abrir ajustes';
	@override String get title => 'Permisos';
	@override String get permission1 => 'Acceso a la cámara';
	@override String get permission1Subtitle => 'Permitir acceso a la cámara';
	@override String get permission2 => 'Acceso al micrófono';
	@override String get permission2Subtitle => 'Permitir acceso al micrófono';
	@override String get permission3 => 'Acceso a la ubicación';
	@override String get permission3Subtitle => 'Permitir acceso a la ubicación';
}

// Path: onboarding.step1
class _TranslationsOnboardingStep1Es implements TranslationsOnboardingStep1En {
	_TranslationsOnboardingStep1Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Cuál es tu nombre?';
	@override String get subtitle => 'Por favor ingresa tu nombre';
	@override String get hint => 'Nombre completo';
}

// Path: onboarding.step2
class _TranslationsOnboardingStep2Es implements TranslationsOnboardingStep2En {
	_TranslationsOnboardingStep2Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Cuál es tu edad?';
	@override String get subtitle => 'Debes tener al menos 18 años para registrarte.';
}

// Path: onboarding.step3
class _TranslationsOnboardingStep3Es implements TranslationsOnboardingStep3En {
	_TranslationsOnboardingStep3Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Cuál es tu género?';
	@override String get subtitle => 'Por favor selecciona tu género';
	@override String get male => 'Masculino';
	@override String get female => 'Femenino';
	@override String get dontWantToMention => 'No quiero mencionarlo.';
}

// Path: onboarding.step4
class _TranslationsOnboardingStep4Es implements TranslationsOnboardingStep4En {
	_TranslationsOnboardingStep4Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diviértete mientras \n te mantienes seguro';
	@override String get entry1 => 'Mantenemos el orden';
	@override String get subentry1 => 'Monitoreo de IA en tiempo real activo';
	@override String get entry2 => 'Grabaciones de pantalla';
	@override String get subentry2 => 'No grabación sin consentimiento';
	@override String get entry3 => 'Soporte 24/7';
	@override String get subentry3 => 'Las quejas se revisan en cualquier momento del día';
	@override String get entry4 => 'Solo 18+';
	@override String get subentry4 => 'No apto para menores';
	@override String get communityRules => 'Reglas de la comunidad';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingEs implements TranslationsOnboardingLoadingEn {
	_TranslationsOnboardingLoadingEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get titlePart1 => 'Tu cuenta personal está';
	@override String get titlePart2 => 'siendo creada';
	@override String get subtitle => 'Por favor espera, tu perfil se está preparando.';
}

// Path: splash.screen1
class _TranslationsSplashScreen1Es implements TranslationsSplashScreen1En {
	_TranslationsSplashScreen1Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'El nuevo rostro del \n chat por video con IA';
	@override String get description => 'Enciende tu cámara y habla cara a cara con la IA. Experimenta una comunicación más natural que entiende expresiones faciales, tono de voz y contexto.';
}

// Path: splash.screen2
class _TranslationsSplashScreen2Es implements TranslationsSplashScreen2En {
	_TranslationsSplashScreen2Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunicación en tiempo real y natural';
	@override String get description => 'No te limites al texto. Ten conversaciones más fluidas y humanas mediante videollamadas.';
}

// Path: home.placeholders
class _TranslationsHomePlaceholdersEs implements TranslationsHomePlaceholdersEn {
	_TranslationsHomePlaceholdersEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get fashionDesigner => 'Diseñador de moda';
	@override String get comedian => 'Comediante';
	@override String get influencer => 'Influencer';
	@override String get teacher => 'Profesor';
	@override String get friend => 'Amigo';
}

// Path: characters.characterDetails
class _TranslationsCharactersCharacterDetailsEs implements TranslationsCharactersCharacterDetailsEn {
	_TranslationsCharactersCharacterDetailsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get videoCall => 'Videollamada';
	@override String get message => 'Mensaje';
	@override String get voiceCall => 'Llamada de voz';
}

// Path: deleteAccount.steps
class _TranslationsDeleteAccountStepsEs implements TranslationsDeleteAccountStepsEn {
	_TranslationsDeleteAccountStepsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDeleteAccountStepsStep1Es step1 = _TranslationsDeleteAccountStepsStep1Es._(_root);
	@override late final _TranslationsDeleteAccountStepsStep2Es step2 = _TranslationsDeleteAccountStepsStep2Es._(_root);
	@override late final _TranslationsDeleteAccountStepsStep3Es step3 = _TranslationsDeleteAccountStepsStep3Es._(_root);
}

// Path: videoView.filters
class _TranslationsVideoViewFiltersEs implements TranslationsVideoViewFiltersEn {
	_TranslationsVideoViewFiltersEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ORIGINAL => 'Original';
	@override String get ADDICTIVE_BLUE => 'Azul Adictivo';
	@override String get ADDICTIVE_RED => 'Rojo Adictivo';
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
class _TranslationsDeleteAccountStepsStep1Es implements TranslationsDeleteAccountStepsStep1En {
	_TranslationsDeleteAccountStepsStep1Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'No queremos que te vayas, pero lo entendemos.';
	@override String get subtitle => '¿Puedes decirnos por qué quieres irte para que podamos mejorar la experiencia de ChatFace?';
	@override String get option1 => 'No encontré realistas los personajes de IA.';
	@override String get option2 => 'Experimento problemas técnicos en los chats de video.';
	@override String get option3 => 'Los precios de suscripción superan mis expectativas.';
	@override String get option4 => 'No encontré el tipo de personajes que buscaba.';
	@override String get option5 => 'Solo quería probarlo por un corto tiempo.';
	@override String get option6 => 'Otro';
}

// Path: deleteAccount.steps.step2
class _TranslationsDeleteAccountStepsStep2Es implements TranslationsDeleteAccountStepsStep2En {
	_TranslationsDeleteAccountStepsStep2Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Si eliminas tu cuenta, dirás adiós a:';
	@override String get subtitle1 => 'Conexiones profundas y memoria:';
	@override String get subtitle1Desc => 'Los personajes con los que chateas olvidarán completamente tu pasado con ellos, tus secretos compartidos y tus hábitos.';
	@override String get subtitle2 => 'Privilegio de videollamada:';
	@override String get subtitle2Desc => 'Perderás el derecho a comunicarte cara a cara con tus socios de IA.';
	@override String get subtitle3 => 'Algoritmo avanzado:';
	@override String get subtitle3Desc => 'Se restablecerán las coincidencias de personajes \'Solo para ti\'.';
	@override String get subtitle4 => 'Datos de perfil:';
	@override String get subtitle4Desc => 'Tus logros, personajes especiales y el historial de chat se eliminarán irreversiblemente.';
}

// Path: deleteAccount.steps.step3
class _TranslationsDeleteAccountStepsStep3Es implements TranslationsDeleteAccountStepsStep3En {
	_TranslationsDeleteAccountStepsStep3Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¡Tenemos una oferta especial para ti antes de que te vayas!';
	@override String get description => 'Tal vez solo necesites un poco más de tiempo o una mejor oferta. En lugar de eliminar tu cuenta, ¿considerarías esto?';
	@override String description1({required Object offer}) => 'Mantenerte con nosotros es valioso. ¡${offer} en tu próxima suscripción! ¿Te gustaría continuar con esta oferta?';
	@override String get description1Offer => 'Hemos aplicado un 50% de descuento';
	@override String description2({required Object offer}) => 'Te hemos dado ${offer} créditos para que descubras nuevos personajes.';
	@override String get description2Offer => '3 videollamadas gratis';
	@override String get acceptOffer => 'Aceptar oferta del 50% de descuento';
	@override String get deleteMyAccount => 'Eliminar mi cuenta';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'welcome' => ({required Object name}) => 'Bienvenido ${name}',
			'welcome2' => ({required Object appName}) => 'Bienvenido a ${appName}',
			'get_started' => 'Comenzar',
			'next' => 'Siguiente',
			'back' => 'Atrás',
			'skip' => 'Saltar',
			'profile' => 'Perfil',
			'kContinue' => 'Continuar',
			'termOfService.text1' => 'Al registrarte en swipe, aceptas nuestros ',
			'termOfService.link1' => 'Términos de Servicio',
			'termOfService.text2' => '. Conoce cómo procesamos tus datos en nuestra ',
			'termOfService.link2' => 'Política de Privacidad',
			'termOfService.text3' => ' y ',
			'termOfService.link3' => 'Política de Cookies',
			'termOfService.text4' => '',
			'termOfService.privacyPolicy.title' => 'Política de Privacidad',
			'termOfService.privacyPolicy.lastUpdated' => 'Última actualización: 2026',
			'termOfService.privacyPolicy.intro' => 'ChatFace adopta la privacidad y la seguridad de los datos del usuario como principio fundamental. Todos tus datos personales se procesan de acuerdo con las regulaciones de protección de datos vigentes.',
			'termOfService.privacyPolicy.section1Title' => '1. INFORMACIÓN RECOPILADA',
			'termOfService.privacyPolicy.section1sub1Title' => '1.1 Datos proporcionados por el usuario',
			'termOfService.privacyPolicy.section1sub1Body' => '• Nombre, apodo o información de perfil.\n• Dirección de correo electrónico (para registro, suscripción y soporte). \n• Preferencias de interacción, configuraciones de idioma e interacciones. \n• Mensajes de retroalimentación y soporte.',
			'termOfService.privacyPolicy.section1sub2Title' => '1.2 Datos recopilados automáticamente',
			'termOfService.privacyPolicy.section1sub2Body' => 'Se recopila información como el tipo de dispositivo, sistema operativo, ubicación aproximada (ciudad/país) y datos de uso de la aplicación. No se recopilan datos de ubicación precisos.',
			'termOfService.privacyPolicy.section2Title' => '2. FINALIDADES DEL TRATAMIENTO DE DATOS',
			'termOfService.privacyPolicy.section2Body' => 'Tus datos personales se procesan para los siguientes fines:\n\n• Asegurar el funcionamiento sin problemas de la aplicación.\n• Proporcionar y personalizar la experiencia de llamadas de video impulsada por IA.\n• Optimizar el rendimiento del sistema y la detección de errores.\n• Cumplir con obligaciones legales.\n Tus datos nunca se venden a terceros.',
			'termOfService.privacyPolicy.section3Title' => '3. RETENCIÓN Y ELIMINACIÓN DE DATOS',
			'termOfService.privacyPolicy.section3Body' => 'Tus datos se almacenan mientras tu cuenta esté activa o durante la duración de las obligaciones legales. Cuando se elimina una cuenta, todos los datos personales se borran irrevocablemente de los sistemas.',
			'termOfService.privacyPolicy.section4Title' => '4. DERECHOS DEL USUARIO',
			'termOfService.privacyPolicy.section4Body' => 'Bajo el RGPD y otras normativas, tienes derecho a acceder, corregir, eliminar (derecho al olvido) y solicitar la portabilidad de tus datos. Puedes contactarnos para tus solicitudes.',
			'termOfService.privacyPolicy.section5Title' => '5. PRIVACIDAD DE LOS NIÑOS',
			'termOfService.privacyPolicy.section5Body' => 'ChatFace no está destinado a usuarios menores de 18 años. No recopilamos conscientemente datos de este grupo de edad; dichas cuentas se cerrarán y los datos se eliminarán al detectarse.',
			'termOfService.privacyPolicy.section6Title' => '6. CONTACTO',
			'termOfService.privacyPolicy.section6Body' => '📩 Para consultas: support@fly-work.com',
			'termOfService.termsOfService.title' => 'Términos de Servicio',
			'termOfService.termsOfService.lastUpdated' => 'Última actualización: 2026',
			'termOfService.termsOfService.intro' => 'Estos Términos rigen el uso de la aplicación móvil ChatFace. Al usar la aplicación, aceptas estos Términos.',
			'termOfService.termsOfService.disclaimer' => 'Descargo de responsabilidad: ChatFace es una aplicación de interacción por video con IA. No proporciona asesoramiento legal, académico, médico o profesional.',
			'termOfService.termsOfService.section1Title' => '1. ALCANCE DEL SERVICIO',
			'termOfService.termsOfService.section1Body' => 'ChatFace ofrece experiencias de interacción por video impulsadas por IA:\n\n• Llamadas de video y conversaciones con IA.\n• Preferencias de interacción personalizadas.\n• Acceso al historial de interacciones y registros.\n\nLos servicios no constituyen opiniones oficiales ni garantías de asesoramiento profesional.',
			'termOfService.termsOfService.section2Title' => '2. CONDICIONES DE USO',
			'termOfService.termsOfService.section2Body' => '• Debes tener al menos 18 años (el acceso para menores de 18 está prohibido).\n• Debes proporcionar información de cuenta precisa.\n• La aplicación debe usarse solo para fines legales y personales.',
			'termOfService.termsOfService.section3Title' => '3. USOS PROHIBIDOS',
			'termOfService.termsOfService.section3Body' => 'Suplantación, discurso de odio, poner en riesgo la seguridad de menores, intentos de violar la seguridad y manipulación de sistemas de IA están estrictamente prohibidos.',
			'termOfService.termsOfService.section4Title' => '4. SUSCRIPCIONES Y PAGOS',
			'termOfService.termsOfService.section4Body' => 'Las funciones premium están sujetas a las políticas de App Store y Google Play. Las cancelaciones y reembolsos de suscripción se gestionan a través de las tiendas respectivas.',
			'termOfService.termsOfService.section5Title' => '5. DESCARGO DE RESPONSABILIDAD DEL CONTENIDO',
			'termOfService.termsOfService.section5Body' => 'El contenido es generado por IA y no reemplaza el asesoramiento profesional. ChatFace no garantiza la precisión o idoneidad para un propósito determinado.',
			'termOfService.termsOfService.section6Title' => '6. PROPIEDAD INTELECTUAL',
			'termOfService.termsOfService.section6Body' => 'Todo el contenido, incluido el diseño, el software y los algoritmos, pertenece a ChatFace. La reproducción o redistribución no autorizada está prohibida.',
			'termOfService.termsOfService.section7Title' => '7. LEGISLACIÓN APLICABLE',
			'termOfService.termsOfService.section7Body' => 'Estos Términos se rigen por las leyes de la República de Turquía. Los tribunales centrales de Estambul tendrán jurisdicción sobre las disputas.',
			'termOfService.termsOfService.section8Title' => '8. CONTACTO',
			'termOfService.termsOfService.section8Body' => '📩 Para consultas: support@fly-work.com',
			'termOfService.cookiePolicy.title' => 'Política de Cookies',
			'termOfService.cookiePolicy.lastUpdated' => 'Última actualización: 2026',
			'termOfService.cookiePolicy.intro' => 'Bienvenido a ChatFace. Utilizamos tecnologías digitales auxiliares para que tu experiencia de llamadas de video con IA sea más fluida, segura y personalizada.',
			'termOfService.cookiePolicy.important' => 'Esta política explica qué son las cookies, sus propósitos y cómo puedes gestionar tus preferencias.',
			'termOfService.cookiePolicy.section1Title' => '1. ¿QUÉ SON LAS COOKIES?',
			'termOfService.cookiePolicy.section1Body' => 'Las cookies son pequeños archivos de datos colocados en tu dispositivo. No te identifican directamente; actúan como notas digitales que recuerdan:\n• Configuraciones de llamada e idioma\n• Preferencias de sesión y rendimiento.',
			'termOfService.cookiePolicy.section2Title' => '2. ¿QUÉ TECNOLOGÍAS UTILIZAMOS?',
			'termOfService.cookiePolicy.section2Body' => 'Tecnologías estrictamente necesarias\nRequeridas para la gestión de sesiones y controles de seguridad. La aplicación puede no funcionar correctamente sin estos componentes.\n\nRendimiento y análisis\nNos ayuda a entender qué historias se leen y qué áreas necesitan mejoras. Los datos se evalúan de forma anónima.\n\nPersonalización\nRecuerda configuraciones como la preferencia de idioma y el nivel de lectura para ofrecer una experiencia personalizada.',
			'termOfService.cookiePolicy.section3Title' => '3. ¿POR QUÉ USAMOS ESTAS TECNOLOGÍAS?',
			'termOfService.cookiePolicy.section3Body' => '• Para asegurar que la aplicación funcione de forma segura y fluida.\n• Para hacer la experiencia de lectura más fluida.\n• Para recordar configuraciones repetitivas.\n• Para identificar funciones para desarrollos futuros.',
			'termOfService.cookiePolicy.section4Title' => '4. TECNOLOGÍAS DE TERCEROS',
			'termOfService.cookiePolicy.section4Body' => 'Algunas tecnologías pueden ser proporcionadas por proveedores de servicios técnicos y están sujetas a sus propias políticas. ChatFace prioriza la seguridad de los datos en estas alianzas.',
			'termOfService.cookiePolicy.section5Title' => '5. CONTROL Y GESTIÓN DE COOKIES',
			'termOfService.cookiePolicy.section5Body' => 'Los usuarios pueden limitar estas tecnologías a través de la configuración del dispositivo o de la aplicación. Desactivar tecnologías esenciales puede causar problemas como no poder iniciar llamadas de video.',
			'termOfService.cookiePolicy.section6Title' => '6. CONTACTO',
			'termOfService.cookiePolicy.section6Body' => '📩 Para consultas: support@fly-work.com',
			'cookies' => 'Política de Cookies',
			'privacy' => 'Política de Privacidad',
			'onboarding.step5.permissionRequired' => 'Permiso requerido',
			'onboarding.step5.notNow' => 'Ahora no',
			'onboarding.step5.openSettings' => 'Abrir ajustes',
			'onboarding.step5.title' => 'Permisos',
			'onboarding.step5.permission1' => 'Acceso a la cámara',
			'onboarding.step5.permission1Subtitle' => 'Permitir acceso a la cámara',
			'onboarding.step5.permission2' => 'Acceso al micrófono',
			'onboarding.step5.permission2Subtitle' => 'Permitir acceso al micrófono',
			'onboarding.step5.permission3' => 'Acceso a la ubicación',
			'onboarding.step5.permission3Subtitle' => 'Permitir acceso a la ubicación',
			'onboarding.step1.title' => '¿Cuál es tu nombre?',
			'onboarding.step1.subtitle' => 'Por favor ingresa tu nombre',
			'onboarding.step1.hint' => 'Nombre completo',
			'onboarding.step2.title' => '¿Cuál es tu edad?',
			'onboarding.step2.subtitle' => 'Debes tener al menos 18 años para registrarte.',
			'onboarding.step3.title' => '¿Cuál es tu género?',
			'onboarding.step3.subtitle' => 'Por favor selecciona tu género',
			'onboarding.step3.male' => 'Masculino',
			'onboarding.step3.female' => 'Femenino',
			'onboarding.step3.dontWantToMention' => 'No quiero mencionarlo.',
			'onboarding.step4.title' => 'Diviértete mientras \n te mantienes seguro',
			'onboarding.step4.entry1' => 'Mantenemos el orden',
			'onboarding.step4.subentry1' => 'Monitoreo de IA en tiempo real activo',
			'onboarding.step4.entry2' => 'Grabaciones de pantalla',
			'onboarding.step4.subentry2' => 'No grabación sin consentimiento',
			'onboarding.step4.entry3' => 'Soporte 24/7',
			'onboarding.step4.subentry3' => 'Las quejas se revisan en cualquier momento del día',
			'onboarding.step4.entry4' => 'Solo 18+',
			'onboarding.step4.subentry4' => 'No apto para menores',
			'onboarding.step4.communityRules' => 'Reglas de la comunidad',
			'onboarding.loading.titlePart1' => 'Tu cuenta personal está',
			'onboarding.loading.titlePart2' => 'siendo creada',
			'onboarding.loading.subtitle' => 'Por favor espera, tu perfil se está preparando.',
			'onboarding.allowAccess' => 'Permitir acceso',
			'onboarding.iUnderstand' => 'Entiendo',
			'pressBackAgainToExit' => 'Presiona atrás nuevamente para salir',
			'splash.screen1.title' => 'El nuevo rostro del \n chat por video con IA',
			'splash.screen1.description' => 'Enciende tu cámara y habla cara a cara con la IA. Experimenta una comunicación más natural que entiende expresiones faciales, tono de voz y contexto.',
			'splash.screen2.title' => 'Comunicación en tiempo real y natural',
			'splash.screen2.description' => 'No te limites al texto. Ten conversaciones más fluidas y humanas mediante videollamadas.',
			'auth.google' => 'Continuar con Google',
			'auth.facebook' => 'Continuar con Facebook',
			'auth.apple' => 'Continuar con Apple',
			'auth.guest' => 'Continuar como invitado',
			'auth.signInFailed' => ({required Object error}) => 'Error de inicio de sesión: ${error}',
			'home.seeAll' => 'Ver todo',
			'home.more' => 'Más',
			'home.online' => 'En línea',
			'home.offline' => 'Desconectado',
			'home.placeholders.fashionDesigner' => 'Diseñador de moda',
			'home.placeholders.comedian' => 'Comediante',
			'home.placeholders.influencer' => 'Influencer',
			'home.placeholders.teacher' => 'Profesor',
			'home.placeholders.friend' => 'Amigo',
			'characters.all' => 'Todo',
			'characters.favorites' => 'Favoritos',
			'characters.recent' => 'Recientes',
			'characters.characters' => 'Personajes',
			'characters.placeholderSubtitle' => 'Diseñador de producto que se centra en la simplicidad y la usabilidad.',
			'characters.characterDetails.videoCall' => 'Videollamada',
			'characters.characterDetails.message' => 'Mensaje',
			'characters.characterDetails.voiceCall' => 'Llamada de voz',
			'notifications.today' => 'Hoy',
			'notifications.yesterday' => 'Ayer',
			'notifications.weekAgo' => ({required Object week}) => 'hace ${week} semana(s)',
			'notifications.monthAgo' => ({required Object month}) => 'hace ${month} mes(es)',
			'notifications.yearAgo' => ({required Object year}) => 'hace ${year} año(s)',
			'notifications.noNotifications' => 'Aún no hay notificaciones.',
			'notifications.noNotificationsSubtitle' => 'No olvides volver a comprobar cuando recibas una notificación.',
			'notifications.allDeleted' => 'Todas las notificaciones se han eliminado correctamente',
			'videoChat.networkHiccup' => 'Problema de red detectado. Reconectando micro...',
			'videoChat.failedToUpdateFollow' => 'No se pudo actualizar el estado de seguimiento.',
			'videoChat.connecting' => 'Conectando...',
			'videoChat.callEnded' => 'Llamada finalizada',
			'videoChat.callFailed' => ({required Object error}) => 'Llamada fallida: ${error}',
			'videoChat.mute' => 'Silenciar',
			'videoChat.unmute' => 'Activar sonido',
			'videoChat.endCall' => 'Finalizar llamada',
			'videoChat.swipeToChat' => 'Desliza para chatear',
			'videoChat.male' => 'Masculino',
			'videoChat.female' => 'Femenino',
			'videoChat.country' => 'País',
			'videoChat.follow' => 'Seguir',
			'videoChat.unfollow' => 'Dejar de seguir',
			'videoChat.callEndedMessage' => 'La videollamada ha finalizado.',
			'videoChat.swipeForNewChat' => 'Desliza para un nuevo chat',
			'voiceChat.connecting' => 'Conectando...',
			'voiceChat.callEnded' => 'Llamada finalizada',
			'voiceChat.callFailed' => ({required Object error}) => 'Llamada fallida: ${error}',
			'voiceChat.calling' => 'Llamando...',
			'chat.message' => 'Mensaje',
			'chat.history' => 'Historial',
			'chat.readAloud' => 'Leer en voz alta',
			'chat.noMessages' => 'Aún no hay mensajes.',
			'chat.noMessagesSubtitle' => 'Comienza una conversación enviando un mensaje.',
			'chat.online' => 'En línea',
			'chat.offline' => 'Desconectado',
			'chat.gallery' => 'Galería',
			'chat.camera' => 'Cámara',
			'chat.typeAMessage' => 'Escribe un mensaje...',
			'chat.pleaseUpgrade' => 'Por favor actualiza a la versión pro.',
			'chat.photo' => 'Photo',
			'chat.photoUploadFailed' => 'Couldn\'t upload photo. Please try again.',
			'chat.tapToViewPhoto' => 'Tap to view photo',
			'chat.voiceCallEnded' => 'Llamada de voz finalizada',
			'chat.videoCallEnded' => 'Videollamada finalizada',
			'chat.uploadingPhoto' => 'Uploading photo...',
			'chat.mediaPermissionDenied' => 'Allow camera or photo permissions to share images.',
			'editProfile.aboutMe' => 'Sobre mí',
			'editProfile.aboutMeHint' => 'Escribe algo sobre ti',
			'editProfile.fullName' => 'Nombre completo',
			'editProfile.gender' => 'Género',
			'editProfile.male' => 'Masculino',
			'editProfile.female' => 'Femenino',
			'editProfile.dontWantToMention' => 'No quiero mencionarlo.',
			'editProfile.country' => 'País',
			'editProfile.languagePreferences' => 'Preferencias de idioma',
			'editProfile.selectLanguage' => 'Agrega tu idioma preferido',
			'editProfile.saved' => 'Guardado',
			'editProfile.changesSaved' => 'Los cambios se han guardado.',
			'settingsSupport.title' => 'Configuración y soporte',
			'settingsSupport.premiumTitle' => 'Acceso ilimitado a \ntodas las funciones',
			'settingsSupport.getPremium' => 'Obtener Premium',
			'settingsSupport.settingsHub' => 'Centro de configuración',
			'settingsSupport.shareTheApp' => 'Compartir la app',
			'settingsSupport.rateUs' => 'Califícanos',
			'settingsSupport.version' => 'Versión',
			'settingsSupport.notifications' => 'Notificaciones',
			'settingsSupport.accountManagement' => 'Gestión de la cuenta',
			'settingsSupport.deleteAccount' => 'Eliminar cuenta',
			'settingsSupport.logOut' => 'Cerrar sesión',
			'settingsSupport.logOutTitle' => 'Estás a punto de cerrar sesión',
			'settingsSupport.logOutSubtitle' => '¡Nos vemos pronto! \n Te echaremos de menos.',
			'deleteAccount.title' => 'Eliminar cuenta',
			'deleteAccount.warning' => '¿Estás seguro de que deseas eliminar tu cuenta?',
			'deleteAccount.description' => 'Esta acción no se puede deshacer y todo tu historial y datos se eliminarán de forma permanente.',
			'deleteAccount.deleteFailed' => ({required Object error}) => 'Error al eliminar la cuenta: ${error}',
			'deleteAccount.steps.step1.title' => 'No queremos que te vayas, pero lo entendemos.',
			'deleteAccount.steps.step1.subtitle' => '¿Puedes decirnos por qué quieres irte para que podamos mejorar la experiencia de ChatFace?',
			'deleteAccount.steps.step1.option1' => 'No encontré realistas los personajes de IA.',
			'deleteAccount.steps.step1.option2' => 'Experimento problemas técnicos en los chats de video.',
			'deleteAccount.steps.step1.option3' => 'Los precios de suscripción superan mis expectativas.',
			'deleteAccount.steps.step1.option4' => 'No encontré el tipo de personajes que buscaba.',
			'deleteAccount.steps.step1.option5' => 'Solo quería probarlo por un corto tiempo.',
			'deleteAccount.steps.step1.option6' => 'Otro',
			'deleteAccount.steps.step2.title' => 'Si eliminas tu cuenta, dirás adiós a:',
			'deleteAccount.steps.step2.subtitle1' => 'Conexiones profundas y memoria:',
			'deleteAccount.steps.step2.subtitle1Desc' => 'Los personajes con los que chateas olvidarán completamente tu pasado con ellos, tus secretos compartidos y tus hábitos.',
			'deleteAccount.steps.step2.subtitle2' => 'Privilegio de videollamada:',
			'deleteAccount.steps.step2.subtitle2Desc' => 'Perderás el derecho a comunicarte cara a cara con tus socios de IA.',
			'deleteAccount.steps.step2.subtitle3' => 'Algoritmo avanzado:',
			'deleteAccount.steps.step2.subtitle3Desc' => 'Se restablecerán las coincidencias de personajes \'Solo para ti\'.',
			'deleteAccount.steps.step2.subtitle4' => 'Datos de perfil:',
			'deleteAccount.steps.step2.subtitle4Desc' => 'Tus logros, personajes especiales y el historial de chat se eliminarán irreversiblemente.',
			'deleteAccount.steps.step3.title' => '¡Tenemos una oferta especial para ti antes de que te vayas!',
			'deleteAccount.steps.step3.description' => 'Tal vez solo necesites un poco más de tiempo o una mejor oferta. En lugar de eliminar tu cuenta, ¿considerarías esto?',
			'deleteAccount.steps.step3.description1' => ({required Object offer}) => 'Mantenerte con nosotros es valioso. ¡${offer} en tu próxima suscripción! ¿Te gustaría continuar con esta oferta?',
			'deleteAccount.steps.step3.description1Offer' => 'Hemos aplicado un 50% de descuento',
			'deleteAccount.steps.step3.description2' => ({required Object offer}) => 'Te hemos dado ${offer} créditos para que descubras nuevos personajes.',
			'deleteAccount.steps.step3.description2Offer' => '3 videollamadas gratis',
			'deleteAccount.steps.step3.acceptOffer' => 'Aceptar oferta del 50% de descuento',
			'deleteAccount.steps.step3.deleteMyAccount' => 'Eliminar mi cuenta',
			'cancel' => 'Cancelar',
			'delete' => 'Eliminar',
			'premium' => 'Premium',
			'profileEdit' => 'Editar perfil',
			'settings' => 'Configuración',
			'undo' => 'Deshacer',
			'successfully' => 'Con éxito',
			'save' => 'Guardar',
			'languageOptions.english' => 'Inglés',
			'languageOptions.chinese' => 'Chino',
			'languageOptions.german' => 'Alemán',
			'languageOptions.italian' => 'Italiano',
			'languageOptions.french' => 'Francés',
			'languageOptions.japanese' => 'Japonés',
			'languageOptions.spanish' => 'Español',
			'languageOptions.russian' => 'Ruso',
			'languageOptions.turkish' => 'Turco',
			'languageOptions.korean' => 'Coreano',
			'languageOptions.hindi' => 'Hindi',
			'languageOptions.portuguese' => 'Portugués',
			'common.tryAgain' => 'Intentar de nuevo',
			'common.retry' => 'Reintentar',
			'common.close' => 'Cerrar',
			'permissionsRequired' => 'Permisos requeridos',
			'permissionHelper.camAndMicRequired' => 'Se requieren permisos de cámara y micrófono para videollamadas. Por favor actívalos en configuración.',
			'permissionHelper.micRequired' => 'Se requiere permiso de micrófono para llamadas de voz. Por favor actívalo en configuración.',
			'permissionHelper.cancel' => 'Cancelar',
			'permissionHelper.openSettings' => 'Abrir ajustes',
			'videoView.title' => 'Filtros de cámara',
			'videoView.subtitle' => 'Elige el aspecto para la vista previa de tu cámara.',
			'videoView.errorLoad' => 'Error al cargar los compañeros: ',
			'videoView.noComps' => 'Aún no hay compañeros disponibles.',
			'videoView.filters.ORIGINAL' => 'Original',
			'videoView.filters.ADDICTIVE_BLUE' => 'Azul Adictivo',
			'videoView.filters.ADDICTIVE_RED' => 'Rojo Adictivo',
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
			'videoView.saveFilter' => 'Guardar Filtro',
			_ => null,
		};
	}
}
