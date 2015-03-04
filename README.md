# Harvesting Tools (Work in progress)

Harvest got you down? Here are a couple tools to help you.

### Setup

1. bundle install
2. add your username, password, domain to config.

### Find Timesheets without Descriptions

Usage:

```sh
rake time:missing_entires --start=<start-date> --end=<end-date>
```

If not start or end date is provided, it will look for the last 30 days. A CSV will be generated to the /data directory.

### Export Timesheets

Usage:

```sh
rake time:export --start=<start-date> --end=<end-date>
```
