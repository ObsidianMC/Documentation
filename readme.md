# Obsidian Documentation
## Building
### Requirements
- DocFX installed
- A build of Obsidian.API

### Steps
1. Add the build output to the `/src` folder. if it does not exist yet, create it.
2. Run `docfx --serve`. This will serve the current version documentation, and output the files to `/_site`.

### Contributing
Contributions are always welcome.

- Contributing to articles:
Modify markdown files located in the `/articles` folder. Images are in `/images`.

- Contributing to API documentation:
Api documentation is generated from source/binary files. To add to the API docs, contribute to [Obsidian.API](https://github.com/ObsidianMC/Obsidian/tree/master/Obsidian.API) itself.