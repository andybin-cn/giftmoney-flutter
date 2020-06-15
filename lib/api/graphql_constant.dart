

class GraphqlConstant {
  static const String loginQL = r'''
    mutation login($author: AuthorAnonymous!) {
      loginAnonymous(author: $author) {
        token
        user {
          id
          anonymous_uuid
        }
      }
    }
  ''';

  static const String matchInviteCodeQL = r'''
    query authorAndMatchInviteCode($author: AuthorAnonymous!, $fingerprint: ShareFingerprint!) {
      authorAndMatchInviteCode(author: $author, fingerprint: $fingerprint) {
        fingerResult: {
          id
          inviteCode
        }
      }
    }
  ''';
}