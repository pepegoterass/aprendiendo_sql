# 🎯 Entorno de Entrenamiento SQL con Docker

¡Bienvenido a tu entorno profesional de entrenamiento SQL!

## 📋 Configuración del Entorno

Este workspace incluye:

- **PostgreSQL en Docker**: Base de datos profesional containerizada
- **Adminer**: Interfaz web para administrar la base de datos
- **Datos realistas**: Más de 200 registros de muestra para practicar
- **Scripts organizados**: Ejercicios desde básico hasta avanzado
- **Extensiones VS Code**: Para ejecutar SQL directamente en el editor

## 🚀 Inicio Ultra-Rápido

### Opción 1: Script Automático (Recomendado)
```batch
# Doble clic en:
iniciar_entorno.bat
```

### Opción 2: Manual
```powershell
docker-compose up -d
```
Luego ve a http://localhost:8080

## 📁 Estructura del Proyecto

```
entrenosql/
├── database/
│   ├── empresa.db          # Base de datos SQLite
│   └── init_database.sql   # Script de inicialización
├── ejercicios/
│   ├── 01_basico/         # SELECT, WHERE, ORDER BY
│   ├── 02_intermedio/     # JOINs, GROUP BY, funciones
│   ├── 03_avanzado/       # Subconsultas, CTEs, ventanas
│   └── 04_dml/            # INSERT, UPDATE, DELETE
├── soluciones/            # Soluciones a los ejercicios
└── proyectos/             # Proyectos prácticos
```

## 🎯 Objetivos de Aprendizaje

- [x] Configuración del entorno
- [ ] Consultas básicas (SELECT, WHERE, ORDER BY)
- [ ] Filtrado y ordenamiento
- [ ] Funciones agregadas (COUNT, SUM, AVG)
- [ ] JOINs (INNER, LEFT, RIGHT, FULL)
- [ ] GROUP BY y HAVING
- [ ] Subconsultas
- [ ] CTEs (Common Table Expressions)
- [ ] Funciones de ventana
- [ ] Manipulación de datos (INSERT, UPDATE, DELETE)
- [ ] Creación de tablas e índices

## 💡 Consejos

- Usa `Ctrl+Shift+P` → "SQLite: Open Database" para conectar a la BD
- Selecciona tu consulta SQL y presiona `F5` para ejecutarla
- Experimenta con diferentes variaciones de las consultas
- No tengas miedo de cometer errores, ¡es parte del aprendizaje!

¡Comencemos a entrenar! 💪