# CommandLineSetup
A script that sets up your command line and installs basic tooling.

# Setup

1. Open terminal and run the following command: 
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Wildchild9/CommandLineSetup/main/setup.sh)"
  ```
2. Download iTerm2 [here](https://iterm2.com/index.html)

3. Open iTerm2 and allow it to move itself to your Applications folder

4. Open iTerm2 preferences
  - In Appearance > General, set the Theme to Minimal
  - In Profiles, click Other Actions... and select Import JSON Profile. After this navigate to the Homebrew.json file in ~/Downloads/iTermHomebrewTheme/Homebrew.json and select it.
  - Select "Homebrew" in the side menu and go to Other Actions... and select "Set as Default".
  - While "Homebrew" is selected, go to the Text pane and ensure that the font is set to "Meslo LG M for Powerline"

5. Start using iTerm2 as your default command line application and enjoy!
