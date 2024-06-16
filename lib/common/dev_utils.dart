import 'dart:io';

class DevUtils {
  DevUtils._();

  static Directory get executableDir =>
      File(Platform.resolvedExecutable).parent;

  static String env = "${DevUtils.executableDir.path}/env.json";
  static String prompt = "${DevUtils.executableDir.path}/prompts.json";
  static String plot = "${DevUtils.executableDir.path}/plot.json";
  static String achievements =
      "${DevUtils.executableDir.path}/achievements.json";
  static String roleQuiz = "${DevUtils.executableDir.path}/role_quiz.json";
}
