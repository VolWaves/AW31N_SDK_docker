
FROM ubuntu:24.04

RUN apt update && apt install -y make wget unzip xz-utils python3 \
&& apt clean && rm -rf /var/lib/apt/lists/* \
&& wget -q https://github.com/VolWaves/AW31N_BLE_SDK_linux/archive/refs/heads/main.zip --output-document /SDK.zip \
&& unzip SDK.zip -d /SDK && mv /SDK/*/* /SDK && rm /SDK.zip \
&& chmod +x /SDK/apps/app/post_build/bd47/isd_download /SDK/apps/app/post_build/bd47/ufw_maker \
&& wget -q https://pkgman.jieliapp.com/s/linux-toolchain --output-document /toolchain.tar.xz \
&& mkdir /opt/jieli && tar -xf /toolchain.tar.xz -C /opt/jieli && rm /toolchain.tar.xz \
&& mkdir -p /SDK/apps/docker

WORKDIR /SDK/apps/docker

