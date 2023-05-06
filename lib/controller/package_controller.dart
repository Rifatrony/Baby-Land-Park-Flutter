
import 'package:baby_land_park/model/package_model.dart';
import 'package:baby_land_park/repository/package_repository.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  final repository = PackageRepository();
  final package = PackageModel().obs;
  final loading = false.obs;

  void setLoading (bool value){
    loading.value = value;
  }

  void setData (PackageModel value){
    package.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getPackage();
  }

  Future getPackage() async {
    setLoading(true);
    repository.getPackage().then((value) {
      setData(value);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}