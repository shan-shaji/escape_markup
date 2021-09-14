
String _htmlEscape(String string) {
  if (RegExp(r'([^&])&(|&)').hasMatch(string)) {
    string = string.replaceAll(RegExp(r"([^&])&(|&)"), ' &amp;');
  }

  if (RegExp('\"').hasMatch(string)) {
    string = string.replaceAll(RegExp('\"'), '&quot;');
  }

  if (RegExp("\'").hasMatch(string)) {
    string = string.replaceAll(RegExp("\'"), '&#39;');
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
  if (RegExp(r'&gt;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp(r'&gt;'), '>');
  }

  if (RegExp(r'&lt;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp(r'&lt;'), '<');
  }

  if (RegExp(r'&#0?39;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp(r'&#0?39;'), '\'');
  }

  if (RegExp(r'&quot;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp(r'&quot;'), '\"');
  }

  if (RegExp(r'&amp;').hasMatch(htmlString)) {
    htmlString = htmlString.replaceAll(RegExp(r'&amp;'), '&');
  }

  return htmlString;
}

/// Escapes the following characters in the given [string] argument: & < > " '
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

/// Unescapes the following HTML entities in the given [htmlString] argument: &amp; &lt; &gt; &quot; &#39;
String unEscapeMp(String s, {strings}) {
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
