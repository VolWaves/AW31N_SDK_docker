
FROM ubuntu:24.04

# With ADD
# ADD https://github.com/VolWaves/AW31N_BLE_SDK_linux/archive/refs/heads/main.zip /SDK.zip
# ADD https://pkgman.jieliapp.com/s/linux-toolchain /toolchain.tar.xz
# RUN apt update && apt install -y \
# make unzip xz-utils python3 \
# && apt clean \
# && rm -rf /var/lib/apt/lists/* \
# && unzip SDK.zip -d /SDK && mv /SDK/*/* /SDK && rm /SDK.zip \
# && chmod +x /SDK/apps/app/post_build/bd47/isd_download /SDK/apps/app/post_build/bd47/ufw_maker \
# && mkdir /opt/jieli && tar -xf /toolchain.tar.xz -C /opt/jieli && rm /toolchain.tar.xz

# Without ADD
RUN apt update && apt install -y make unzip xz-utils python3 \
&& apt clean && rm -rf /var/lib/apt/lists/* \
&& git clone --depth=1 https://github.com/Jieli-Tech/fw-AW31N_BLE_SDK.git /SDK \
&& wget https://github.com/VolWaves/AW31N_BLE_SDK_linux/archive/refs/heads/main.zip --output-document /SDK.zip \
&& unzip SDK.zip -d /SDK && mv /SDK/*/* /SDK && rm /SDK.zip \
&& chmod +x /SDK/apps/app/post_build/bd47/isd_download /SDK/apps/app/post_build/bd47/ufw_maker \
&& wget https://pkgman.jieliapp.com/s/linux-toolchain --output-document /toolchain.tar.xz \
&& mkdir /opt/jieli && tar -xf /toolchain.tar.xz -C /opt/jieli && rm /toolchain.tar.xz

WORKDIR /SDK/apps/demo/project

CMD ["make"]
