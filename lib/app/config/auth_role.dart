enum AuthRole {
  auth,
  unAuth,
  guest,
}

extension AuthRoleExtension on AuthRole {
  int get name {
    switch (this) {
      case AuthRole.auth:
        return 1;
      case AuthRole.unAuth:
        return 2;
      case AuthRole.guest:
        return 3;
    }
  }
}
