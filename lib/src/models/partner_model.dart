class PartnerModel {
  final String partnerName;
  final String emailAddress;

  PartnerModel({required this.partnerName, required this.emailAddress});

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      partnerName: json['partner_name'],
      emailAddress: json['email_address'],
    );
  }
}
