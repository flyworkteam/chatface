enum UrlType { profilePicture, aiProfilePicture, aiRiveAnimation, chatImages }

extension UrlTypeExtension on UrlType {
  String get baseUrl {
    switch (this) {
      case UrlType.profilePicture:
        return 'https://chatface.b-cdn.net/user/';
      case UrlType.aiProfilePicture:
        return 'https://chatface.b-cdn.net/personas/images/';
      case UrlType.aiRiveAnimation:
        return 'https://chatface.b-cdn.net/personas/animations/';
      case UrlType.chatImages:
        return 'https://chatface.b-cdn.net/uploads/chat_images/';
    }
  }
}
