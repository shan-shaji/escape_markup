String _htmlEscape(String string) {
  if (RegExp(r'([^&])&(|&)').hasMatch(string)) {
    string = string.replaceAll(RegExp(r"([^&])&(|&)"), ' &amp;');
  }

  if (RegExp(r'\"').hasMatch(string)) {
    string = string.replaceAll(RegExp(r'\"'), '&quot;');
  }

  if (RegExp(r"\'").hasMatch(string)) {
    string = string.replaceAll(RegExp("/'"), '&#39;');
  }

  if (RegExp(r'<').hasMatch(string)) {
    string = string.replaceAll(RegExp('<'), '&lt;');
  }

  if (RegExp(r'>').hasMatch(string)) {
    string = string.replaceAll(RegExp('>'), '&gt;');
  }

  return string;
}

String _htmlUnescape(String htmlString) {
  if (RegExp('&gt;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp('&gt;'), '>');
  }

  if (RegExp('&lt;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp('&lt;'), '<');
  }

  if (RegExp('&#0?39;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp('&#0?39;'), '\'');
  }

  if (RegExp('&quot;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp('&quot;'), '\"');
  }

  if (RegExp('&amp;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp('&amp;'), '&');
  }

  return htmlString;
}

String escapeMp(strings) {
  if (strings.runtimeType == String) {
    return _htmlEscape(strings);
  }

  var output = strings[0];
  if (strings.runtimeType == List) {
    for (var index = 0; index <= (strings as List).length; index++) {
      output = output + _htmlEscape(strings[index] + strings[index + 1]);
    }
  }

  return output;
}

String unEscapeMp(strings) {
  if (strings.runtimeType == String) {
    return _htmlUnescape(strings);
  }

  var output = strings[0];
  if (strings.runtimeType == List) {
    for (var index = 0; index <= (strings as List).length; index++) {
      output = output + _htmlEscape(strings[index] + strings[index + 1]);
    }
  }

  return output;
}
