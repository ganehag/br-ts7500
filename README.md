# Technologic Systems TS7500 Buildroot Container

> *This container/toolkit has no affiliation with Technologic Systems other than some source files.*

This container has a pre-built toolchain for the FA526 compatible CPU found in the TS7500.

It will only prepare the software up to the final "make" statement. You can (and should) extend this
image by using it in you own Dockerfile.

It is highly recommended to use the `ts7500_{musl,uclibc}_defconfig` file from this repository as a configuration
skeleton. Extending on this with everyting you need.

> This container will produce a kernel and rootfs with EABI.

The fold `/images` is an exported `VOLUME` and will contain the final images after compilation. It is wize
to mount this folder for easy access.

You can run/enter with the command:

```bash
$ # With ucLibc
$ docker exec -it --rm -v /tmp/images:/images ganehag/br-ts7500:2017.02-uclibc
```

```bash
$ # With MUSL
$ docker exec -it --rm ganehag/br-ts7500:2017.02-musl
```

Once inside the container you can simply run `make` and you will, after a couple of minutes, have a `rootfs` and `zImage`
in the `/images` folder. These can be written to an uSDCard with `dd`.

The uSDCard needs to contain a specific `MBR` and at least two partitions. Both of the type `0xDA`.

This repository contains a file called `mbr.dd`. This file can be written to a blank (or not) uSDCard using dd.

```bash
$ # Write image to uSD
$ dd if=mbr.dd of=/dev/sdX
```

You will need to cycle the device for the kernel to re-read the partition table. Once this is done there should be two partitions on
the uSDCard. Part1 is for the `zImage` file and part2 is for the `rootfs.ext2.gz` file.

```bash
$ # Write image to uSD
$ dd if=zImage of=/dev/sdX1
$ dd if=rootfs.ext2.gz of=/dev/sdX2
```

> *Keep in mind that the rootfs.ext2.gz file CAN not be larger than 4MB* and that it is an initramfs.

