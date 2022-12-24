import "package:injectable/injectable.dart";
import "package:raw/app/router/router.dart";

@lazySingleton
class RouterService {
  final RawRouter router = RawRouter();
}
