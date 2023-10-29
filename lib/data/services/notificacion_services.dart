import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificacionServices {
  /// intancia del plugin para las notificacions
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// metodo que inicializa el servicio de las notificacion
  /// aqui agregamos la configuracion inicial de las notificacion
  /// para los dispositivos
  static Future<void> initNotifications() async {
    // configuracion del androi
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    // configuracion para IOS
    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    // configuracion inicial de las notificacions
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    // metodo de nicializacion
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<bool> permisos() async {
    final asss =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    final res = await asss?.requestExactAlarmsPermission();

    final per = await asss?.requestNotificationsPermission();

    return (res ?? false) && (per ?? false);
  }

  /// Metodo que lanza una notificacion local de la aplicaion
  static Future<void> mostrarNotificacion(
    String? title,
    String? body,
  ) async {
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

    await _flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      notificationDetails,
    );
  }

  static Future<void> notificacionProgramada(
      String? title, String? body, DateTime? fecha) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
      channelDescription: 'repeating description',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.fromMillisecondsSinceEpoch(
        tz.local,
        fecha!.millisecondsSinceEpoch,
      ),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime
    );
  }
}
