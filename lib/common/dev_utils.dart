import 'dart:io';

class DevUtils {
  DevUtils._();

  static Directory get executableDir =>
      File(Platform.resolvedExecutable).parent;

  static String env = "${DevUtils.executableDir.path}/env.json";
  static String prompt = "${DevUtils.executableDir.path}/prompts.json";
}
