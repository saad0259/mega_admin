import 'package:flutter/cupertino.dart';

import '../model/navigator_model.dart';
import '../view/admins/admin_list_screen.dart';

class NavState extends ChangeNotifier {
  static final defaultNav = NavigatorModel(
    // 'Dashboard',
    // const AdminDashboardView(),
    'Admins',
    const AdminListScreen(),
  );

  NavigatorModel active = defaultNav;
  List<NavigatorModel> navigationStack = [defaultNav];

  void activate(NavigatorModel model, {bool root = true}) {
    if (root) {
      navigationStack.removeLast();
      navigationStack.add(model);
    } else {
      navigationStack.add(model);
    }
    active = model;
    notifyListeners();
  }

  void pop() {
    if (navigationStack.isNotEmpty) {
      navigationStack.removeLast();
      if (navigationStack.isNotEmpty) {
        active = navigationStack.last;
      } else {
        active = defaultNav;
      }
    }
    notifyListeners();
  }

  bool canPop() {
    return navigationStack.length > 1;
  }
}
