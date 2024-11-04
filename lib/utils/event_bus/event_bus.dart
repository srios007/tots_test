import 'dart:async';

class EventBus {
  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  EventBus._internal();

  final StreamController _streamController = StreamController.broadcast();

  Stream get stream => _streamController.stream;

  void fire(event) {
    _streamController.add(event);
  }

  void dispose() {
    _streamController.close();
  }
}
