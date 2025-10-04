@echo off
echo ========================================
echo 🚀 INICIANDO ENTORNO DE ENTRENAMIENTO SQL
echo ========================================
echo.

:: Verificar si Docker está instalado
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker no está instalado o no está en el PATH
    echo 📥 Descarga Docker Desktop desde: https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

echo ✅ Docker detectado correctamente
echo.

:: Verificar si Docker está ejecutándose
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker no está ejecutándose
    echo 🔧 Inicia Docker Desktop y vuelve a ejecutar este script
    pause
    exit /b 1
)

echo ✅ Docker está ejecutándose
echo.

:: Levantar los servicios
echo 🐳 Levantando contenedores de base de datos...
docker-compose up -d

:: Esperar a que PostgreSQL esté listo
echo ⏳ Esperando a que PostgreSQL esté listo...
timeout /t 10 /nobreak >nul

:: Verificar estado de los contenedores
echo.
echo 📊 Estado de los servicios:
docker-compose ps

:: Verificar conectividad
echo.
echo 🔍 Verificando conectividad...
docker exec entrenosql_postgres pg_isready -U sqltrainer -d empresa
if %errorlevel% equ 0 (
    echo ✅ PostgreSQL está listo para recibir conexiones
) else (
    echo ⚠️  PostgreSQL aún se está iniciando, espera un momento más
)

echo.
echo ========================================
echo 🎉 ¡ENTORNO LISTO PARA ENTRENAR!
echo ========================================
echo.
echo 🌐 Adminer (Interfaz Web): http://localhost:8080
echo 📊 Datos de conexión:
echo    - Sistema: PostgreSQL
echo    - Servidor: postgres_db
echo    - Usuario: sqltrainer
echo    - Contraseña: sqltrainer123
echo    - Base de datos: empresa
echo.
echo 💡 Próximos pasos:
echo    1. Abre VS Code en esta carpeta
echo    2. Instala las extensiones recomendadas
echo    3. Configura la conexión a la base de datos
echo    4. ¡Comienza con los ejercicios!
echo.
echo ⚡ ¿Abrir Adminer ahora? (s/n)
set /p choice="Tu elección: "
if /i "%choice%"=="s" (
    start http://localhost:8080
)

echo.
echo ⚡ ¿Abrir VS Code ahora? (s/n)
set /p choice2="Tu elección: "
if /i "%choice2%"=="s" (
    code .
)

echo.
echo ✨ ¡Feliz entrenamiento SQL! ✨
pause