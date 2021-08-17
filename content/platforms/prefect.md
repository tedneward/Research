title=Prefect
tags=platform, distribution, low-code
summary="Build, run, and monitor data pipelines at scale." Use a flexible Python framework to easily combine tasks into workflows, then deploy, schedule, and monitor their execution through the Prefect UI or API.
~~~~~~

[Website](https://www.prefect.io/) | [Source](https://github.com/prefecthq/prefect)

Hello world
```python
from prefect import task, Flow

@task
def say_hello():
    print("Hello, World!")

with Flow("My First Flow") as flow:
    say_hello()

flow.run() # "Hello, world!"
```

Source appears to be [PrefectCore](https://www.prefect.io/core/) (Python library), which suggests a "freemium" open-source model.

Features described:

* Realtime UI: The Prefect UI updates in realtime so you're never behind.
* Universal Deploy: Anywhere you can run Python, you can run Prefect. Instantly deploy your flows and monitor runs from Prefect's UI, no Docker required.
* Flow code: Prefect flows are plain old Python, so you can build and modify them however you like.
* Parameters: Add parameters to any flow for easy runtime templating and reuse.
* Robust states: Prefect handles every error, whether expected or not. Some tasks might only run if upstream tasks fail.
* Dataflow: Pass data between tasks for complex processing and advanced analytics.
* Mapping: Powerful map/reduce operators generate dynamic tasks for each element of an input. Mapped tasks can be linked to create parallel pipelines.
* Environments: A flexible environment model means flows can be deployed anywhere from a laptop to multi-cloud clusters.
* Realtime: When paired with Dask, Prefect's event-driven scheduler can execute tasks with millisecond latency.
* Time Travel: Prefect task outputs can be cached or updated at different intervals, even within the same workflow.
* Result Handlers: Serialize data in and out of your tasks with customizable result handlers, including local filesystems, S3, and GCS.
* Custom Schedules: Specify custom schedule logic including business days, offsets, and blackout windows, or fall back on good old cron.
* Looping: Loop tasks with arbitrary control logic.
* Depth-First Execution: Race through mapped pipelines by allowing tasks to start before all tasks of the previous stage have finished.
* COMING SOON -- Event-Driven Flows: Fire off flow runs in response to external events of any frequency.
* COMING SOON -- Task Affinity: Run each of a flow's tasks in a completely different environment, including new dependencies or platforms.

