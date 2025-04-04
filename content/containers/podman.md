title=Podman
tags=container, virtualization
summary=An open-source flavor of Docker.
~~~~~~

[Website](https://podman.io/) | [Source](https://github.com/containers/podman)

# Basic Setup and Use of Podman
Podman is a utility provided as part of the libpod library.  It can be used to create and maintain containers. The following tutorial will teach you how to set up Podman and perform some basic commands with Podman.

If you are running on a Mac or Windows PC, you should instead follow the [Mac and Windows tutorial](https://github.com/containers/podman/blob/main/docs/tutorials/mac_win_client.md) to set up the remote Podman client.

**NOTE**: the code samples are intended to be run as a non-root user, and use `sudo` where root escalation is required.

## Installing Podman

For installing or building Podman, see the [installation instructions](https://podman.io/getting-started/installation).

## Familiarizing yourself with Podman

### Running a sample container
This sample container will run a very basic httpd server (named basic_httpd) that serves only its index page.
```console
podman run --name basic_httpd -dt -p 8080:80/tcp docker.io/nginx
```
Because the container is being run in detached mode, represented by the *-d* in the `podman run` command, Podman will print the container ID after it has run. Note that we use port forwarding to be able to access the HTTP server. For successful running at least slirp4netns v0.3.0 is needed.

### Listing running containers
The Podman *ps* command is used to list creating and running containers.
```console
podman ps
```

Note: If you add *-a* to the *ps* command, Podman will show all containers.
### Inspecting a running container
You can "inspect" a running container for metadata and details about itself.  We can even use the inspect subcommand to see what IP address was assigned to the container. As the container is running in rootless mode, an IP address is not assigned and the value will be listed as "none" in the output from inspect.
```console
podman inspect basic_httpd | grep IPAddress\":
            "SecondaryIPAddresses": null,
            "IPAddress": "",
```

### Testing the httpd server
As we do not have the IP address of the container, we can test the network communication between the host operating system and the container using curl. The following command should display the index page of our containerized httpd server.
```console
curl http://localhost:8080
```

### Viewing the container's logs
You can view the container's logs with Podman as well:
```console
podman logs <container_id>
10.88.0.1 - - [07/Feb/2018:15:22:11 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.55.1" "-"
10.88.0.1 - - [07/Feb/2018:15:22:30 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.55.1" "-"
10.88.0.1 - - [07/Feb/2018:15:22:30 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.55.1" "-"
10.88.0.1 - - [07/Feb/2018:15:22:31 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.55.1" "-"
10.88.0.1 - - [07/Feb/2018:15:22:31 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.55.1" "-"
```

### Viewing the container's pids
And you can observe the httpd pid in the container with *top*.
```console
podman top <container_id>
  UID   PID  PPID  C STIME TTY          TIME CMD
    0 31873 31863  0 09:21 ?        00:00:00 nginx: master process nginx -g daemon off;
  101 31889 31873  0 09:21 ?        00:00:00 nginx: worker process
```

### Checkpointing the container
Checkpointing a container stops the container while writing the state of all processes in the container to disk. With this a container can later be restored and continue running at exactly the same point in time as the checkpoint. This capability requires CRIU 3.11 or later installed on the system. This feature is not supported as rootless; as such, if you wish to try it, you'll need to re-create your container as root, using the same command but with sudo.

To checkpoint the container use:
```console
sudo podman container checkpoint <container_id>
```

### Restoring the container
Restoring a container is only possible for a previously checkpointed container. The restored container will continue to run at exactly the same point in time it was checkpointed. To restore the container use:
```console
sudo podman container restore <container_id>
```

After being restored, the container will answer requests again as it did before checkpointing.
```console
curl http://<IP_address>:8080
```

### Migrate the container
To live migrate a container from one host to another the container is checkpointed on the source system of the migration, transferred to the destination system and then restored on the destination system. When transferring the checkpoint, it is possible to specify an output-file.

On the source system:
```console
sudo podman container checkpoint <container_id> -e /tmp/checkpoint.tar.gz
scp /tmp/checkpoint.tar.gz <destination_system>:/tmp
```

On the destination system:
```console
sudo podman container restore -i /tmp/checkpoint.tar.gz
```

After being restored, the container will answer requests again as it did before checkpointing. This time the container will continue to run on the destination system.
```console
curl http://<IP_address>:8080
```

### Stopping the container
To stop the httpd container:
```console
podman stop <container_id>
```
You can also check the status of one or more containers using the *ps* subcommand. In this case, we should use the *-a* argument to list all containers.
```console
podman ps -a
```

### Removing the container
To remove the httpd container:
```console
podman rm <container_id>
```
You can verify the deletion of the container by running *podman ps -a*.

## Integration Tests
For more information on how to set up and run the integration tests in your environment, checkout the Integration Tests [README.md](../../test/README.md)

## More information

For more information on Podman and its subcommands, checkout the asciiart demos on the [README.md](../../README.md#commands) page.

# How to sign and distribute container images using Podman

Signing container images originates from the motivation of trusting only dedicated image providers to mitigate man-in-the-middle (MITM) attacks or
attacks on container registries. One way to sign images is to utilize a GNU Privacy Guard ([GPG][0]) key. This technique is generally compatible with any OCI compliant container registry like [Quay.io][1]. It is worth mentioning that the OpenShift integrated container registry supports this signing mechanism out of the box, which makes separate signature storage unnecessary.

[0]: https://gnupg.org
[1]: https://quay.io

From a technical perspective, we can utilize Podman to sign the image before pushing it into a remote registry. After that, all systems running Podman have to be configured to retrieve the signatures from a remote server, which can be any simple web server. This means that every unsigned image will be rejected during an image pull operation. But how does this work?

First of all, we have to create a GPG key pair or select an already locally available one. To generate a new GPG key, just run `gpg --full-gen-key` and follow the interactive dialog. Now we should be able to verify that the key exists locally:

```bash
> gpg --list-keys sgrunert@suse.com
pub   rsa2048 2018-11-26 [SC] [expires: 2020-11-25]
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
uid           [ultimate] Sascha Grunert <sgrunert@suse.com>
sub   rsa2048 2018-11-26 [E] [expires: 2020-11-25]
```

Now let’s assume that we run a container registry. For example we could simply start one on our local machine:

```bash
sudo podman run -d -p 5000:5000 docker.io/registry
```

The registry does not know anything about image signing, it just provides the remote storage for the container images. This means if we want to sign an image, we have to take care of how to distribute the signatures.

Let’s choose a standard `alpine` image for our signing experiment:

```bash
sudo podman pull docker://docker.io/alpine:latest
```

```bash
sudo podman images alpine
REPOSITORY                 TAG      IMAGE ID       CREATED       SIZE
docker.io/library/alpine   latest   e7d92cdc71fe   6 weeks ago   5.86 MB
```

Now we can re-tag the image to point it to our local registry:

```bash
sudo podman tag alpine localhost:5000/alpine
```

```bash
sudo podman images alpine
REPOSITORY                 TAG      IMAGE ID       CREATED       SIZE
localhost:5000/alpine      latest   e7d92cdc71fe   6 weeks ago   5.86 MB
docker.io/library/alpine   latest   e7d92cdc71fe   6 weeks ago   5.86 MB
```

Podman would now be able to push the image and sign it in one command. But to let this work, we have to modify our system-wide registries configuration at `/etc/containers/registries.d/default.yaml`:

```yaml
default-docker:
  sigstore: http://localhost:8000 # Added by us
  sigstore-staging: file:///var/lib/containers/sigstore
```

We can see that we have two signature stores configured:

- `sigstore`: referencing a web server for signature reading
- `sigstore-staging`: referencing a file path for signature writing

Now, let’s push and sign the image:

```bash
sudo -E GNUPGHOME=$HOME/.gnupg \
    podman push \
    --tls-verify=false \
    --sign-by sgrunert@suse.com \
    localhost:5000/alpine
…
Storing signatures
```

If we now take a look at the systems signature storage, then we see that there is a new signature available, which was caused by the image push:

```bash
sudo ls /var/lib/containers/sigstore
'alpine@sha256=e9b65ef660a3ff91d28cc50eba84f21798a6c5c39b4dd165047db49e84ae1fb9'
```

The default signature store in our edited version of `/etc/containers/registries.d/default.yaml` references a web server listening at `http://localhost:8000`. For our experiment, we simply start a new server inside the local staging signature store:

```bash
sudo bash -c 'cd /var/lib/containers/sigstore && python3 -m http.server'
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

Let’s remove the local images for our verification test:

```
sudo podman rmi docker.io/alpine localhost:5000/alpine
```

We have to write a policy to enforce that the signature has to be valid. This can be done by adding a new rule in `/etc/containers/policy.json`. From the below example, copy the `"docker"` entry into the `"transports"` section of your `policy.json`.

```json
{
  "default": [{ "type": "insecureAcceptAnything" }],
  "transports": {
    "docker": {
      "localhost:5000": [
        {
          "type": "signedBy",
          "keyType": "GPGKeys",
          "keyPath": "/tmp/key.gpg"
        }
      ]
    }
  }
}
```

The `keyPath` does not exist yet, so we have to put the GPG key there:

```bash
gpg --output /tmp/key.gpg --armor --export sgrunert@suse.com
```

If we now pull the image:

```bash
sudo podman pull --tls-verify=false localhost:5000/alpine
…
Storing signatures
e7d92cdc71feacf90708cb59182d0df1b911f8ae022d29e8e95d75ca6a99776a
```

Then we can see in the logs of the web server that the signature has been accessed:

```
127.0.0.1 - - [04/Mar/2020 11:18:21] "GET /alpine@sha256=e9b65ef660a3ff91d28cc50eba84f21798a6c5c39b4dd165047db49e84ae1fb9/signature-1 HTTP/1.1" 200 -
```

As a counterpart example, if we specify the wrong key at `/tmp/key.gpg`:

```bash
gpg --output /tmp/key.gpg --armor --export mail@saschagrunert.de
File '/tmp/key.gpg' exists. Overwrite? (y/N) y
```

Then a pull is not possible any more:

```bash
sudo podman pull --tls-verify=false localhost:5000/alpine
Trying to pull localhost:5000/alpine...
Error: pulling image "localhost:5000/alpine": unable to pull localhost:5000/alpine: unable to pull image: Source image rejected: Invalid GPG signature: …
```

So in general there are four main things to be taken into consideration when signing container images with Podman and GPG:

1. We need a valid private GPG key on the signing machine and corresponding public keys on every system which would pull the image
2. A web server has to run somewhere which has access to the signature storage 
3. The web server has to be configured in any `/etc/containers/registries.d/*.yaml` file
4. Every image pulling system has to be configured to contain the enforcing policy configuration via `policy.conf`

That’s it for image signing and GPG. The cool thing is that this setup works out of the box with [CRI-O][2] as well and can be used to sign container images in Kubernetes environments.

[2]: https://cri-o.io

