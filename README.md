PSPDFTextView
=============

A subclass that fixes the most glaring problems from iOS 7 and 7.1.

What's fixed in this subclass?

*  When adding a newline, `UITextView` will now properly scroll down. Previously, you needed to add at least one character for this to happen.
*  Scrolling to the caret position works considering `contentInset`. By default, `UITextView` completely ignores this.
*  Typing will also consider `contentInset` and will update the scroll position accordingly.

UITextView:

[![UITextView](https://github.com/steipete/PSPDFTextView/raw/master/Example/broken.gif)](#broken)

PSPDFTextView:

[![PSPDFTextView](https://github.com/steipete/PSPDFTextView/raw/master/Example/fixed.gif)](#fixed)

Read more in my blog post: [http://petersteinberger.com](http://petersteinberger.com)

## License

Taken from the commercial [PSPDFKit](http://pspdfkit.com). This part has been relicensed under the MIT license.