import 'package:get/get.dart';
import '../../models/customer_model.dart';
import '../../models/partner_model.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  var customers = <CustomerModel>[].obs;
  var partners = <PartnerModel>[].obs;

  var loadingCustomers = false.obs;
  var loadingPartners = false.obs;

  @override
  void onInit() {
    fetchCustomers();
    fetchPartners();
    super.onInit();
  }

  void fetchCustomers() async {
    loadingCustomers.value = true;
    try {
      final result = await ApiService.fetchCustomers();
      customers.assignAll(result);
    } catch (_) {}
    loadingCustomers.value = false;
  }

  void fetchPartners() async {
    loadingPartners.value = true;
    try {
      final result = await ApiService.fetchPartners();
      partners.assignAll(result);
    } catch (_) {}
    loadingPartners.value = false;
  }

  void deleteCustomer(int index) => customers.removeAt(index);
  void deletePartner(int index) => partners.removeAt(index);
}
