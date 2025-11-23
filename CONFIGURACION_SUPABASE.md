# ⚙️ Configuración de Supabase - Paso a Paso

## 📋 Resumen

Este documento te guía paso a paso para configurar Supabase para Eco Negro.

---

## 🚀 Paso 1: Crear Cuenta y Proyecto

### 1.1 Crear Cuenta
1. Ve a [supabase.com](https://supabase.com)
2. Haz clic en **"Start your project"**
3. Regístrate con:
   - GitHub (recomendado)
   - Google
   - Email

### 1.2 Crear Proyecto
1. Haz clic en **"New Project"**
2. Completa:
   - **Name:** `eco-negro` (o el nombre que prefieras)
   - **Database Password:** Genera una contraseña segura (guárdala)
   - **Region:** Elige la más cercana a tus usuarios
   - **Pricing Plan:** Free (suficiente para empezar)
3. Haz clic en **"Create new project"**
4. Espera 2-3 minutos mientras se inicializa

---

## 🔑 Paso 2: Obtener Credenciales

### 2.1 Encontrar tus Keys
1. En el dashboard de tu proyecto, ve a **Settings** (⚙️)
2. Haz clic en **API**
3. Encontrarás:

```
Project URL:
https://tuproyecto.supabase.co

anon public:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### 2.2 Copiar Credenciales
- Copia el **Project URL**
- Copia el **anon public** key (NO el service_role)

⚠️ **IMPORTANTE:** Nunca compartas tu `service_role` key públicamente.

---

## 🗄️ Paso 3: Configurar Base de Datos

### 3.1 Abrir SQL Editor
1. En el menú lateral, haz clic en **SQL Editor**
2. Haz clic en **"New query"**

### 3.2 Ejecutar Script
1. Abre el archivo `supabase_setup.sql` de este proyecto
2. Copia TODO el contenido
3. Pégalo en el editor SQL de Supabase
4. Haz clic en **"Run"** (▶️) o presiona `Ctrl+Enter`

### 3.3 Verificar Creación
Deberías ver mensajes como:
```
Success. No rows returned
CREATE TABLE
CREATE INDEX
CREATE POLICY
...
```

### 3.4 Verificar Tablas
1. Ve a **Table Editor** en el menú lateral
2. Deberías ver estas tablas:
   - ✅ players
   - ✅ transactions
   - ✅ player_inventory
   - ✅ achievements
   - ✅ player_achievements

---

## 🔐 Paso 4: Configurar Autenticación

### 4.1 Configurar Email Auth
1. Ve a **Authentication** → **Providers**
2. Asegúrate de que **Email** esté habilitado
3. Configuración recomendada:
   - ✅ Enable email confirmations: OFF (para desarrollo)
   - ✅ Enable email confirmations: ON (para producción)

### 4.2 Configurar URLs (Opcional)
1. Ve a **Authentication** → **URL Configuration**
2. Añade tus URLs:
   - Site URL: `http://localhost:3000` (desarrollo)
   - Redirect URLs: `http://localhost:3000/**`

Para producción, añade tu dominio real.

---

## 🌐 Paso 5: Configurar CORS (Importante para Web)

### 5.1 Añadir Dominios Permitidos
1. Ve a **Settings** → **API**
2. Scroll hasta **"CORS"**
3. Añade:
   - `http://localhost:*` (desarrollo)
   - Tu dominio de producción cuando lo tengas

---

## 💻 Paso 6: Configurar la Aplicación

### 6.1 Editar main.dart
Abre `lib/main.dart` y reemplaza las líneas 11-12:

```dart
await Supabase.initialize(
  url: 'https://tuproyecto.supabase.co',  // ← Pega tu Project URL aquí
  anonKey: 'eyJhbGc...',                   // ← Pega tu anon key aquí
);
```

### 6.2 Ejemplo Completo
```dart
await Supabase.initialize(
  url: 'https://xyzabcdefg.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5emFiY2RlZmciLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjc1ODQwMCwiZXhwIjoxOTQ4MzM0NDAwfQ.abc123xyz',
);
```

---

## ✅ Paso 7: Verificar Configuración

### 7.1 Ejecutar la App
```bash
flutter run -d chrome
```

### 7.2 Probar Registro
1. Haz clic en "Regístrate"
2. Completa el formulario:
   - Usuario: `test_user`
   - Email: `test@ejemplo.com`
   - Contraseña: `password123`
3. Haz clic en **REGISTRARSE**

### 7.3 Verificar en Supabase
1. Ve a **Authentication** → **Users**
2. Deberías ver tu usuario recién creado
3. Ve a **Table Editor** → **players**
4. Deberías ver un registro con tu información

---

## 🎯 Configuración Avanzada (Opcional)

### Habilitar Realtime
Si quieres actualizaciones en tiempo real:

1. Ve a **Database** → **Replication**
2. Habilita las tablas que necesites:
   - ✅ players
   - ✅ transactions

### Configurar Storage (Para imágenes)
Si necesitas subir imágenes de perfil:

1. Ve a **Storage**
2. Crea un bucket: `avatars`
3. Configura políticas de acceso

### Configurar Edge Functions (Avanzado)
Para lógica del lado del servidor:

1. Ve a **Edge Functions**
2. Crea funciones para:
   - Validar pagos
   - Procesar transacciones
   - Enviar emails

---

## 🐛 Solución de Problemas

### Error: "Invalid API key"
```
❌ Problema: Las credenciales no son correctas
✅ Solución:
   1. Verifica que copiaste la URL completa
   2. Verifica que copiaste el anon key completo
   3. No uses el service_role key
   4. Asegúrate de no tener espacios extra
```

### Error: "Table doesn't exist"
```
❌ Problema: El script SQL no se ejecutó correctamente
✅ Solución:
   1. Ve a SQL Editor en Supabase
   2. Ejecuta el script supabase_setup.sql completo
   3. Verifica que no haya errores en la consola
   4. Revisa que las tablas aparezcan en Table Editor
```

### Error: "Row Level Security"
```
❌ Problema: Las políticas de seguridad bloquean el acceso
✅ Solución:
   1. Verifica que ejecutaste TODO el script SQL
   2. Las políticas se crean automáticamente
   3. Revisa en Database → Policies
```

### Error: "CORS"
```
❌ Problema: El navegador bloquea las peticiones
✅ Solución:
   1. Ve a Settings → API → CORS
   2. Añade http://localhost:*
   3. Añade tu dominio de producción
```

---

## 📊 Verificar que Todo Funciona

### Checklist Final
- [ ] Proyecto de Supabase creado
- [ ] Credenciales copiadas
- [ ] Script SQL ejecutado sin errores
- [ ] Tablas visibles en Table Editor
- [ ] Email auth habilitado
- [ ] CORS configurado
- [ ] Credenciales en main.dart
- [ ] App ejecutándose
- [ ] Registro de usuario funciona
- [ ] Usuario aparece en Supabase
- [ ] Datos en tabla players

---

## 📝 Información Útil

### Límites del Plan Gratuito
- 500 MB de base de datos
- 1 GB de almacenamiento
- 2 GB de transferencia
- 50,000 usuarios activos mensuales

**Suficiente para:**
- Desarrollo completo
- MVP
- Primeros 1000-5000 usuarios

### Monitoreo
1. Ve a **Reports** para ver:
   - Usuarios activos
   - Uso de base de datos
   - Peticiones API
   - Errores

### Backups
1. Ve a **Database** → **Backups**
2. Los backups automáticos están habilitados
3. Puedes restaurar a cualquier punto

---

## 🎓 Recursos Adicionales

- **Documentación:** https://supabase.com/docs
- **Tutoriales:** https://supabase.com/docs/guides
- **Discord:** https://discord.supabase.com
- **YouTube:** Canal oficial de Supabase

---

## 🚀 Siguiente Paso

Una vez configurado Supabase, continúa con:
1. **INICIO_RAPIDO.md** - Para ejecutar la app
2. **INTEGRACION_PAGO.md** - Para configurar pagos
3. **DEPLOYMENT.md** - Para publicar tu app

---

**¡Configuración completada! 🎉**
