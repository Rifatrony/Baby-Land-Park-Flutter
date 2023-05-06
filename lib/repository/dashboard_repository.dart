import 'package:baby_land_park/model/dashboard_model.dart';
import 'package:baby_land_park/res/AppUrl.dart';
import 'package:baby_land_park/services/NetworkApiServices.dart';

class DashboardRepository {
  final apiServices = NetworkApiServices();
  Future<DashboardModel> getDashboard() async {
    dynamic response  = await apiServices.getApi(AppUrl.dashboardUrl);
    return DashboardModel.fromJson(response);
  }
}