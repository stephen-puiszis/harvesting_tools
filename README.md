# Harvesting Tools (Work in progress)

Harvest got you down? Here are a couple tools to help you.

### Setup

1. ``bundle``
2. ``cp config.yml.template config.yml``
3. Add your credentials to `config.yml` 

### Find Timesheets without Descriptions

Usage:

```sh
rake time:missing_entires --start=01-01-2014 --end=31-12-2014
```

If not start or end date is provided, it will look for the last 30 days. A CSV will be generated to the /data directory.

### Export Timesheets

Usage:

```sh
rake time:export --start=01-01-2014 --end=31-12-2014
```
