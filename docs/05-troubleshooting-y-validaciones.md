# 05 - Troubleshooting y validaciones

## Enfoque utilizado

El proyecto se implementó de forma incremental. Después de cada cambio se verificó el resultado antes de avanzar.

## Ejemplos de problemas resueltos

### 1. Acceso SSH: identificar una llave existente antes de reutilizarla

Antes de usar una llave preexistente se verificó su comentario y fingerprint. Al no poder asociarla con seguridad al laboratorio, se creó una llave nueva y dedicada.

**Aprendizaje:** no reutilizar credenciales solo porque “ya están ahí”.

### 2. Usuario administrativo existente, pero sin `authorized_keys`

Los nodos ya tenían usuario nominal, pero aún no tenían la carpeta `.ssh` preparada. Se instaló la clave pública, se ajustaron permisos y recién después se probó el acceso.

**Validación:**

```bash
ssh -i ~/.ssh/lab_ed25519 admin-lab@host 'hostname; whoami; id'
```

### 3. `sudo` no disponible en el hypervisor

El usuario pertenecía al grupo administrativo, pero el comando `sudo` no estaba instalado en el host. La prueba detectó el problema antes de asumir que la administración estaba lista.

**Aprendizaje:** validar el resultado real; no confiar solo en membresías de grupo.

### 4. FQDN inconsistente

El hostname corto era correcto, pero el FQDN tenía un dominio mal escrito. Se verificó que el nodo de virtualización no estuviera en cluster antes de corregir la resolución local.

**Aprendizaje:** en infraestructura, un “cambio simple de nombre” puede afectar dependencias.

### 5. Bridge residual en Proxmox

Se detectó una interfaz/bridge con una red antigua y un puerto físico inexistente. Antes de retirarlo se confirmó que el bridge operativo y el gateway estaban en otra interfaz.

**Aprendizaje:** no eliminar configuración de red remota hasta confirmar por dónde se sostiene la sesión.

### 6. Identificación de cableado por tabla MAC

En lugar de desconectar equipos al azar, se consultaron MAC addresses de los hosts y se cruzaron con la tabla del switch administrable.

**Aprendizaje:** obtener evidencia antes de tocar cableado.

### 7. Configuración SSH local mal editada

Una línea de comando quedó accidentalmente dentro de `~/.ssh/config`, provocando un error de sintaxis. Se creó backup, se inspeccionaron líneas numeradas, se eliminó la entrada incorrecta y se validó con `ssh -G`.

**Aprendizaje:** siempre validar archivos de configuración y conservar copia previa.

## Matriz de validación final

| Control | Herramienta / comando |
|---|---|
| Resolución interna | `getent hosts host.lab.internal` |
| Ruta hacia Internet | `ip route get 1.1.1.1` |
| Ruta al laboratorio | `ip route get IP_DEL_LAB` |
| Gateway desde nodo | `ping -c 2 GATEWAY_LAB` |
| DNS externo | `getent hosts debian.org` |
| HTTPS | `curl -I https://deb.debian.org` |
| Acceso SSH | `ssh alias 'hostname -f; whoami'` |
| Web Proxmox | Validación TCP/HTTPS al puerto de gestión |
