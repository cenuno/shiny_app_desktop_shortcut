echo "Start installing necessary packages"

# Check for xcode-select; install if we don't have it
# for more info, see: https://help.apple.com/xcode/mac/current/#/devc8c2a6be1
if test ! $(which xcode-select); then 
    echo "Installing xcode-select..."
    xcode-select --install
fi

# Check for Homebrew; install if we don't have it
# for more info, see: https://brew.sh/
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for npm; install if we don't have it
# for more info, see: https://formulae.brew.sh/formula/node
if test ! $(which npm); then
    echo "Installing npm..."
    brew install npm
fi

# Check for fileicon; install if we don't have it
# for more info, see:
if test ! $(which fileicon); then
    echo "Installing fileicon..."
    npm install -g fileicon
fi

echo "Finished installing packages"

# change file icon
fileicon set launch_shiny_app.command icon/map.icns 
