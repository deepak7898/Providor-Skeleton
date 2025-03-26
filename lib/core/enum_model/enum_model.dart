enum UserRole {
  admin,
  publisher,
  depot,
  district,
  block,
  cluster,
}
enum UserRoleComparison {
  admin('Admin'),
  publisher('Publisher'),
  depot('Depot'),
  district('District'),
  block('Block'),
  cluster('Cluster');

  final String value;
  const UserRoleComparison(this.value);
}

extension UserRoleExtension on UserRole {
  static UserRole fromInt(int value) {
    switch (value) {
      case 1:
        return UserRole.admin;
      case 2:return UserRole.publisher;
      case 3:return UserRole.depot;
      case 4:return UserRole.district;
      case 5:return UserRole.block;

      default:
        return UserRole.cluster;
    }
  }

  String get roleName {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.publisher:
        return 'Publisher';
      case UserRole.depot:
        return 'Depot';
      case UserRole.district:
        return 'District';
      case UserRole.block:
        return 'Block';

      default:
        return 'Cluster';
    }
  }
}

enum ApprovedAndReject {
  approved('Approved'),
  rejected('Rejected');
  final String value;
  const ApprovedAndReject(this.value);
}