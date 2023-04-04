var validateTask = (value) {
  if (value!.isEmpty) {
    return 'Please enter a Task';
  }
  return null;
};
