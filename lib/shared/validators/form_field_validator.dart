String formFieldValidator(String value, Function(bool) callback) {
  assert(callback != null, 'Callback should not be null!');
  if (value == null || value.isEmpty) {
    callback(false);
    return 'Поле не должно быть пустым!';
  }
  if (value.length <= 3) {
    callback(false);
    return 'Поле должно содержать более трех символов!';
  }
  callback(true);
  return null;
}
