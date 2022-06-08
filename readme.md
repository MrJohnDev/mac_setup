# New Mac Setup Script (Flutter developer)

## About

This setup script is for modifying some default settings on Mac OS X, installing some of my preferred Terminal tools, and a few applications.

Please feel free to fork and/or add issues/PRs to help make this work better for everyone.

### Installation with Curl

To install this script from a brand new Mac (fresh out of the box!) run the following command in terminal:

``` shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/MrJohnDev/mac_setup/master/setup.sh)"
```

**Want to know what ```curl -fsSL``` stands for? Checkout this [link](https://explainshell.com/explain?cmd=curl+-fsSL+example.org#).**

If you do not already have [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_) installed, you will be prompted to install them after being prompted for ```sudo``` access.

### Why ask for sudo access?

You'll need ```sudo``` access to do the initial Finder modifications, but it is not required to install Homebrew or associated packages.

If you're not comfortable allowing this script to prompt you for ```sudo``` access, feel free to copy/paste the commands you want out of this script into the Terminal as you see fit.
