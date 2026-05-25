# 07 - Resultados y aprendizajes

## Resultado del proyecto

VPHUB quedó establecido como una base funcional de laboratorio para continuar practicando infraestructura IT sobre un entorno propio y controlado.

La primera etapa no estuvo orientada a desplegar aplicaciones, sino a construir los fundamentos correctamente:

- una red de laboratorio separada de la red de uso cotidiano;
- un router MikroTik encargado de gateway, DHCP, DNS interno y NAT;
- un switch administrable como núcleo de conexión física;
- un host Proxmox preparado para alojar futuros servicios;
- nodos Linux accesibles de forma consistente;
- administración remota mediante SSH con llave dedicada;
- documentación y backups antes de ampliar el entorno.

## Qué quedó operativo

| Área | Resultado |
|---|---|
| Red interna | LAN de laboratorio definida y funcional |
| Resolución de nombres | Hosts accesibles mediante nombres internos |
| Salida a Internet | Nodos del laboratorio con conectividad validada a través del router |
| Administración SSH | Acceso mediante llave dedicada en router, hypervisor y nodos Linux |
| Virtualización | Proxmox preparado para comenzar a desplegar VMs o contenedores |
| Switching | Puertos principales relevados y asociados a sus equipos |
| Documentación | Arquitectura, validaciones, ejemplos y roadmap publicados de forma sanitizada |

## Decisiones técnicas relevantes

### Separar el laboratorio de la red doméstica

El laboratorio se implementó sobre una red independiente, conservando la red doméstica existente para los dispositivos de uso diario. Esta decisión permitió avanzar sin interrumpir conectividad y mantener un entorno controlado para pruebas.

### Utilizar una identidad SSH exclusiva

Se creó una llave SSH específica para VPHUB, separada de las credenciales utilizadas para Git u otros accesos. Esto simplifica la administración y evita mezclar dominios de confianza.

### Preparar el hypervisor antes de instalar servicios

Antes de crear máquinas virtuales se revisó la identidad del host, su red administrativa, los accesos y las configuraciones residuales. El objetivo fue evitar construir servicios sobre una base desordenada.

### Documentar antes de escalar

El relevamiento de direccionamiento, puertos, roles y validaciones se realizó antes de incorporar servicios. De esta forma, el laboratorio puede crecer con una referencia clara de su estado inicial.

## Problemas encontrados y cómo se resolvieron

| Situación detectada | Análisis aplicado | Resultado |
|---|---|---|
| Existían llaves SSH previas sin propósito claramente identificado | Se verificaron comentarios y fingerprints antes de reutilizar credenciales | Se creó una llave dedicada al laboratorio |
| Los usuarios Linux existían, pero no tenían acceso por llave | Se revisaron homes, permisos y `authorized_keys` | Acceso SSH consistente en los nodos |
| El usuario administrativo del hypervisor no podía elevar privilegios inicialmente | Se comprobó el comando real y no solo la pertenencia a grupos | Administración mediante `sudo` validada |
| El FQDN del hypervisor no coincidía con el dominio definido | Se verificó primero el estado del nodo y la ausencia de cluster | Identidad del host normalizada |
| Existía una red residual en Proxmox | Se confirmó qué bridge sostenía la administración antes de modificar | Configuración de red simplificada sin perder acceso |
| No estaba documentado qué equipo ocupaba cada puerto del switch | Se cruzaron MAC addresses de hosts con la tabla del switch | Mapa físico del laboratorio identificado |
| Un error de edición afectó el archivo SSH local | Se realizó backup, inspección y validación de sintaxis | Acceso recuperado sin afectar el laboratorio |

## Validaciones utilizadas

Durante la implementación, cada avance se comprobó con pruebas simples y repetibles:

| Validación | Propósito |
|---|---|
| Resolución DNS interna | Confirmar acceso por nombres y no solo por IP |
| Ping al gateway | Confirmar conectividad local hacia el router |
| Ping a una IP pública | Verificar salida a Internet sin depender de DNS |
| Consulta DNS externa | Validar resolución mediante el router |
| Solicitud HTTPS | Confirmar conectividad útil para actualizaciones y repositorios |
| SSH remoto | Verificar acceso administrativo seguro |
| Revisión de rutas | Confirmar separación entre red cotidiana y red de laboratorio |
| Tabla MAC del switch | Identificar topología física sin interrumpir servicios |

## Conocimientos aplicados

```text
MikroTik RouterOS
Proxmox VE
Linux Debian / Arch Linux
SSH con llaves Ed25519
DNS, DHCP y NAT
Switching administrable
Troubleshooting de red y sistemas
Documentación Markdown y control de versiones con Git
```

## Qué sigue

La infraestructura ya está preparada para pasar de la etapa de base a la etapa de servicios. Los siguientes pasos planificados son:

1. Crear una VM Debian base en Proxmox.
2. Definir un esquema de direccionamiento para servicios virtualizados.
3. Incorporar monitoreo de disponibilidad y recursos.
4. Establecer backups de VMs y pruebas de restauración.
5. Evaluar segmentación adicional mediante VLANs a medida que crezca el laboratorio.

## Cierre

Este proyecto permitió transformar equipos disponibles en una infraestructura de laboratorio ordenada, administrable y documentada. El valor principal no está solamente en que la red funcione, sino en haber aplicado un proceso de trabajo basado en relevamiento, cambios controlados, validación, respaldo y documentación.
