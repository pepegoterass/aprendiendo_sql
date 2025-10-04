@echo off
cls
echo.
echo ████████████████████████████████████████████████████████████████
echo ██                                                            ██
echo ██    🚀 BOOTCAMP SQL: DE 0 A EXPERTO EN 8 HORAS 🚀          ██
echo ██                                                            ██
echo ████████████████████████████████████████████████████████████████
echo.
echo ⏰ CRONOGRAMA INTENSIVO:
echo    📚 Hora 1: Fundamentos y SELECT básico
echo    🔍 Hora 2: Filtros y operadores avanzados  
echo    📊 Hora 3: Funciones agregadas y GROUP BY
echo    🔗 Hora 4: JOINs y relaciones entre tablas
echo    🎯 Hora 5: Subconsultas y consultas complejas
echo    ⚡ Hora 6: Funciones de ventana y CTEs
echo    🛠️ Hora 7: Manipulación de datos (DML)
echo    🏆 Hora 8: Casos de uso reales y optimización
echo.
echo ════════════════════════════════════════════════════════════════
echo.

:: Verificar Docker
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker no detectado. Instala Docker Desktop primero.
    pause
    exit /b 1
)

:: Verificar si Docker está ejecutándose
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker no está ejecutándose. Inicia Docker Desktop.
    pause
    exit /b 1
)

echo ✅ Docker verificado correctamente
echo.

:: Levantar base de datos
echo 🐳 Iniciando base de datos PostgreSQL...
docker-compose up -d postgres_db adminer

echo ⏳ Esperando a que PostgreSQL esté listo...
timeout /t 15 /nobreak >nul

echo.
echo ✅ Verificando conectividad...
docker exec entrenosql_postgres pg_isready -U sqltrainer -d empresa
if %errorlevel% equ 0 (
    echo ✅ Base de datos lista para el bootcamp
) else (
    echo ⚠️  Base de datos aún iniciando... espera un momento
)

echo.
echo ════════════════════════════════════════════════════════════════
echo 🎯 BOOTCAMP INICIADO - INFORMACIÓN DE ACCESO:
echo ════════════════════════════════════════════════════════════════
echo.
echo 🌐 Adminer (Interfaz Web): http://localhost:8080
echo 📊 Datos de conexión:
echo    • Sistema: PostgreSQL
echo    • Servidor: postgres_db
echo    • Usuario: sqltrainer
echo    • Contraseña: sqltrainer123
echo    • Base de datos: empresa
echo.
echo 📁 Estructura del bootcamp:
echo    bootcamp/hora_01_fundamentos/    ← ¡EMPIEZA AQUÍ!
echo    bootcamp/hora_02_filtros/
echo    bootcamp/hora_03_agregaciones/
echo    bootcamp/hora_04_joins/
echo    bootcamp/hora_05_subconsultas/
echo    bootcamp/hora_06_avanzado/
echo    bootcamp/hora_07_dml/
echo    bootcamp/hora_08_experto/
echo.
echo ════════════════════════════════════════════════════════════════
echo 💡 CONSEJOS PARA EL ÉXITO:
echo ════════════════════════════════════════════════════════════════
echo.
echo 1️⃣  Dedica exactamente 1 hora a cada módulo
echo 2️⃣  Haz TODOS los ejercicios, no solo leerlos
echo 3️⃣  Usa prueba_rapida.sql para verificar tu entorno
echo 4️⃣  Toma un descanso de 30 min después de la hora 4
echo 5️⃣  No te saltes las evaluaciones al final de cada hora
echo.
echo ⏰ Hora actual: %time:~0,5%
echo 📝 Anota tu hora de inicio: ________________
echo 🎯 Meta: Ser experto SQL a las: ________________ (+8h)
echo.

set /p start="🚀 ¿Estás listo para comenzar tu transformación en SQL? (s/n): "
if /i "%start%"=="s" (
    echo.
    echo ✨ ¡EXCELENTE! Tu aventura SQL comienza AHORA
    echo.
    echo 🌐 Abriendo Adminer...
    start http://localhost:8080
    
    echo 📝 Abriendo VS Code...
    code .
    
    echo 📁 Abriendo primera hora...
    start "" "bootcamp\hora_01_fundamentos\"
    
    echo.
    echo ════════════════════════════════════════════════════════════════
    echo 🎯 HORA 1 INICIADA - FUNDAMENTOS DE SQL
    echo ════════════════════════════════════════════════════════════════
    echo.
    echo ⏰ Tiempo objetivo: 60 minutos
    echo 📚 Archivo: bootcamp/hora_01_fundamentos/ejercicios_hora1.sql
    echo 🎯 Objetivo: Dominar SELECT básico y estructura SQL
    echo.
    echo ¡VAMOS A CONQUISTAR SQL! 💪
    
) else (
    echo.
    echo 💡 No hay problema. Cuando estés listo, ejecuta este script de nuevo.
    echo    Recuerda: necesitas 8 horas continuas para mejores resultados.
)

echo.
echo ════════════════════════════════════════════════════════════════
pause