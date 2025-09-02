import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductFilterController extends GetxController {
  RxString selectedFilter = 'All'.obs;
  RxBool showAllFilters = false.obs;

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void toggleShowAll() {
    showAllFilters.value = !showAllFilters.value;
  }
}
