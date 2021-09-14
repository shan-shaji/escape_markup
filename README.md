`Escape a string for use in HTML or the inverse`

----

# Install

```dart

$ dart pub add escape_markup

```
With Flutter:

```dart

$ flutter pub add escape_markup

```

# Usage

```dart

import 'package:escape_markup/escape_markup.dart';

void main(List<String> arguments) {
  print(escapeMp('👻 & 👻'));
  // 👻 &amp; 👻

  print(unEscapeMp('👻 &amp; 👻'));
  // => 👻 & 👻

  print(escapeMp('Hello <em>World</em>'));
  // => Hello &lt;em&gt;World&lt;/em&gt;

  const escapedUrl = 'https://shan-shaji.github.io?x=&quot;👻&quot;';

  print(unEscapeMp(escapedUrl));
  // => https://shan-shaji.github.io?x="👻"

  print(unEscapeMp('Hello &lt;em&gt;World&lt;/em&gt;'));
  // => Hello <em>World</em>
}

```