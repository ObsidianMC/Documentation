# .Obby Plugin Format
Obsidian uses a custom format for its plugins. This article describes the format in detail, providing a comprehensive understanding of how plugins are structured and how they function within the Obsidian server.

## About the Format
The OBBY plugin format is inspired by the tModLoader mod format. It is a binary format that encapsulates the plugin data. The following sections provide an in-depth look at the structure and components of the OBBY plugin format.

## Signatures
Obsidian only supports RSA PEM formatted keys for signing plugins. Signing is completely optional but can help secure private servers when it comes to managing plugins.

## File Description

### Binary Format Details
| Data Type      | Description                                                                                                               | Encoding Details                            |
|----------------|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------|
| **String**     | Encoded in UTF-8, length-prefixed. Strings are used for various textual data within the plugin.                           | UTF-8 encoding, length-prefixed.            |
| **Int32**      | 4 bytes, little-endian order. This data type is used for numerical values such as sizes and counts.                       | 4 bytes, little-endian.                     |
| **Boolean**    | 1 byte, `0x00` for false, `0x01` for true. Booleans are used for flags and binary states.                                 | 1 byte (`0x00` for false, `0x01` for true). |
| **Array**      | A Int32 prefixed array of items.                                                                                          | No extra details                            |
| **Byte Array** | Raw binary data, length specified by context. Byte arrays are used for storing raw data such as file contents and hashes. | Variable length, raw binary data.           |
| **Dependency** | Id (String), Version (String), required (Boolean)                                                                         | No extra details                            |
| **File Entry** | Name (String), Original Length (Int32), Compressed Length (Int32)                                                         | No extra details                            |

### File Layout

The .obby file is structured in a specific layout to ensure that all necessary information is included and can be parsed correctly by the Obsidian application. The layout is as follows:

| Field               | Description                                                                 | Data Type          | Binary Format                                                                 |
|---------------------|-----------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------|
| Magic Header        | "OBBY" - Identifies the file as an Obsidian plugin package.                 | ASCII String       | 4 bytes ASCII                                                                 |
| Plugin API Version  | The version of the plugin API that this plugin is compatible with.          | String             | Variable Length String                                                        |
| Hash                | The SHA384 hash                                                             | Byte array         | 48 bytes                                                                      |
| Signature Present   | Boolean indicating if a signature is present.                               | Boolean            | Boolean                                                                       |
| Signature Length    | Length of the RSA signature. Only present if signature is present.          | Int32              | The length of the signature                                                   |
| Signature           | RSA signature of the hash. Only present if signature is present.            | Byte array         | Variable Length Byte Array                                                    |
| Data Length         | The length of the data section.                                             | Int32              | 4 bytes, little-endian                                                        |
| Plugin Assembly     | The name of the plugin assembly.                                            | String             | Variable Length String                                                        |
| Plugin Version      | The version of the plugin.                                                  | String             | Variable Length String                                                        |
| Plugin Name         | The name of the plugin.                                                     | String             | Variable Length String                                                        |
| Plugin Id           | The id of the plugin.                                                       | String             | Variable Length String                                                        |
| Plugin Authors      | The authors of the plugin.                                                  | String             | Variable Length String                                                        |
| Plugin Description  | The description of the plugin.                                              | String             | Variable Length String                                                        |
| Plugin Project Url  | The project url of the plugin.                                              | String             | Variable Length String                                                        |
| Dependencies        | Dependency Array. Only present if length > 0                                | List of Dependency | See format details.                                                           |
| Entry Count         | The number of entries (files) included in the package.                      | Int32              | 4 bytes, little-endian                                                        |
| Entry Headers       | For each entry: Name, Original Length, Compressed Length.                   | List of File Entry | See format details                                                            |
| Entry Data          | The actual data of each entry, possibly compressed.                         | Byte array         | Variable length                                                               |
