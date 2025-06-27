import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/profile_row.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;
    final maxContentWidth = screenWidth > 800 ? 700.0 : screenWidth;

    return Scaffold(
      appBar: AppBar(title: const Text('Customer & Partner Tables')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: maxContentWidth,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Customers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: controller.fetchCustomers,
                      )
                    ],
                  ),
                  Obx(() => controller.loadingCustomers.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.customers.length,
                      itemBuilder: (_, i) {
                        final c = controller.customers[i];
                        return ProfileRow(
                          name: c.name,
                          detail: c.mobileNumber,
                          onDelete: () => controller.deleteCustomer(i),
                          label: 'Number',
                        );
                      })),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Partners', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: controller.fetchPartners,
                      )
                    ],
                  ),
                  Obx(() => controller.loadingPartners.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.partners.length,
                      itemBuilder: (_, i) {
                        final p = controller.partners[i];
                        return ProfileRow(
                          name: p.partnerName,
                          detail: p.emailAddress,
                          onDelete: () => controller.deletePartner(i),
                          label: 'Email',
                        );
                      })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
