# Setup Guide

## 🔥 Download Development Builds

Very early development builds are available over at the [GitHub Actions](https://github.com/ObsidianMC/Obsidian/actions) page for Obsidian.

- Ensure you have the latest [.NET Runtime](https://dotnet.microsoft.com/download/dotnet/6.0) installed

- Find the latest [.NET Build action](https://github.com/ObsidianMC/Obsidian/actions?query=branch%3Amaster) and scroll to the bottom of the page to find the artifacts.

- Unzip the artifact and run `dotnet ObsidianApp.dll` to start the server.

- On first run, a config file is generated. Fill this file with your preferenced values and run the previous command again.

Easy, isn't it? Have fun with Obsidian! 💖

## 🐳 Docker Setup

### Dockerfile

You can now run Obsidian using Docker! As of right now, no image is available on DockerHub yet, but it will be sometime in the future.

For now, to run Obsidian on Docker you will have to follow the following steps:

1. Clone Obsidian `git clone https://github.com/ObsidianMC/Obsidian.git`

2. Go to Obsidian's cloned directory `cd Obsidian`

3. Build the docker image `docker build . -t obsidian`

4. Run the container `docker run -d -p YOUR_HOST_PORT:25565 -v YOUR_SERVERFILES_PATH:/files --name YOUR_CONTAINER_NAME obsidian`

5. Obsidian will pregenerate a config file. Fill it out in `YOUR_SERVERFILES_PATH/config.json`

6. Start Obsidian's container again. `docker restart YOUR_CONTAINER_NAME`

### Docker-Compose

Obsidian also provides Docker-Compose support!

1. Clone Obsidian `git clone https://github.com/ObsidianMC/Obsidian.git`

2. Go to Obsidian's cloned directory `cd Obsidian`

3. Run `docker-compose up -V` to generate the `config.json`

4. Edit your `docker-compose.yml` file, along with `files/config.json`

5. `docker-compose up -Vd` to have the server run! The world, plugin and other server related files will be created in the `files` directory.

## 🔧 Setting up your new server

Obsidian provides a bunch of config options. Here, a short description of the config file format is given. Do take note that these changes are subject to change, and can change at any given time.


| Item | Value |
|------|-------|
|motd|Server list MOTD.|
|port|Port to serve Obsidian on. You probably won't have to configure this for docker installs.|
|joinMessage|Message to display when a player joins the game.|
|leaveMessage|Message to display when a player leaves the game.|
|onlineMode|Whether to check a player has bought the game or not |
| maxPlayers|Maximum amount of players that can join the server|
|allowOperatorRequests|Whether to allowe the /oprequest command.|
|mulitplayerDebugMode|Whether to debug multiplayer with randomized names. Allows joining the server from the same account multiple times. Randomizes usernames|
|header|Online player list header|
|footer|Online player list footer|
|baah|That's a surprise for curious people!|
|maxMissedKeepAlives|Amount of keepalive packets before kicking a player. **⚠️ Advanced users only!**|
|downloadPlugins|Array of plugin repository URLs|
|udpBroadcast|Whether to announce the server as a "local game"|
| pregenerateChunkRange|Range of chunks to pre-generate per world (15 would be 15 in each direction) |
| debugMode | Whether to enable debug mode. **⚠️ Advanced users only!**|
| verboseExceptionLogging| Whether to enable verbose exception handling. Useful for providing error logs. |
| serverListQuery | What to display on the server list. *See "ServerListQuery options"*|
|TimeTickSpeedMultiplier| Multiplier for time speed. Speeds up daytime and weather duration. May break your game! **⚠️ Advanced users only!**|
|Worlds|Array of worlds. *See "World config format"*|

### ServerListQuery options

|   Options    |
|--------------|
|    "full"    |
| "anonymized" |
|  "disabled"  |

### World config format

|Item|Value|
|----|-----|
|name|World name|
|generator|Generator to use. Included by default are `overworld`, `superflat` and `obsidian-classic`.|
|seed|Seed to use for the world generator.|
