// ignore_for_file: avoid_print

import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:http/http.dart' as http;

class Oauth2ClientExample {
  fetchFiles() async {
    OAuth2Client client = OAuth2Client(
        tokenUrl: 'https://staging.mkad.my/tokens',
        authorizeUrl: 'https://staging.mkad.my',
        redirectUri: 'my.test.app://oauth2redirect',
        customUriScheme: 'my.test.app',
        credentialsLocation: CredentialsLocation.header);
    // var hlp = OAuth2Helper(client,
    //     grantType: OAuth2Helper.authorizationCode,
    // clientId: '9752f205-798a-44b0-87ab-9ad14b509223',
    // clientSecret: 'sXtrnKIlqeTPb2DEdCZb4tJ7m36HQjka13gfWjuk',
    //     scopes: [
    //       'profile'
    //     ],
    // accessTokenHeaders: {
    //   'Accept': 'application/json',
    // });
    final bos = client.getTokenWithAuthCodeFlow(
        clientId: '9752f205-798a-44b0-87ab-9ad14b509223',
        clientSecret: 'sXtrnKIlqeTPb2DEdCZb4tJ7m36HQjka13gfWjuk',
        accessTokenHeaders: {
          'Accept': 'application/json',
        });

    print('hello $bos');

    var resp =
        await http.get(Uri.parse('https://staging.mkad.my/profile'), headers: {
      'Accept': 'application/json',
    });

    print(resp.body);
  }
}
