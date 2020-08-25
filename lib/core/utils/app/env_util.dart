import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Map<String, String>> loadEnvFile() async {
  DotEnv instance = DotEnv();
  await instance.load("assets/env/.env");
  return instance.env;
}
