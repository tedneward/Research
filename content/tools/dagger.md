title=Dagger
tags=tool, ci-cd, devops
summary=A portable devkit for CI/CD pipelines.
~~~~~~

[Website](https://dagger.io/) | [Source](https://github.com/dagger/dagger)

Features:
* Use [CUE](/languages/cuelang) (a config language), not Yaml
* CUE is all about actions
* #Dagger helps create custom actions in any language
* #Dagger provides a huge collection of reusable actions
* Run "dagger do deploy" to test & debug on your local machine
* Run Dagger pipelines on any Docker compatible runtimes

Run sample TODO app
* Clone & run the following
    ```
    git clone https://github.com/dagger/dagger
    cd dagger
    git checkout v0.2.4
    cd pkg/universe.dagger.io/examples/todoapp
    dagger do build
    ```

* You should see the output similar to below

    ```
    [✔] actions.deps                   62.1s
    [✔] actions.build.run.script   0.4s
    [✔] actions.test.script        0.5s
    [✔] client.filesystem."./".read                  0.6s
    [✔] actions.test                 2.0s
    [✔] actions.build.run           12.4s
    [✔] actions.build.contents    0.1s
    [✔] client.filesystem."./_build".write      0.2s
    ```

* Run the following command to see your application up & running

    ```
    start _build/index.html
    ```

* Update the application and see changes
    * In the todoapp directory, edit line 25 of src/components/Form.js by updating to "What must be done today?" & save the file
    * Now run "dagger do build" again & then start _build/index.html to see latest changes
