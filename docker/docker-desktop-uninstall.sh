#!/usr/bin/env bash

# stop all containers and shutdown Docker
test -z "$(docker ps -q 2>/dev/null)" && osascript -e 'quit app "Docker"'

# uninstall Docker Desktop
sudo rm -Rf /Applications/Docker.app

# remove launch daemon
sudo rm -f /Library/LaunchDaemons/com.docker.vmnetd.plist
sudo rm -f /Library/PrivilegedHelperTools/com.docker.vmnetd

# remove local Docker config
rm -Rf ~/.docker
rm -Rf /usr/local/lib/docker

# remove leftover binaries
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -f /usr/local/bin/docker-compose
rm -f /usr/local/bin/docker-credential-desktop
rm -f /usr/local/bin/docker-credential-ecr-login
rm -f /usr/local/bin/docker-credential-osxkeychain

# cleanup no longer needed files (logs, cache, images, etc.)
rm -Rf ~/Library/Containers/com.docker.docker
rm -Rf ~/Library/Application\ Support/Docker\ Desktop
rm -Rf ~/Library/Group\ Containers/group.com.docker
rm -f ~/Library/HTTPStorages/com.docker.docker.binarycookies
rm -Rf ~/Library/Logs/Docker\ Desktop
rm -f ~/Library/Preferences/com.docker.docker.plist
rm -Rf ~/Library/Saved\ Application\ State/com.electron.docker-frontend.savedState
rm -f ~/Library/Preferences/com.electron.docker-frontend.plist
