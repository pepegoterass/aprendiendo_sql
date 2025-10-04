# 🚀 Guía de Instalación y Configuración

## 📋 Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

1. **Docker Desktop** - [Descargar aquí](https://www.docker.com/products/docker-desktop/)
2. **VS Code** - [Descargar aquí](https://code.visualstudio.com/)

## ⚡ Inicio Rápido

### 1. Levantar la Base de Datos

Abre PowerShell en el directorio del proyecto y ejecuta:

```powershell
# Levantar PostgreSQL y Adminer
docker-compose up -d

# Ver el estado de los contenedores
docker-compose ps

# Ver los logs (opcional)
docker-compose logs postgres_db
```

### 2. Verificar que Funciona

- **Adminer (Interfaz Web)**: http://localhost:8080
  - **Sistema**: PostgreSQL
  - **Servidor**: postgres_db
  - **Usuario**: sqltrainer
  - **Contraseña**: sqltrainer123
  - **Base de datos**: empresa

### 3. Instalar Extensiones de VS Code

Instala estas extensiones esenciales:

```
- PostgreSQL (ckolkman.vscode-postgres)
- SQLTools (mtxr.sqltools)
- SQLTools PostgreSQL Driver (mtxr.sqltools-driver-pg)
```

### 4. Conectar VS Code a la Base de Datos

1. Presiona `Ctrl+Shift+P`
2. Busca "SQLTools: Add New Connection"
3. Selecciona "PostgreSQL"
4. Configura la conexión:
   - **Connection name**: EntrenoSQL
   - **Server**: localhost
   - **Port**: 5432
   - **Database**: empresa
   - **Username**: sqltrainer
   - **Password**: sqltrainer123

## 🎯 Empezar a Entrenar

### Opción 1: Usar VS Code (Recomendado)
1. Abre cualquier archivo `.sql` de la carpeta `ejercicios/`
2. Asegúrate de estar conectado a la base de datos
3. Selecciona tu consulta SQL
4. Presiona `Ctrl+E, E` para ejecutar

### Opción 2: Usar Adminer (Interfaz Web)
1. Ve a http://localhost:8080
2. Inicia sesión con las credenciales
3. Copia y pega tus consultas en la pestaña "SQL command"

## 🛠️ Comandos Útiles de Docker

```powershell
# Ver contenedores ejecutándose
docker ps

# Parar todos los servicios
docker-compose down

# Reiniciar solo la base de datos
docker-compose restart postgres_db

# Ver logs en tiempo real
docker-compose logs -f postgres_db

# Conectarse directamente a PostgreSQL
docker exec -it entrenosql_postgres psql -U sqltrainer -d empresa

# Backup de la base de datos
docker exec entrenosql_postgres pg_dump -U sqltrainer empresa > backup.sql

# Restaurar backup
docker exec -i entrenosql_postgres psql -U sqltrainer empresa < backup.sql
```

## 🔧 Alternativa con MySQL

Si prefieres usar MySQL en lugar de PostgreSQL:

```powershell
# Levantar MySQL en lugar de PostgreSQL
docker-compose --profile mysql up -d mysql_db adminer

# Conexión MySQL:
# - Sistema: MySQL
# - Servidor: mysql_db
# - Usuario: sqltrainer
# - Contraseña: sqltrainer123
# - Base de datos: empresa
```

## 🚨 Solución de Problemas

### Puerto 5432 ocupado
```powershell
# Ver qué está usando el puerto
netstat -ano | findstr 5432

# Cambiar el puerto en docker-compose.yml
# "5433:5432" en lugar de "5432:5432"
```

### Contenedor no inicia
```powershell
# Ver logs detallados
docker-compose logs postgres_db

# Limpiar y reiniciar
docker-compose down -v
docker-compose up -d
```

### Error de conexión en VS Code
1. Verifica que el contenedor esté ejecutándose: `docker ps`
2. Prueba la conexión en Adminer primero
3. Reinicia VS Code y reconecta

## 🎓 Siguientes Pasos

1. ✅ Verifica que puedes conectarte a http://localhost:8080
2. ✅ Instala las extensiones de VS Code
3. ✅ Configura la conexión en SQLTools
4. ✅ Ejecuta tu primera consulta: `SELECT * FROM empleados LIMIT 5;`
5. 🚀 ¡Comienza con los ejercicios en `ejercicios/01_basico/`!

## 💡 Consejos Pro

- Usa `Ctrl+Shift+P` → "SQLTools: Run Query" para ejecutar consultas
- Los resultados aparecen en la pestaña "SQLTools Results"
- Puedes guardar consultas favoritas como snippets
- Usa el explorador de base de datos para ver la estructura de tablas

¡Ya tienes todo listo para convertirte en un maestro de SQL! 🏆