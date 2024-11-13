// import 'package:wallet_connect_v2/wallet_connect_v2.dart';

// import 'package:walletconnect_flutter_v2/apis/core/pairing/utils/pairing_models.dart';
// import 'package:walletconnect_flutter_v2/apis/web3app/web3app.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web3modal_flutter/web3modal_flutter.dart';
// import 'package:walletconnect_flutter/walletconnect_flutter.dart';
class WalletService{
//   final _client = WalletConnectV2();
// final _walletMetadata = AppMetadata(
//       name: 'Cineplex',
//       url: 'https://avacus.cc',
//       description: 'Web Wallet By Cineplex',
//       icons: ['https://avacus.cc/apple-icon-180x180.png'],
//       redirect: 'wcexample');
  initConnetion()async{
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