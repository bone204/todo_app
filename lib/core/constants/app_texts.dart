enum AppText {
  textHello
}

Map<AppText, String> texts = {
  AppText.textHello: "Todo App",
};

extension AppTexts on AppText {
  static getStringValue(String value) {
    return value;
  }

  String get text => texts[this] ?? '--TextNotFound--'; 
}