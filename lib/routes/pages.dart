// TODO: Uncomment code di bawah ini untuk mengimport file HelloView
// import 'package:devcode_flutter_starter/modules/hello/hello_view.dart';
import 'package:devcode_flutter_starter/modules/home/home_view.dart';
import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
    ),
    // TODO: Uncomment code di bawah ini untuk menambahkan route [HelloView]
    // GetPage(
    //   name: Routes.hello,
    //   page: () => const HelloView(),
    // ),
  ];
}
