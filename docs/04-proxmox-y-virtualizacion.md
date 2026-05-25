# 04 - Proxmox y virtualización

## Rol de `hv01`

`hv01` es el hypervisor del laboratorio. Su función es alojar máquinas virtuales y/o contenedores para futuros servicios, sin mezclar aplicaciones directamente en el host.

## Trabajo realizado

| Tarea | Resultado |
|---|---|
| Normalización de hostname/FQDN | Host identificado de forma coherente |
| Revisión de interfaces y bridges | Eliminación de una red residual no utilizada |
| Gateway de administración | Consolidado en la LAN del laboratorio |
| Usuario Linux nominal | Acceso SSH con llave y `sudo` validado |
| Usuario de administración web | ACL administrativa aplicada |
| Estado inicial de cargas | Sin VMs/CTs antes de comenzar la siguiente fase |

## Modelo de bridge simplificado

```text
Interfaz física
     │
     ▼
Bridge de Proxmox
     │
     ├── Dirección de administración del host
     └── Interfaces virtuales de futuras VMs/CTs
```

Ejemplo sanitizado:

```text
vmbr0 → 10.70.10.10/24
gateway → 10.70.10.1
bridge-ports → interfaz física LAN
```

## Decisión de operación

No instalar servicios directamente sobre Proxmox. Esto permite:

- mantener el hypervisor limpio;
- aislar fallos;
- recrear servicios mediante VMs/CTs;
- respaldar recursos de forma consistente;
- aprender un flujo más cercano a entornos profesionales.

## Próxima implementación sugerida

Crear una VM Debian base:

| Parámetro | Valor inicial sugerido |
|---|---|
| Nombre | `srv-base01.lab.internal` |
| Sistema | Debian estable |
| Uso | Template de aprendizaje / clonación |
| Red | LAN interna del laboratorio |
| Acceso | SSH con llave |
| Backup | Definir antes de alojar datos importantes |

## Habilidades demostradas

- interpretación de bridges Linux;
- administración básica de Proxmox;
- control de acceso mediante roles;
- prudencia operativa al corregir red de un hypervisor remoto;
- planificación de despliegue antes de instalar servicios.
