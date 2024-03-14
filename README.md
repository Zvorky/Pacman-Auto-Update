# Pacman Auto Update

### _Simple script to automatically update pacman packages when AFK_

The Pacman Auto Update script automates the [`pacman`](https://wiki.archlinux.org/title/Pacman) update process by periodically checking for updates during idle periods.
By default, the service detects inactivity after 5 minutes and triggers a system update using the `sudo pacman -Syu` command.

Users can customize the idle detection threshold, update cooldown period, and inactivity verification interval according to their preferences and system requirements.
This ensures that the system remains up-to-date while minimizing disruptions to user activities.  
_(See **"Settings"** session for more)_

## Installation

To install the Pacman Auto Update, follow these steps:

1. Clone/Download this repository to your device.

2. Make sure the `install.sh` script is executable. You can make it executable running:

   ```bash
   chmod +x install.sh
   ```

3. Execute the script with root privileges:

   ```bash
   sudo ./install.sh
   ```

4. The [installation script](install.sh) will copy the script to `/usr/bin/` and set up the systemd service.

5. Once the installation is complete, the service will be enabled and will be started automatically whenever the system starts.

## Usage

Pacman Auto Update runs as a [`systemctl`](https://www.redhat.com/sysadmin/getting-started-systemctl) service. And you can:

### Start/Stop

- Temporarily **stop** the auto update by using:
  ```
  systemctl stop pacman-auto-update.service
  ```
- **Start** again with:
  ```
  systemctl start pacman-auto-update.service
  ```

### Enable/Disable

- You can also **disable** it from running with system startup:
  ```
  systemctl disable pacman-auto-update.service
  ```
- And **enable** again with:
  ```
  systemctl enable pacman-auto-update.service
  ```

## Settings

You can edit both the installed script at `/usr/bin/pacman-auto-update` or the [`pacman-auto-update`](pacman-auto-update) file you cloned (just remember to run again the `install.sh` script).

| Setting         | Default | Unit | ==  | Description                                                                              |
| --------------- | ------- | ---- | --- | ---------------------------------------------------------------------------------------- |
| MAX_INACTIVITY  | 300000  | ms   | 5m  | The maximum duration of inactivity before triggering an update.                          |
| UPDATE_COOLDOWN | 10800   | s    | 3h  | The delay before starting to check for updates again after an update has been performed. |
| CHECK_COOLDOWN  | 60      | s    | 1m  | The delay between successive checks for system inactivity.                               |

## Uninstalling

To completely uninstall **Pacman Auto Update** run:

```bash
sudo systemctl stop pacman-auto-update.service
sudo systemctl disable pacman-auto-update.service
sudo rm /etc/systemd/system/pacman-auto-update.service
sudo rm /usr/bin/pacman-auto-update
```

---

# ⚠️ Recommendations

- **Monitor system behavior:**  
  Although the service automates the update process, it's still crucial to keep an eye on your system after updates to ensure that everything is functioning as expected. Automated updates can sometimes lead to unexpected issues, so regular monitoring is recommended.

- **Limited network bandwidth:**  
  Automatic updates can significantly consume network bandwidth, especially if you have a limited or capped internet connection. Large updates, such as those involving system upgrades or downloading multiple packages, may strain your network resources and slow down other internet-dependent activities. Before enabling the automatic update service, ensure that your network infrastructure can accommodate the additional traffic without causing inconvenience or exceeding data usage limits. Alternatively, consider scheduling updates during off-peak hours to minimize network congestion and optimize bandwidth utilization.

- **Critical system configurations:**  
  If your system requires specific configurations or dependencies that could be affected by updates, it's advisable to carefully consider whether installing the automatic update script is appropriate. Automatic updates may inadvertently modify critical components of your system, potentially leading to compatibility issues or unexpected behavior. In such cases, it may be preferable to manually manage updates to maintain control over the update process and minimize the risk of disruptions.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
