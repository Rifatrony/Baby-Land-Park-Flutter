import 'package:baby_land_park/model/sell_report_model.dart';
import 'package:baby_land_park/res/AppUrl.dart';
import 'package:baby_land_park/services/NetworkApiServices.dart';

class SaleRepository {
  final apiServices = NetworkApiServices();
  Future<SellReportModel> getSaleReport() async{
    dynamic response = await apiServices.getApi(AppUrl.sellReportUrl);
    return SellReportModel.fromJson(response);
  }

  Future<dynamic> saleTicket(var data) async{
    dynamic response = await apiServices.postApi(data, AppUrl.sellTicketUrl);
    return response;
  }
}