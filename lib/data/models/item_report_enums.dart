enum ReportType {
  lost,
  found,
}

enum ReportStatus {
  open,
  possibleMatch,
  claimed,
  resolved,
  archived,
}

enum ItemCategory {
  electronics,
  documents,
  clothing,
  bags,
  keys,
  books,
  accessories,
  other,
}

extension ReportTypeLabel on ReportType {
  String get label {
    switch (this) {
      case ReportType.lost:
        return 'Lost';
      case ReportType.found:
        return 'Found';
    }
  }
}

extension ReportStatusLabel on ReportStatus {
  String get label {
    switch (this) {
      case ReportStatus.open:
        return 'Open';
      case ReportStatus.possibleMatch:
        return 'Possible Match';
      case ReportStatus.claimed:
        return 'Claimed';
      case ReportStatus.resolved:
        return 'Resolved';
      case ReportStatus.archived:
        return 'Archived';
    }
  }
}

extension ItemCategoryLabel on ItemCategory {
  String get label {
    switch (this) {
      case ItemCategory.electronics:
        return 'Electronics';
      case ItemCategory.documents:
        return 'Documents';
      case ItemCategory.clothing:
        return 'Clothing';
      case ItemCategory.bags:
        return 'Bags';
      case ItemCategory.keys:
        return 'Keys';
      case ItemCategory.books:
        return 'Books';
      case ItemCategory.accessories:
        return 'Accessories';
      case ItemCategory.other:
        return 'Other';
    }
  }
}

ReportType reportTypeFromName(String? name) {
  return ReportType.values.firstWhere(
    (type) => type.name == name,
    orElse: () => ReportType.lost,
  );
}

ReportStatus reportStatusFromName(String? name) {
  return ReportStatus.values.firstWhere(
    (status) => status.name == name,
    orElse: () => ReportStatus.open,
  );
}

ItemCategory itemCategoryFromName(String? name) {
  return ItemCategory.values.firstWhere(
    (category) => category.name == name,
    orElse: () => ItemCategory.other,
  );
}