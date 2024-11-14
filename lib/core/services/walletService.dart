// import 'package:wallet_connect_v2/wallet_connect_v2.dart';

// import 'package:walletconnect_flutter_v2/apis/core/pairing/utils/pairing_models.dart';
// import 'package:walletconnect_flutter_v2/apis/web3app/web3app.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web3modal_flutter/web3modal_flutter.dart';
// import 'package:walletconnect_flutter/walletconnect_flutter.dart';
import 'dart:collection';
import 'dart:io';

import "package:walletconnect_dart/walletconnect_dart.dart";
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class WalletService {
//   final _client = WalletConnectV2();
// final _walletMetadata = AppMetadata(
//       name: 'Cineplex',
//       url: 'https://avacus.cc',
//       description: 'Web Wallet By Cineplex',
//       icons: ['https://avacus.cc/apple-icon-180x180.png'],
//       redirect: 'wcexample');

  Future<void> initPlatformState() async {
    final themeMap = HashMap<String, String>();
    themeMap['primary'] = "#fff000";

    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse(
        'torusapp://org.torusresearch.flutter.web3authexample/auth',
      );
    } else if (Platform.isIOS) {
      redirectUrl =
          Uri.parse('torusapp://org.torusresearch.flutter.web3authexample');
    } else {
      throw UnKnownException('Unknown platform');
    }

    await Web3AuthFlutter.init(
      Web3AuthOptions(
        clientId:
            'BFbp16SNn6vYMccZ7fp7RcSekeKPZge9EwU7VZJGcqBU93wvflfOxwVlyuHYZ_xEPgIvv-FdtfltRcFCuWX9c6c',
        network: Network.mainnet,
        buildEnv: BuildEnv.testing,
        redirectUrl: redirectUrl,
        whiteLabel: WhiteLabelData(
          mode: ThemeModes.dark,
          appName: "Cinflix",
          theme: themeMap,
        ),
      ),
    );

    // Call initialize() function to get privKey and user information without relogging in user if a user has an active session
    await Web3AuthFlutter.initialize();

    // Call getPrivKey() function to get user private key
    final String privKey = await Web3AuthFlutter.getPrivKey();

    // Call getEd25519PrivKey() function to get user ed25519 private key
    final String ed255199PrivKey = await Web3AuthFlutter.getEd25519PrivKey();

    // Call getUserInfo() function to get user information like name, email, verifier, verifierId etc.
    final TorusUserInfo userInfo = await Web3AuthFlutter.getUserInfo();

    await Web3AuthFlutter.login(LoginParams(loginProvider: Provider.google));
  }

  initConnetion() async {
    await initPlatformState();
//     final connector = WalletConnect(
//       bridge: 'https://bridge.walletconnect.org',
//       clientMeta: PeerMeta(
//         name: 'INRx',
//         description: 'WalletConnect Developer App',
//         url: 'https://walletconnect.org',
//         icons: [
//           'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
//         ],
//       ),
//     );

// // Subscribe to events
//     connector.on('connect', (session) => print("onConnect $session"));
//     connector.on('session_update', (payload) => print("payload $payload"));
//     connector.on('disconnect', (session) => print("disconnect $session"));

// // Create a new session
//     if (!connector.connected) {
//       final session = await connector.createSession(
//         chainId: 4160,
//         onDisplayUri: (uri) => print(uri),
//       );
//     }
    // await  _client.init(projectId: "c59658b5ccd4c48cb52666f418dfa9af", appMetadata: _walletMetadata);
    //  W3MService _w3mService; = W3MService(
    //     projectId: '20c4f9fd292a069e1bfe3023722b7b8b',
    //     metadata: const PairingMetadata(
    //       name: 'DeChat Web3 Modal',
    //       description: 'Connect Wallet with DeChat',
    //       url: 'https://www.walletconnect.com/',
    //       icons: ['https://web3modal.com/images/rpc-illustration.png'],
    //       redirect: Redirect(
    //         native: 'flutterdapp://',
    //         universal: 'https://www.walletconnect.com',
    //       ),
    //     ),
    //   );
    //   await _w3mService.init(); //changed

    //   _w3mService.addListener(_serviceListener);
    //   _w3mService.web3App?.onSessionEvent.subscribe(_onSessionEvent);
    //   _w3mService.web3App?.onSessionConnect.subscribe(_onSessionConnect);
    //   _w3mService.web3App?.onSessionDelete.subscribe(_onSessionDelete);
    // }
    //  connectWallet(context) async {
    //   try {
    //     var d = _w3mService.isInitialized;
    //     debugPrint('is_initialized: $d');
    //     setState(() {
    //       loading = true;
    //     });
    //     if (d) {
    //       if (isConnected) {
    //         // _w3mService.disconnect();
    //         // setState(() {
    //         // isConnected = false;
    //         // walletAddress = null;
    //         // });
    //         try {
    //           handleSignIn(walletAddress);
    //         } catch (e, s) {
    //           print("error $e $s");
    //         }
    //       } else {
    //         _w3mService.open(context: context).then((dynamic value) {
    //           _w3mService.close();
    //           debugPrint('$value : openthen');
    //           setState(() {
    //             loading = false;
    //           });
    //         });

    //         // var add = _w3mService.address;
    //         // bool cc = _w3mService.isConnected;
    //         // debugPrint("$add:: wallet connect response: $cc");
    //       }
    //     } else {
    //       _initializeService();
    //     }
    //   } catch (e) {
    //     setState(() {
    //       loading = false;
    //     });
    //     // debugPrint('$e: connection error');
    //   }
    // }

    // void _initializeService() async {
    //   _w3mService = W3MService(
    //     projectId: '20c4f9fd292a069e1bfe3023722b7b8b',
    //     metadata: const PairingMetadata(
    //       name: 'DeChat Web3 Modal',
    //       description: 'Connect Wallet with DeChat',
    //       url: 'https://www.walletconnect.com/',
    //       icons: ['https://web3modal.com/images/rpc-illustration.png'],
    //       redirect: Redirect(
    //         native: 'flutterdapp://',
    //         universal: 'https://www.walletconnect.com',
    //       ),
    //     ),
    //   );
    //   await _w3mService.init(); //changed

    //   _w3mService.addListener(_serviceListener);
    //   _w3mService.web3App?.onSessionEvent.subscribe(_onSessionEvent);
    //   _w3mService.web3App?.onSessionConnect.subscribe(_onSessionConnect);
    //   _w3mService.web3App?.onSessionDelete.subscribe(_onSessionDelete);
    // }

    // @override
    // void dispose() {
    //   _w3mService.web3App?.onSessionEvent.unsubscribe(_onSessionEvent);
    //   _w3mService.web3App?.onSessionConnect.unsubscribe(_onSessionConnect);
    //   _w3mService.web3App?.onSessionDelete.unsubscribe(_onSessionDelete);
    //   super.dispose();
    //   _subscription?.cancel();
    // }

    // void _serviceListener() {
    //   setState(() {
    //     isConnected = _w3mService.isConnected;
    //     walletAddress = _w3mService.address;
    //     loading = false; //STEP Loader
    //   });
    //   debugPrint(
    //       "$walletAddress:: wallet connect responselistener : $isConnected");
    //   if (isConnected && walletAddress != null) {
    //     try {
    //       handleSignIn(walletAddress);
    //     } catch (e, s) {
    //       print("$e $s error 2");
    //     }
    //   }
    // }

    // void _onSessionEvent(SessionEvent? args) {
    //   debugPrint('[$runtimeType] _onSessionEvent $args');
    // }

    // void _onSessionConnect(SessionConnect? args) {
    //   debugPrint('[$runtimeType] _onSessionConnect $args');
    // }

    // void _onSessionDelete(SessionDelete? args) {
    //   debugPrint('[$runtimeType] _onSessionDelete $args');
  }
}
