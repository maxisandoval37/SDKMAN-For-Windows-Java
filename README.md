# Java Version Selector for Windows

## Overview
This script allows users to manage and switch between different Java versions installed on a Windows system. It also provides an option to download and install specific Java versions.

## Features
- Lists installed Java versions.
- Allows switching between different Java versions.
- Displays the current Java version.
- Downloads and installs selected Java versions.
- Updates system environment variables for JAVA_HOME and PATH.

## Prerequisites
- Windows operating system
- Administrator privileges (the script requests elevation if necessary)

## How to Use
1. **Run the script**: Execute the `.bat` file as an administrator.
2. **Choose an option from the menu**:
   - `[0]` Show the current Java version.
   - `[1-N]` Select a Java version installed on your system.
   - `[8]` Exit the script.
   - `[9]` Download a Java version.
3. **Downloading Java**: If you select option `[9]`, choose the Java version you wish to download and install.
4. **Apply Changes**: Once a Java version is selected, the script updates `JAVA_HOME` and `PATH` accordingly.

## Java Versions Available for Download
- Java 7
- Java 8
- Java 11
- Java 17
- Java 21
- Java 24

## Notes
- The script modifies system environment variables using `setx`, which requires administrative rights.
- If a Java version is downloaded, a system restart may be required for changes to take full effect.
- The Java download URLs should be updated if necessary, as they may change over time.

## Example Output
![image](https://github.com/user-attachments/assets/594356d3-a210-4225-82f7-364129b44de9)


## License
This script is free to use and modify.

### Created By: [Maximiliano Sandoval](https://github.com/maxisandoval37) ☕
