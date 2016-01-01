Docker container that creates a SMB share.

## Running

```
docker run -d \
  -p 137:137/udp \
  -p 138:138/udp \
  -p 139:139 \
  -p 445:445 \
  -p 445:445/udp \
  --restart='always' \
  --hostname 'filer' \
  -v /mnt/data:/share/data \
  -v /mnt/backups:/share/backups \
  --name <container name> dastrasmue/rpi-samba \
  -u "alice:abc123" \
  -u "bob:secret" \
  -s "Backup directory:/share/backups:rw:alice,bob" \
  -s "Alice (private):/share/data/alice:rw:alice" \
  -s "Bob (private):/share/data/bob:rw:bob" \
  -s "Documents (readonly):/share/data/documents:ro:alice,bob"
  -s "Public (readonly):/share/data/public:ro:"
```

This example will bind `smbd` to docker host ip address
and mount two directories on docker host to container.
Additionally, the supplied hostname will be used for the NetBIOS name.
Two users will be created and given various access to four shares.
Ommitting users from a share results in guest access.
The `public` share will have guest access and be browsable.

## Connecting
You'll want to expose enough ports to make the server discoverable.
The example above should be enough to get you moving.

Open Finder, then press âŒ˜K. Enter `smb://<docker_host_ip>`
and press `Connect`.
Enter login and password you supplied at the run stage.
