# Configuration for Logging

The level of the logging of a skywire visor can be configured from the config with the field 
```
"log_level": "info",
```

There are three levels for logging that can be set
- `info` : General operational entries about what's going on inside the application.
- `debug` : Usually only enabled when debugging. Very verbose logging.
- `trace` : Designates finer-grained informational events than the Debug.

To change the logging level change the `log_level` in the config to `info`, `debug` or `trace` and restart the visor for it to take effect.