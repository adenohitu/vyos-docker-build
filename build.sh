mkdir vyos && cd vyos
curl -OL "https://github.com/vyos/vyos-rolling-nightly-builds/releases/download/1.5-rolling-202404141045/vyos-1.5-rolling-202404141045-amd64.iso"
mkdir rootfs
sudo mount -o loop vyos-1.5-rolling-202404141045-amd64.iso rootfs
sudo apt-get install -y squashfs-tools
mkdir unsquashfs
sudo unsquashfs -f -d unsquashfs/ rootfs/live/filesystem.squashfs
sudo tar -C unsquashfs -c . | docker import - vyos:1.5-rolling-202404141045
sudo umount rootfs