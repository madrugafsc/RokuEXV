# RokuEXV

## What is the explored service?
This repository explores the **ECP (External Control Protocol)**, an official communication protocol integrated into devices and televisions within the Roku TV ecosystem.

## How does the service work?
ECP operates as a web API based on local HTTP requests. The Roku TV system listens for incoming commands on a specific local network port (typically port 8060). When a valid command is received, the TV processes and executes the action immediately.

## What is the purpose of the service?
The protocol was originally designed to allow official mobile apps, voice assistants, and home automation systems to control the TV over Wi-Fi, eliminating the need for a physical infrared remote control.

## What is the tool?
**RokuEXV** is a command-line automation and remote control tool developed to interact directly with the ECP API of Roku TV devices connected to the same local network.

![image of menu](image(1).png)

## What is it used for?
The tool allows you to manage and manipulate the TV system without a physical remote control. With it, you can:
* Navigate menus (Up, Down, Left, Right, OK/Enter).
* Control audio (Volume up, volume down, and mute).
* Launch applications instantly (YouTube, Spotify, Netflix, etc.).
* Send text for direct search queries inside those applications.

## How does it work?
The tool sends structured HTTP requests to the target Roku TV's IP address. Since the ECP protocol accepts these commands directly, the tool translates user actions into network calls that the TV understands in real time.

## How powerful is the tool? (Limitations and Critical Level)
* **Capability:** The tool is highly powerful for its intended purpose, allowing instant and full control over the device's navigation, media playback, and text input functions.
* **Critical Level:** The exposure level is considered high within the local environment because the Roku TV ECP protocol **does not require any form of authentication, password, or prior pairing** to accept commands. Any device on the same network can control the TV.
* **Limitations:** The tool operates strictly within the **local area network (LAN)**. It cannot reach or manipulate TVs outside the same Wi-Fi/wired network, as the protocol is not natively exposed to the internet.

## How was the tool built?
**RokuEXV** was developed entirely in **Bash Script**.

### Advantages of using Bash for this project:
* **Speed:** Runs directly through the terminal without the overhead of virtual machines or heavy interpreters.
* **No Complex Dependencies:** Uses native Unix ecosystem utilities (such as `curl`), eliminating the need to install third-party libraries.
* **Portability:** Works out of the cell on virtually any Linux distribution, macOS, or Windows Subsystem for Linux (WSL).
* **Straightforward:** Allows simple and rapid manipulation of network requests and text streams.

## Installation
To install the tool, clone the repository and grant execution permissions to the script:

```bash
# Clone the repository
git clone https://github.com/MadrugaYH/RokuEXV

# Navigate to the project directory
cd RokuEXV

# Grant execution permissions
chmod +x main.sh
```

## Usage
Ensure your computer and the Roku TV are connected to the same local network. Pass the TV's IP address as an argument or configure it within the script:

```bash
# General usage example (adjust according to your script's actual syntax)
./rokuexv.sh <ip address>
```

*Note: Replace `<ip address>` with your Roku TV's actual local IP address.*

## License
This project is licensed under the **GPL 2.0 (GNU General Public License v2.0)**. See the `LICENSE` file for more details.
