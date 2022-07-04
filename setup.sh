#!/bin/sh


# chmod +x ./setup.sh
# ./setup.sh

echo "Ask for the administrator password for the duration of this script"
# LockScreen: Set Lock Message to show on login screen
sudo -v

echo " Keep-alive: update existing sudo time stamp until .osx has finished"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



export ANDROID_HOME="$HOME/Library/Android/sdk"
echo export ANDROID_HOME=\$HOME/Library/Android/sdk >> ~/.zshrc

# Make a symbolic link from the default Homebrew location to $ANDROID_HOME.
link_sdk() {
    # We only do this if Android Studio _isn't_ installed.
    # If it is, we use Android Studio to manage the Android SDK
    if [ ! -d "~/Library/Android/" ]; then
        # Create the directory to store the Andrid SDK.
        mkdir -p "$ANDROID_HOME"

        # Get the directory where Homebrew installed the Android SDK.

        brew install --cask homebrew/cask-versions/temurin8
        brew install --cask android-commandlinetools

        version_dir=`ls /usr/local/Caskroom/android-sdk/ | head -n1`



        ln -s /usr/local/Caskroom/android-sdk/"$version_dir"/* "$ANDROID_HOME"

        echo export ANDROID_HOME=\$HOME/Library/Android/sdk>> ~/.zshrc
        echo export PATH=\$PATH:\$HOME/Library/Android/sdk/platform-tools>> ~/.zshrc
        echo export PATH=\$PATH:\$HOME/Library/Android/sdk/tools>> ~/.zshrc
        echo export PATH=\$PATH:\$HOME/Library/Android/sdk/tools/bin>> ~/.zshrc


    fi
}

link_sdk
# Still changing this for my own laptop, but this one seemed to have the best bones.

# echo "Write MacBook Name and press enter"
# read HOSTNAME

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

################################################################################
# Trackpad                                                                     #
################################################################################


defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -bool false
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false


defaults write com.apple.dock showLaunchpadGestureEnabled -bool true

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true



defaults write NSGlobalDomain "com.apple.trackpad.scaling" -float 3.0
defaults write NSGlobalDomain ContextMenuGesture -int 1

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Search scope
# This Mac       : SCev
# Current Folder : SCcf
# Previous Scope : SCsp
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"



sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Написать мне: t.me/r_msg или williampuh@gmail.com"



defaults delete ~/Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources
defaults write ~/Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>252</integer><key>KeyboardLayout Name</key><string>ABC</string></dict>'
defaults write ~/Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>19458</integer><key>KeyboardLayout Name</key><string>RussianWin</string></dict>'


defaults delete com.apple.HIToolbox AppleEnabledInputSources
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>252</integer><key>KeyboardLayout Name</key><string>ABC</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>19458</integer><key>KeyboardLayout Name</key><string>RussianWin</string></dict>'

# Turn off keyboard illumination when computer is not used for 10 sec
defaults write com.apple.BezelServices kDimTime -int 10


# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0


# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


# Whether icons for HDD, servers, and removable media should show on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false


# Использовать Caps Lock для переключения раскладки
defaults write NSGlobalDomain TISRomanSwitchState -bool yes

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true



# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable stacks (group similar objects on e.g. desktop)
defaults write com.apple.finder.DesktopViewSettings.GroupBy -string "Kind"
defaults write com.apple.finder.DesktopViewSettings.IconViewSettings.arrangeBy -string "dateAdded"
defaults write com.apple.finder.FXPreferredGroupBy -string "Kind"


defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter Battery -int 2
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -int 1

defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter BatteryShowPercentage -bool true
defaults write com.apple.controlcenter BatteryShowPercentage -bool true


defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter UserSwitcher -int 2
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -int 1



echo "Is this the first time you've run this script?"
read REPLY

if [[ "$REPLY" =~ ^[Yy]$ ]]
then

  echo "Removing unwanted dock icons"
  declare -a idsToRemove=(
    "com.apple.launchpad.launcher"
    "com.apple.Notes"
    "com.apple.iChat"
    "com.apple.MobileSMS"
    "com.apple.mail"
    "com.apple.Maps"
    "com.apple.Photos"
    "com.apple.FaceTime"
    "com.apple.iCal"
    "com.apple.AddressBook"
    "com.apple.reminders"
    "com.apple.Notes"
    "com.apple.TV"
    "com.apple.Music"
    "com.apple.podcasts"
    "com.apple.iTunes"
    "com.apple.iBooksX"
    "com.apple.AppStore"
    "com.apple.systempreferences"
    "com.apple.Terminal"
  )

  plistBuddy='/usr/libexec/PlistBuddy'
  dockPlistPath="$HOME/Library/Preferences/com.apple.dock.plist"
  echo $idsToRemove
  for appIDToRemove in "${idsToRemove[@]}"; do
    iconsIndexes=`defaults read com.apple.dock persistent-apps | grep tile-type | awk '/file-tile/ {print NR}'`
    for i in $iconsIndexes; do
      plistPath="persistent-apps:$[$i-1]"
      appID=`$plistBuddy -c "Print $plistPath:tile-data:bundle-identifier" $dockPlistPath`

      if [[ $appID =~ $appIDToRemove ]]; then
        echo $appIDToRemove" is to be removed!"
        $plistBuddy -c "Delete $plistPath" $dockPlistPath
        iconsIndexes=iconsIndexes-1

      fi
    done
  done

  defaults write com.apple.dock show-recents -bool false;
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true;ok





  echo "Enable spring loading for directories"
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true

  echo "Remove the spring loading delay for directories"
  defaults write NSGlobalDomain com.apple.springing.delay -float 0

  echo "Remove the auto-hiding Dock delay"
  defaults write com.apple.dock autohide-delay -float 0;ok

  echo "Remove the animation when hiding/showing the Dock"
  defaults write com.apple.dock autohide-time-modifier -float 0.5;ok

  echo "Automatically hide and show the Dock"
  defaults write com.apple.dock autohide -bool true;ok

  defaults write com.apple.dock tilesize -int 48


  # Possible values:
  #  0: no-op
  #  2: Mission Control
  #  3: Show application windows
  #  4: Desktop
  #  5: Start screen saver
  #  6: Disable screen saver
  #  7: Dashboard
  # 10: Put display to sleep
  # 11: Launchpad
  # 12: Notification Center

  echo "Top right screen corner → Mission Control"
  defaults write com.apple.dock wvous-tr-corner -int 2
  defaults write com.apple.dock wvous-tr-modifier -int 0;ok

  echo "Bottom right screen corner → Launchpad"
  defaults write com.apple.dock wvous-br-corner -int 11
  defaults write com.apple.dock wvous-br-modifier -int 0;ok

  killall Dock
  rm -rf /private/var/folders/*/*/-Caches-/com.apple.dock.iconcache
  killall Dock

  # echo " Set computer name to $HOSTNAME (as done via System Preferences → Sharing)"
  # sudo scutil --set ComputerName $HOSTNAME
  # sudo scutil --set HostName $HOSTNAME
  # sudo scutil --set LocalHostName $HOSTNAME
  # sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME


  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2

  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuationStrength -int 0

  # running "Trackpad: map right corner to right-click"
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true







  defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true;ok

  echo "Disable press-and-hold for keys in favor of key repeat"
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;ok

  echo "Set a blazingly fast keyboard repeat rate"
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 50;ok

  echo "  › Show battery percent"
  defaults write com.apple.menuextra.battery ShowPercent YES

  echo "set default screenshots folder to ~/Pictures/Screenshots"
  mkdir ~/Pictures/Screenshots/
  defaults write com.apple.screencapture location ~/Pictures/Screenshots/;killall SystemUIServer





  echo "Installing xcode-stuff"
  xcode-select --install
  # Check for Homebrew,
  # Install if we don't have it
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Update homebrew recipes
  echo "Updating homebrew..."
  brew update

  echo "Cleaning up brew"
  brew cleanup

  echo "Installing homebrew cask"
  brew tap homebrew/cask

  # for Java 8
  brew tap homebrew/versions

  #Install Zsh & Oh My Zsh
  echo "Installing Oh My ZSH..."
  curl -L http://install.ohmyz.sh | sh

  echo "Setting up Oh My Zsh theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo '\nZSH_THEME="powerlevel10k/powerlevel10k"' >>~/.zshrc
  touch .hushlogin

  echo "Setting up Oh My Zsh fonts..."
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

  echo "Setting up Zsh plugins..."
  cd ~/.oh-my-zsh/custom/plugins
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

  echo "Setting ZSH as shell..."
  chsh -s /bin/zsh







else


# Apps
  apps=(
    android-studio
    atom
    figma
    firefox
    github
    google-chrome
    spotify
    iterm2
    telegram
    virtualbox
    vlc
    visual-studio-code
  )

  # quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
  quicklookplugins=(
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklookapk
    qlimagesize
    webpquicklook
  )

  # Install apps to /Applications
  # Default is: /Users/$user/Applications
  echo "installing apps with Cask..."
  brew install --cask --appdir="/Applications" ${apps[@]}

  echo "installing quick look plugins with Cask..."
  brew install --cask --appdir="/Applications" ${quicklookplugins[@]}

  brew cleanup
  rm -rf $(brew --cache)





  # install flutter
  if [[ ! -e ~/Developer/Flutter ]]; then
     git clone -b stable https://github.com/flutter/flutter.git ~/Developer/Flutter
     export PATH="$HOME/Developer/Flutter/bin:$PATH"
     echo export PATH=\$HOME/Developer/Flutter/bin:\$PATH >> ~/.zshrc
     cd ~/Developer/Flutter/bin
     flutter doctor
  fi
fi
