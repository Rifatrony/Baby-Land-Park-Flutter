import 'package:baby_land_park/model/package_model.dart';
import 'package:baby_land_park/res/AppUrl.dart';
import 'package:baby_land_park/services/NetworkApiServices.dart';

class PackageRepository {
  final apiServices = NetworkApiServices();
  Future<PackageModel> getPackage() async {
    dynamic response  = await apiServices.getApi(AppUrl.packageUrl);
    return PackageModel.fromJson(response);
  }
}