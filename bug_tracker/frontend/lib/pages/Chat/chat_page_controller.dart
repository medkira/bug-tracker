import 'package:frontend/ip_config.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatPageController extends GetxController {
  late io.Socket socket;
  RxList<String> messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    connectToServer();
  }

  void connectToServer() {
    socket = io.io(url, {
      'transports': ['websocket'],
      'autoConnect': false
    });

    socket.connect();

    socket.onConnect((_) {
      print('Connected to server');
    });
    socket.on('chat message', (message) {
      messages.add(message);
    });
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      socket.emit('chat message', message);
    }
  }

  @override
  void onClose() {
    socket.disconnect();
    super.onClose();
  }
}
