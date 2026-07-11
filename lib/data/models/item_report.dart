import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_report_enums.dart';

class ItemReport {
  const ItemReport({
    required this.id,
    required this.title,
    required this.description,
    required this.reportType,
    required this.category,
    required this.color,
    required this.locationText,
    required this.incidentDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.contactInfo,
    this.ownerId,
    this.imageUrls = const [],
  });

  final String id;
  final String title;
  final String description;
  final ReportType reportType;
  final ItemCategory category;
  final String color;
  final String locationText;
  final DateTime incidentDate;
  final String? contactInfo;
  final ReportStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? ownerId;
  final List<String> imageUrls;

  factory ItemReport.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};

    return ItemReport.fromMap(
      id: doc.id,
      data: data,
    );
  }

  factory ItemReport.fromMap({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return ItemReport(
      id: id,
      title: (data['title'] as String?)?.trim() ?? '',
      description: (data['description'] as String?)?.trim() ?? '',
      reportType: reportTypeFromName(data['reportType'] as String?),
      category: itemCategoryFromName(data['category'] as String?),
      color: (data['color'] as String?)?.trim() ?? '',
      locationText: (data['locationText'] as String?)?.trim() ?? '',
      incidentDate: _dateTimeFromValue(data['incidentDate']),
      contactInfo: data['contactInfo'] as String?,
      status: reportStatusFromName(data['status'] as String?),
      createdAt: _dateTimeFromValue(data['createdAt']),
      updatedAt: _dateTimeFromValue(data['updatedAt']),
      ownerId: data['ownerId'] as String?,
      imageUrls: _stringListFromValue(data['imageUrls']),
    );
  }

  Map<String, dynamic> toFirestore({
    bool isCreate = false,
  }) {
    return {
      'title': title.trim(),
      'description': description.trim(),
      'reportType': reportType.name,
      'category': category.name,
      'color': color.trim(),
      'locationText': locationText.trim(),
      'incidentDate': Timestamp.fromDate(incidentDate),
      'contactInfo': _nullableTrim(contactInfo),
      'status': status.name,
      'ownerId': ownerId,
      'imageUrls': imageUrls,
      'createdAt': isCreate
          ? FieldValue.serverTimestamp()
          : Timestamp.fromDate(createdAt),
      'updatedAt': isCreate
          ? FieldValue.serverTimestamp()
          : Timestamp.fromDate(updatedAt),
    };
  }

  ItemReport copyWith({
    String? id,
    String? title,
    String? description,
    ReportType? reportType,
    ItemCategory? category,
    String? color,
    String? locationText,
    DateTime? incidentDate,
    String? contactInfo,
    ReportStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ownerId,
    List<String>? imageUrls,
  }) {
    return ItemReport(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      reportType: reportType ?? this.reportType,
      category: category ?? this.category,
      color: color ?? this.color,
      locationText: locationText ?? this.locationText,
      incidentDate: incidentDate ?? this.incidentDate,
      contactInfo: contactInfo ?? this.contactInfo,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ownerId: ownerId ?? this.ownerId,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}

DateTime _dateTimeFromValue(dynamic value) {
  if (value is Timestamp) {
    return value.toDate();
  }

  if (value is DateTime) {
    return value;
  }

  return DateTime.now();
}

List<String> _stringListFromValue(dynamic value) {
  if (value is List) {
    return value.whereType<String>().toList();
  }

  return const <String>[];
}

String? _nullableTrim(String? value) {
  final trimmed = value?.trim();

  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}