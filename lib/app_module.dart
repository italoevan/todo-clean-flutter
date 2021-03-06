import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/external/app_database_impl.dart';
import 'modules/home/external/todo_dao_impl.dart';
import 'modules/home/infra/repositories/home_repository_impl.dart';
import 'core/values/app_routes.dart';
import 'modules/home/domain/usecases/crud_usecase.dart';

import 'modules/home/presenter/home_controller.dart';
import 'modules/home/presenter/home_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(Modular.get())),
        Bind((i) => AppDatabaseImpl()),
        Bind((i) => TodoDaoImpl(Modular.get())),
        Bind((i) => CrudImplementation(Modular.get<HomeRepositoryImpl>())),
        Bind((i) => HomeRepositoryImpl(Modular.get()))
      ];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        AppRoutes.home,
        child: (_, args) => const HomeScreen(),
      )
    ];
  }
}
