

class GraphqlConstant {
  static const String loginQL = r'''
    mutation login($author: AuthorAnonymous!) {
      loginAnonymous(author: $author) {
        id
        anonymous_uuid
      }
    }
  ''';

  static const String matchInviteCodeQL = r'''
    query matchInviteCode($fingerprint: ShareFingerprint!) {
      matchInviteCode(fingerprint: $fingerprint) {
        id
        inviteCode
      }
    }
  ''';
}