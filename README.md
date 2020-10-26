# WinMSSScripts
A script or two to help manage your Minecraft Bedrock Edition server on Windows.

# Why?
I wanted a simple script that would do some housekeeping for me while I was setting up a [Minecraft Bedrock Server](https://www.minecraft.net/en-us/download/server/bedrock) for my family. There are other tools out there but I wanted a simple script that I could see what it was going to do.

# What it does
- Makes a copy of your worlds' files each time you launch it
- Redirects the output of the console to timestamped files so you can review at a later date
- Cleans up the last "n" number of days of logs and backups
- launches your server
- (optional) launches a tool so you can view the log files in realtime.

# What it does not do
- It doesn't display the console output and writing to logs. On a batch script you can have one or the other. We would need things like a named pipe and a more sophisitcated app to read from that pipe, display and log it. I really wanted something simple and obvious.
- It doesn't support automatic shutdowns. You need to type in "stop" to get a clean shutdown as usual.
- It doesn't support automatic restarts on server crashes.
- It doesn't come with any kind of support or liability from me whatsoever.

# Instructions
- Create a folder that you want to have your server in. e.g. D:\Games\Minecraft
- Download the contents of this repo to that folder
- Create a subfolder for the "Minecraft Bedrock Server" (from now on MDS) to go into. e.g. D:\Games\Minecraft\Server.
- Download the latest server offering from the link https://www.minecraft.net/en-us/download/server/bedrock
- Unzip the contents of that and make sure that the exe file sits in the subfolder you created.
- Edit the values at the top of the script to set it to your setup e.g.
SET SERVERFOLDER=MinecraftServer
SET BACKUP=saves
SET LOGS=logs
SET DAYSTOKEEPBACKUPS=30
- (optional) Create a shortcut to the run.bat file and assign it the lovely icon
- (optional) Set up "baretail" or gnu tools "tail" so you can monitor your log files in real time. ( https://www.google.com/search?q=baretail+free or https://www.google.com/search?q=gnu+tools+tail+windows )
- Use the batch file to launch your server.
