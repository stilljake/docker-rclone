# Docker-Rclone
A docker image which contains [rclone](https://rclone.org/), a tool for syncing files from different cloud services.

This container will sync files from a remote cloud storage (eg. Onedrive) to a local directory.

## Usage
```
docker run \
  --name rclone \
  -v <path to rclone.conf>:/root/.config/rclone/ \
  -v <path to sync destination>:/data \
  -e REMOTE=<name of remote from rclone.conf>
```
### Optional Parameters
* `-e REMOTE_PATH` Provide a subdirectory at the remote to sync files from.

## Rclone Config
A rclone.conf file must be provided via the `/root/.config/rclone/` docker volume.


### Example rclone.conf for Ondedrive
```
[remote]
type = onedrive
client_id =
client_secret =
token = <paste result from rclone authorize>
resource_url = <https://mydomain.sharepoint.com/>
```
You can obtain an access token for the config by using `rclone authorize` on a machine with a web browser. For more info: https://rclone.org/remote_setup/


## Info
* Multiple containers can be run to sync from multiple locations at the same time. However each containers `/data` volume must be mounted to a separate directory. Otherwise the remote files will overwrite each other.

* To monitor logs `docker logs -f Rclone`
