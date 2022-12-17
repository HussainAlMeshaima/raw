import 'package:auto_route/auto_route.dart';

import 'package:raw/ui/views/home/home_view.dart';
import 'package:raw/ui/views/startup/startup_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
  ],
)
class $RawRouter {}