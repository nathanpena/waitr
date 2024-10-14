
# Watir Automation Script for YouTube

This project demonstrates my programming skills using Ruby to automate web interactions with YouTube. The script utilizes the **Watir** library for browser automation and **Faker** for data generation. By leveraging Watir and web drivers, I can automate browser tasks such as logging into YouTube, navigating to playlists, and removing videos from the "Watch Later" playlist.

## Overview

This project shows proficiency in:
- **Web Scraping and Automation**: Automating browser tasks using Watir to interact with web elements programmatically.
- **Ruby Programming**: Writing clean, efficient code to perform browser automation.
- **Data Engineering & Analyst Skills**: Understanding how to automate data collection and processing tasks, which is crucial for both data engineering and analysis.

By building this script, I highlight my ability to automate repetitive tasks, which is highly applicable in data engineering for scraping, data transformation, and ETL pipelines. Additionally, such automation is useful for data analysts when pulling large datasets from web-based platforms.

## Features

- **Web Automation**: Automates logging into YouTube and interacting with the playlist.
- **Playlist Management**: Automates the removal of videos from the "Watch Later" playlist.
- **Error Handling**: Manages interactions with dynamic elements, ensuring stability during execution.

## How It Works

1. **Login Automation**: The script automates logging into YouTube using predefined email and password fields.
2. **Playlist Interaction**: Navigates to the "Watch Later" playlist and removes all videos.
3. **Browser Management**: Utilizes `Watir::Browser` to open, interact with, and close the browser efficiently.

## Prerequisites

- **Ruby**: Ensure Ruby is installed on your machine.
- **Watir**: You need to install the Watir gem by running:
  ```bash
  gem install watir
  ```
- **Webdrivers**: Automatically manages browser drivers, install it using:
  ```bash
  gem install webdrivers
  ```
- **Faker**: Used for generating fake data for testing (optional for this script):
  ```bash
  gem install faker
  ```

## Running the Script

1. Make sure you have installed the necessary gems (`watir`, `webdrivers`, and optionally `faker`).
2. Run the script using the Ruby interpreter:
   ```bash
   ruby script_name.rb
   ```

### Example Use Case

This script automates the process of cleaning up a YouTube "Watch Later" playlist by logging in, navigating to the playlist, and removing each video.

```ruby
require 'watir'
require 'webdrivers'
require 'faker'

browser = Watir::Browser.new
browser.goto "https://www.youtube.com"
browser.element(tag_name:'paper-button', id:'button', class: ['style-scope', 'ytd-button-renderer', 'style-suggestive', 'size-small']).click
browser.text_field(id: 'identifierId').set('em')
browser.div(id: 'identifierNext').click
browser.text_field(name: 'password').set('pw')
browser.div(id: 'passwordNext').click
browser.goto "https://www.youtube.com/playlist?list=WL"
browser.element(tag_name:'paper-button', id:'button', class: ['style-scope', 'ytd-button-renderer', 'style-suggestive', 'size-small']).click

menus = browser.elements(tag_name:'ytd-menu-renderer', class: [ 'style-scope', 'ytd-playlist-video-renderer'])
menus.each do |m|
  m.click
  browser.element(tag_name:'yt-formatted-string', visible_text: 'Remove from Watch later').click
  sleep(0.5)
end
browser.close
```

## Applicability to Data Engineering and Data Analyst Roles

- **Automation Skills**: Automating tasks such as web scraping or interaction with data-rich platforms is a valuable skill for both data engineering and analytics.
- **Data Collection**: Automating data collection from web sources can reduce manual effort and ensure data is gathered efficiently.
- **ETL Processes**: Scripts like this one can form the basis of an ETL pipeline, automating the extraction and transformation of web-based data.

## Contact

For any questions or collaboration inquiries, feel free to reach out via [LinkedIn](https://www.linkedin.com/in/nathan-pena-995a7155/).
