import 'package:get/get.dart';
import 'package:reown_appkit/reown_appkit.dart';


class WalletService {
  void initConnetion()async {
    final _appKitModal = ReownAppKitModal(
  context: Get.context!,
  projectId: '{YOUR_PROJECT_ID}',
  metadata: const PairingMetadata(
    name: 'Example App',
    description: 'Example app description',
    url: 'https://example.com/',
    icons: ['https://example.com/logo.png'],
    redirect: Redirect(  // OPTIONAL
      native: 'exampleapp://',
      universal: 'https://reown.com/exampleapp',
      linkMode: true|false,
    ),
  ),
);

final appKit =await ReownAppKit.createInstance(
  projectId: '0c78392dd1944a7d725e77cf6578c8df',
  metadata: const PairingMetadata(
    name: 'Cinefilix',
    description: 'Enjoy WEB3 OTT',
    url: 'https://example.com/',
    icons: ['https://example.com/logo.png'],
    redirect: Redirect(
      native: 'exampleapp://',
      universal: 'https://reown.com/exampleapp',
      linkMode: true|false,
    ),
  ),
);

// AppKit Modal instance
final appKitModal = ReownAppKitModal(
  context: Get.context!,
  appKit: appKit,
  
);

// Register here the event callbacks on the service you'd like to use. See `Events` section.

await _appKitModal.init();

  }
  
}
