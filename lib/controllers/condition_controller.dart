class ConditionController {
  String Condition(String? condition) {
    switch (condition) {
      case 'storm':
        return 'assets/images/storm.png';
      case 'hail':
        return 'assets/images/hail.png';
      case 'rain':
        return 'assets/images/rain.png';
      case 'snow':
        return 'assets/images/snow.png';
      case 'fog':
        return 'assets/images/fog.png';
      case 'clear_day':
        return 'assets/images/clear_day.png';
      case 'clear_night':
        return 'assets/images/clear_night.png';
      case 'cloud':
        return 'assets/images/cloud.png';
      case 'cloudly_day':
        return 'assets/images/cloudly_day.png';
      case 'cloudly_night':
        return 'assets/images/cloudly_night.png';
      case 'none_day':
        return 'assets/images/sunny.png';
      case 'none_night':
        return 'assets/images/sunny.png';
      default:
        return 'assets/images/sunny.png';
    }
  }
}
