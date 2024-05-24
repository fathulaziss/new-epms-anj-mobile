import 'package:epms/model/ticket_inspection_data_model.dart';

class MyInspectionResponse {
  const MyInspectionResponse({
    this.success = false,
    this.message = '',
    this.data = const TicketInspectionDataModel(),
  });

  factory MyInspectionResponse.fromJson(Map<String, dynamic> json) =>
      MyInspectionResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? '',
        data: json['data'] != null
            ? TicketInspectionDataModel.fromJson(json['data'])
            : const TicketInspectionDataModel(),
      );

  final bool success;
  final String message;
  final TicketInspectionDataModel data;

  Map<String, dynamic> toJson() {
    final tempData = <String, dynamic>{};

    tempData['success'] = success;
    tempData['message'] = message;
    tempData['data'] = data.toJson();

    return tempData;
  }

  @override
  String toString() {
    return 'MyInspectionResponse(success: $success, message: $message, data: $data)';
  }
}
