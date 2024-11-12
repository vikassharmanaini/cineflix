// import 'package:wallet_connect_v2/wallet_connect_v2.dart';

import 'package:walletconnect_flutter_v2/apis/core/pairing/utils/pairing_models.dart';
import 'package:walletconnect_flutter_v2/apis/web3app/web3app.dart';

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
  Web3App wcClient = await Web3App.createInstance(
  projectId: '123',
  relayUrl: 'wss://relay.walletconnect.com', // The relay websocket URL, leave blank to use the default
  metadata: PairingMetadata(
    name: 'Your dApp Name (Requester)',
    description: 'A dapp that can request that transactions be signed',
    url: 'https://walletconnect.com',
    icons: ['https://avatars.githubusercontent.com/u/37784886'],
    redirect: Redirect( // Specially important object if you the Wallet to navigate back to your dapp
      native: 'mydapp://',
      universal: 'https://mydapp.com/app',
    ),
  ),
);
  }
}