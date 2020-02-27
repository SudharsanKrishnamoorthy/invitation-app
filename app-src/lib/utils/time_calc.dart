String getDays(int seconds) {
  int days = (seconds / 86400).truncate();
  String dayStr = (days).toString().padLeft(2, '0');

  if (days < 0) {
    return '';
  }
  return '$dayStr';
}

String getHours(int seconds) {
  int s = (seconds % 86400).truncate();
  int hours = (s / 3600).truncate();

  String hoursStr = (hours).toString().padLeft(2, '0');

  if (hours >= 0) {
    return '$hoursStr';
  }
  return '';
}

String getMinutes(int seconds) {
  int s = (seconds % 86400).truncate();
  seconds = (s % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  String minutesStr = (minutes).toString().padLeft(2, '0');

  if (minutes>= 0) {
    return '$minutesStr';
  }
  return '';
}

String getSeconds(int seconds) {
  int s = (seconds % 86400).truncate();
  seconds = (s % 3600).truncate();

  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  if (seconds >= 0) {
    return '$secondsStr';
  }
  return '';
}

String formatHHMMSS(int seconds) {
  int days = (seconds / 86400).truncate();
  int s = (seconds % 86400).truncate();
  int hours = (s / 3600).truncate();
  seconds = (s % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  String dayStr = (days).toString().padLeft(2, '0');
  String hoursStr = (hours).toString().padLeft(2, '0');
  String minutesStr = (minutes).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  if (hours == 0) {
    return '$minutesStr:$secondsStr';
  }
  if (days == 0) {
    return '$hoursStr:$minutesStr:$secondsStr';
  }
  return '$dayStr:$hoursStr:$minutesStr:$secondsStr';
}
