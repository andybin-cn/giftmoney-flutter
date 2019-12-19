
class CommonError extends Error {
  String message;
  CommonError([this.message]){}

  @override
  String toString() {
    return message;
  }
}