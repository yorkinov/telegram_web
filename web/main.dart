import 'dart:html';
import 'dart:convert';

void main() {
  // Access Telegram WebApp object
  final webApp = window.navigator.userAgent.contains("Telegram")
      ? window.document.querySelector('script[src*="telegram-web-app.js"]')
      : null;

  if (webApp != null) {
    // Extract Telegram Web App data
    final data = window.navigator.userAgent.contains("Telegram")
        ? jsonDecode(window.localStorage["initData"] ?? "{}")
        : {};

    querySelector('body')
        ?.appendHtml('<h1>Hello, ${data["user"]["first_name"]}</h1>');
  } else {
    querySelector('body')?.appendHtml('<h1>Not in Telegram</h1>');
  }
}
