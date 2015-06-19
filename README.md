# CocoaNova

CocoaNova is a rake like tool for code generating and management, original designed for xcode projects.

# Usage

# .novarc

`.novarc` is a YAML configuration file for overring default configurations

```yaml
src_root: ./
nova_root: ./nova
plugins:
  - cocoanova-assets
```

`src_root`, the root of all source files, default to `./'`

`local_root`, the root of local nova folder, default to `./nova`

`plugins`, array of plugins to require

# `./nova/data`

This folder is for storage data files for templating, `yaml`, `json`, `txt` is supported by default.
