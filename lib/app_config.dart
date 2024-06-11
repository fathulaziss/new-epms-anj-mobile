import 'package:epms/enum.dart';

class AppConfig {
  static const _urlDevelopment =
      'http://10.10.10.91/inspection/public/index.php/api/v1/';
  static const _urlProduction =
      'https://inspection.anj-group.co.id/public/index.php/api/v1/';

  static late Flavor appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return _urlDevelopment;

      case Flavor.production:
        return _urlProduction;
    }
  }

  static String get environmentType {
    switch (appFlavor) {
      case Flavor.development:
        return 'Development';

      case Flavor.production:
        return 'Production';
    }
  }

  static String get appName {
    switch (appFlavor) {
      case Flavor.development:
        return 'EPMS Dev';

      case Flavor.production:
        return 'EPMS';
    }
  }

  static String get firebaseTopic {
    switch (appFlavor) {
      case Flavor.development:
        return 'development';

      case Flavor.production:
        return 'production';
    }
  }
}
