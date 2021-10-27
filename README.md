# huayrari-live-iso-builder

Scripts para la construcción de la distribución Huayrari GNU/Linux. Estamos usando el proyecto [Huayra GNU/Linux - Instalador en LiveCD](https://github.com/HuayraLinux/live-cd) con algunas variaciones.

Requiere vagrant y Virtualbox.

Una vez levantado el entorno con 'vagrant up', podemos entrar en https://172.16.100.100:9090/system/terminal para ejecutar manualmente la construcción de la imagen.

Desde el directorio /opt/huayrari-live-build/live-build, ejecutar, por ejemplo:

* ARCH=i386 CACHER=127.0.0.1:3142 lb config
* ARCH=i386 CACHER=127.0.0.1:3142 lb build

Para mayor información leer el manual de live-build (http://live.debian.net/)

## Variables de entorno para la construcción de la imagen

* ARCH (obligatorio): Se debe definir de que arquitectura se genera la iso (amd64 o i386).
* CACHER (opcional): Si se usa el apt-cacher se debe cargar la variable con host y port del mismo:
* RELEASE_VERSION (opcional): Version del build, en un texto o número. En caso de no usar la variable, la misma es un timestamp, por ejemplo: huayra-amd64-201312231402.iso)
* DEBUG: Valor 1 para habilitar opciones de paquetes de debug, por ejemplo se agregan los paquetes guest para virtualbox y vmware.
* EFI: Valor 1 para crear una iso con los paquetes grub-efi en vez de grub-pc
* PROPOSED: Valor 1 para agregar repos proposed (por lo general para pruebas de actualizaciones)

Ejemplo:

```
root@buster:/opt/huayrari-live-iso-builder# ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta DEBUG=1 EFI=1 PROPOSED=1 lb config
root@buster:/opt/huayrari-live-iso-builder# ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta DEBUG=1 EFI=1 PROPOSED=1 lb build
```

## Limpieza del entorno

* Para limpiar archivos del build y cache:

  lb clean
  lb clean --cache

* Para limpiar completamente el entorno:

  lb clean --purge
