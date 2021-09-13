_htmlEscape(String string) => string.replaceAll(RegExp(r"([^&])&(|&)"), ' &amp;')
  ..replaceAll('/"/g', '&quot;')
  ..replaceAll("/'/g", '&#39;')
  ..replaceAll("/</g", '&lt;')
  ..replaceAll('/>/g', '&gt;');

_htmlUnescape(htmlString) => htmlString.replaceAll('/&gt;/g', '>')
  ..replaceAll('/&lt;/g', '<')
  ..replaceAll('/&#0?39;/g', '\'')
  ..replaceAll('/&quot;/g', '"')
  ..replaceAll('/&amp;/g',
      '&'); // Must happen last or else it will unescape other characters in the wrong order.

String escapeMarkup(strings) {
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
