
import 'package:baby_land_park/model/dashboard_model.dart';
import 'package:baby_land_park/repository/dashboard_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final repository = DashboardRepository();
  final dashboard = DashboardModel().obs;
  final loading = false.obs;

  void setLoading (bool value){
    loading.value = value;
  }

  void setData (DashboardModel value){
    dashboard.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getBrand();
  }

  Future getBrand() async {
    setLoading(true);
    repository.getDashboard().then((value) {
      setData(value);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}