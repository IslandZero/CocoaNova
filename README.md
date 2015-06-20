# CocoaNova

CocoaNova is a rake like tool for code generating and management, original designed for xcode projects.

# Usage

## .novarc

`.novarc` is a YAML configuration file for overring default configurations

```yaml
src_root: ./
nova_root: ./nova
plugins:
  - cocoanova-ios
```

`src_root`, the root of all source files, default to `./'`

`local_root`, the root of local nova folder, default to `./nova`

`plugins`, array of plugins to require

## ./nova/data

This folder is for storage data files for templating, `yaml`, `json`, `txt` is supported by default.

For example, files like this

```txt
./nova/data/models.yml
./nova/data/what.json
./nova/data/symbols.txt
```

will be loaded to `Nova.data` like

```json
{
  "modles": {
      ...
  },
  "what": {
      ...
  },
  "symbols":[ // by default txt is loaded by lines
      ...
  ]
}
```

You can create your custom loader.

See `lib/cocoanova/loaders/yaml.rb` for example.

Name your custom loader file as will, just put it into `./nova/loaders/` and it will work.

## Engine

Engine is for porting any kind of template system into `CocoaNova`, `erb` is supported by default.

See `lib/cocoanova/engines/erb.rb` for example.

## Helper

Helper is automatically loaded into template system.

The main module is `Nova::Helper`, extend this module in your custom helper.

See `cocoanova-ios` for example.

## Task

Taks is like rake task.

Defaul task is `compile`, `compile` task will find all supported templates from `src_root` and then compile them with data provided by loaders.
