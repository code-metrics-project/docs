# Environment variables

A number of runtime application features are configurable via use of the application environment variables `.env` file in the working directory. Do this by copying the file `.env.template` and name the copy `.env`.

Hopefully these are fairly self-explanatory from the variable names provided, with scope of the current settings (non-exhaustive):

- Configuration (To define file location & Auto-Reload options)
- CORS
- Data Caching, see [datastores](./datastores.md)
- Logging (Levels, Response Output)
- System Login (Setting the application `admin` root user login, also see [users](#user-authentication))
