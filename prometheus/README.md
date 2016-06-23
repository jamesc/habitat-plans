# Habitat plan for prometheus


## Configuration
The plan allows you to add additional scrape configs by adding new entries to the ``[scrape_configs]`` list.  For example:

```
[scrape_configs.cadvisor]
job_name="cadvisor"
scrape_interval="10s"
scrape_timeout="2s"
metrics_path="/metrics"
target="cadvisor:8080"
```

