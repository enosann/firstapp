String uvCheck(num uvi) {
  if (uvi <= 2) {
    return 'weak';
  } else if (uvi <= 5) {
    return 'normal';
  } else if (uvi <= 7) {
    return 'strong';
  } else if (uvi <= 10) {
    return 'very strong';
  } else {
    return 'ridiculous';
  }
}
