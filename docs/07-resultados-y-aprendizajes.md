# 07 - Aprendizajes y presentación profesional

## Cómo presentaría este proyecto

Este homelab es una experiencia práctica de infraestructura IT en la que diseñé y dejé operativa una red separada de laboratorio, con routing, DNS interno, NAT, virtualización y administración segura por SSH.

No partí de una solución cerrada: fui relevando el estado real de cada componente, resolviendo inconsistencias y documentando los cambios hasta tener una base estable para desplegar servicios.

## Lo que pude practicar

- Armar una topología física con roles claros.
- Configurar un router MikroTik para una LAN propia.
- Mantener separado el tráfico cotidiano de la red de prácticas.
- Administrar Linux mediante usuarios y llaves SSH.
- Resolver errores reales de configuración y validar cada solución.
- Preparar un hypervisor Proxmox sin instalar servicios directamente sobre el host.
- Documentar infraestructura de forma entendible y segura para publicación.

## Cómo lo contaría en una entrevista

> Armé un homelab llamado VPHUB para practicar infraestructura de manera integral. Separé una LAN de laboratorio detrás de un MikroTik, usé un switch administrable como core, configuré DNS interno y salida NAT, normalicé accesos SSH con una llave dedicada y preparé un host Proxmox para desplegar servicios. Durante la implementación resolví problemas de hostname, bridges residuales, permisos administrativos y mapeo físico por MAC table. Dejé documentación y backups antes de avanzar con servicios.

## Qué aprendí más allá de los comandos

- La diferencia entre que algo “responda” y que esté administrado correctamente.
- La importancia de tener acceso de recuperación antes de endurecer autenticación.
- Que documentar a medida que se construye evita perder contexto.
- Que una red sencilla puede crecer ordenadamente si se definen roles, nombres e IPs desde el inicio.
- Que para mostrar conocimientos también hay que sanitizar lo publicado.

## Posibles bullets para CV o perfil

- Diseñé e implementé un homelab segmentado con MikroTik, switch administrable, Proxmox VE y nodos Linux.
- Configuré DNS interno, DHCP, NAT y acceso SSH basado en claves para administración segura de infraestructura.
- Normalicé networking y control de acceso en Proxmox, preparando el entorno para el despliegue de servicios virtualizados.
- Documenté topología, validaciones, troubleshooting y estrategia inicial de backup con enfoque operativo.

## Tecnologías

```text
MikroTik RouterOS · Linux Debian/Arch · SSH/Ed25519 · Proxmox VE
DNS/DHCP/NAT · Switching administrable · Markdown · Git/GitHub
```
