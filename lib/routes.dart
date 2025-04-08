import 'package:go_router/go_router.dart';
import 'package:to_do_app/components/ui/home_page.dart';
import 'package:to_do_app/components/ui/to_do_form_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => HomePage(), routes: [
    GoRoute(
      path: '/to_do_form_page',
      name: 'to_do_form_page',
      builder: (context, state) => ToDoFormPage(),
    )
  ])
]);
