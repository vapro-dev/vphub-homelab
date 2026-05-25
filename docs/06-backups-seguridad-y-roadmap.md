# 06 - Backups, seguridad y roadmap

## Backups aplicados

Antes de considerar finalizada la etapa de red y accesos se generaron respaldos de configuración.

| Componente | Tipo de respaldo |
|---|---|
| Router MikroTik | Export legible sanitizable + backup binario cifrado |
| Switch administrable | Backup de configuración desde interfaz web |
| Proxmox | Política pendiente antes de alojar VMs con datos |

## Regla de publicación

Este repositorio público solo documenta el procedimiento. No incluye:

```text
contraseñas
llaves SSH
exports reales
backups binarios
MAC addresses reales
inventario exacto del entorno privado
```

## Seguridad pendiente

La red ya funciona, pero el hardening es una fase aparte. Pendientes:

| Área | Próxima revisión |
|---|---|
| MikroTik `input` firewall | Limitar administración y DNS a redes esperadas |
| Servicios del router | Revisar WinBox/SSH/HTTP disponibles |
| Switch core | Evaluar HTTPS, firmware y credenciales |
| Hosts Linux | Evaluar deshabilitar password SSH con recovery probado |
| Backups | Guardar copia externa y realizar prueba de restauración |
| Segmentación | Diseñar VLANs si se agregan servicios o dispositivos no confiables |

## Roadmap técnico

### Fase 2 — Virtualización
- Crear VM Debian base.
- Definir esquema de IPs para servicios.
- Preparar backups de VMs/CTs.

### Fase 3 — Observabilidad
- Implementar monitoreo de disponibilidad.
- Registrar pérdida, latencia y caídas.
- Crear dashboard básico de infraestructura.

### Fase 4 — Segmentación
- Diseñar VLAN de administración.
- Separar servicios, pruebas y dispositivos finales.
- Validar reglas de firewall inter-VLAN.

### Fase 5 — Automatización
- Inventario versionado.
- Scripts de chequeo.
- Posible uso de Ansible para configuración repetible.

## Mirada profesional

El valor de este laboratorio no está solamente en los equipos usados, sino en el método:

1. Diseñar.
2. Implementar de a poco.
3. Validar.
4. Documentar.
5. Respaldar.
6. Recién después ampliar.
