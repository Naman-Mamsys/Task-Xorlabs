import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/environment/env.dart';
import '../models/customer_model.dart';
import '../models/partner_model.dart';

class ApiService {
  static Future<List<CustomerModel>> fetchCustomers() async {
    final res = await http.get(Uri.parse(Env.customerApi));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => CustomerModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  static Future<List<PartnerModel>> fetchPartners() async {
    final res = await http.get(Uri.parse(Env.partnerApi));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => PartnerModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load partners');
    }
  }
}
