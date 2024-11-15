import 'dart:convert';

import 'package:http/http.dart' as http;

void registerWebApp() async {
  final token = '6334024661:AAFsKtxkool7AmLtZbnnD1chmuO8jy6rRYg';
  final response = await http.post(
    Uri.parse('https://api.telegram.org/bot$token/setMyCommands'),
    body: {
      "commands": jsonEncode([
        {
          "command": "start",
          "description": "Launch Web App",
          "web_app": {"url": "https://yorkinov.github.io/telegram_web/"}
        }
      ])
    },
  );

  if (response.statusCode == 200) {
    print('Web App registered successfully!');
  } else {
    print('Failed to register: ${response.body}');
  }
}

void main() {
  registerWebApp();
}
