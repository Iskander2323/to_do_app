import 'package:go_router/go_router.dart';
import 'package:to_do_app/components/ui/home_page.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomePage(),)
  ]);
