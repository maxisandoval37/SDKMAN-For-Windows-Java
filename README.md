# Java Version Selector

## Overview
This batch script allows you to easily switch between different installed versions of Java on your Windows system. It updates the `JAVA_HOME` environment variable and modifies the system `PATH` accordingly.

## Features
- Display the current Java version
- Select and switch between Java 7, Java 11, and Java 21
- Persistent changes to `JAVA_HOME` and `PATH`
- Option to exit the script cleanly
- Automatic loop back to the menu for easy navigation

## Prerequisites
- Windows operating system
- Multiple versions of Java installed
- Administrator privileges (required to modify environment variables permanently)

## Installation
1. Copy the script into a `.bat` file, e.g., `java_selector.bat`.
2. Edit the script to update the Java paths according to your installation locations.
3. Run the script as Administrator for permanent environment variable updates.

## Usage
1. Double-click `java_selector.bat` to run the script.
2. Select an option from the menu:
   - `[1] Show current Java version`
   - `[2] Use Java 7`
   - `[3] Use Java 11`
   - `[4] Use Java 21`
   - `[5] Exit`
3. If you select a Java version, the script updates `JAVA_HOME` and `PATH` and applies the changes immediately.
4. The selected Java version will be used in the current session and future system-wide executions.

## Notes
- If you select option **1**, the script will display the current Java version and return to the menu.
- If you select an invalid option, the script will prompt you to choose again.
- Running the script without Administrator privileges may only apply changes for the current session.

## Example Output
```
===============================
      Java Version Selector    
===============================
Current Java version:
java version "17.0.3" 2022-04-19 LTS

Select an option:
[1] Show current Java version
[2] Use Java 7
[3] Use Java 11
[4] Use Java 21
[5] Exit
Enter the number of the desired option: 3

Java changed to: C:\Program Files\Java\jdk-11.0.20
java version "11.0.20" 2023-07-18 LTS
```

## License
This script is free to use and modify.

### Created By: [Maximiliano Sandoval](https://github.com/maxisandoval37) ☕
