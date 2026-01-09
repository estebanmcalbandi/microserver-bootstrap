# Microserver Bootstrap TrueNAS

Microserver Bootstrap te permite crear una unidad USB o una tarjeta microSD que permita que tu Microserver Gen8 arranque desde el puerto SATA ODD.

Esta configuración se usa cuando quieras usar el servidor en modo AHCI SATA en lugar de usar el controlador RAID B120i.

Al usar el Modo SATA AHCI, el servidor podrá arrancar tanto desde USB/microSD como desde el puerto SATA1 (la primera bahía de HDD).



## Requirements

 * `grub2-tools`
 * USB Flash drive or microSD card of at least 256MB capacity.

## Usage

Antes de lanzar el escript `create-disk.sh`, **PLEASE** asegurate de que el argumento /dev/sdX (dispositivo que apunta al pendrive) es correcto.

```
./create-disk.sh /dev/sdX
```
