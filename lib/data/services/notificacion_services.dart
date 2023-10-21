import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// intancia del plugin para las notificacions
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// metodo que inicializa el servicio de las notificacion
/// aqui agregamos la configuracion inicial de las notificacion
/// para los dispositivos
Future<void> initNotifications() async {
  // configuracion del androi
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("ic_launcher");

  // configuracion para IOS
  const DarwinInitializationSettings iosInitializationSettings =
      DarwinInitializationSettings();

  // configuracion inicial de las notificacions
  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  // metodo de nicializacion
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

/// Metodo que lanza una notificacion local de la aplicaion
Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    "channelId",
    "channelName",
    importance: Importance.max,
    priority: Priority.high,
  );

  const DarwinNotificationDetails iosNotificationDetails =
      DarwinNotificationDetails();

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: iosNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    1,
    "Local notificasio",
    "Notificaion de prueba",
    notificationDetails,
  );
}
