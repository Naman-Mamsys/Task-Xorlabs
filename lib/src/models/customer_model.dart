class CustomerModel {
  final String name;
  final String mobileNumber;

  CustomerModel({required this.name, required this.mobileNumber});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['name'],
      mobileNumber: json['mobile_number'],
    );
  }
}
