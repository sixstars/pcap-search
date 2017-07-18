# pcap-search docker

Deploy MaskRay/pcap-search in a docker container.

## Build
```bash
mv Dockerfile ..
docker build -t pcap-search .
```

## Run

```bash
docker run -d -v /home/$YOURNAME/defcon/pcap:/mnt/pcap -p 4568:4568 --name "pcap0" pcap-saerch
```
