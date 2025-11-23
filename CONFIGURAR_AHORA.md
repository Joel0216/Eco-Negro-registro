# 🚨 CONFIGURACIÓN URGENTE - Lee Esto Primero

## ⚠️ Error Actual

Estás viendo un error porque **las credenciales de Supabase no están configuradas**.

---

## ✅ Solución en 3 Pasos (5 minutos)

### Paso 1: Crear Proyecto en Supabase (2 minutos)

1. **Ve a:** https://supabase.com
2. **Haz clic en:** "Start your project"
3. **Regístrate con:** GitHub, Google o Email
4. **Crea un nuevo proyecto:**
   - Name: `eco-negro` (o el que quieras)
   - Database Password: Genera una (guárdala)
   - Region: Elige la más cercana
   - Plan: Free
5. **Espera 2-3 minutos** mientras se crea

---

### Paso 2: Configurar Base de Datos (1 minuto)

1. **En Supabase, ve a:** SQL Editor (menú lateral)
2. **Haz clic en:** "New query"
3. **Abre el archivo:** `supabase_setup.sql` (está en la raíz del proyecto)
4. **Copia TODO el contenido** del archivo
5. **Pégalo** en el editor SQL de Supabase
6. **Haz clic en:** Run (▶️) o presiona Ctrl+Enter
7. **Verifica:** Deberías ver "Success. No rows returned"

---

### Paso 3: Copiar Credenciales (1 minuto)

1. **En Supabase, ve a:** Settings (⚙️) → API
2. **Copia estos dos valores:**

```
Project URL:
https://tuproyecto.supabase.co

anon public:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

3. **Abre:** `lib/main.dart`
4. **Busca las líneas 13-14:**

```dart
const supabaseUrl = 'TU_SUPABASE_URL';
const supabaseAnonKey = 'TU_SUPABASE_ANON_KEY';
```

5. **Reemplaza con tus valores:**

```dart
const supabaseUrl = 'https://tuproyecto.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

6. **Guarda el archivo** (Ctrl+S)

---

## 🚀 Ejecutar de Nuevo

```bash
# Detén la app actual (Ctrl+C en la terminal)
# Luego ejecuta:
flutter run -d chrome
```

---

## ✅ Verificar que Funciona

1. La app debería cargar sin errores
2. Deberías ver la pantalla de login/registro
3. Intenta crear una cuenta de prueba:
   - Usuario: `test_user`
   - Email: `test@ejemplo.com`
   - Contraseña: `password123`
4. Si funciona, verás el dashboard

---

## 🐛 Si Aún Hay Errores

### Error: "Invalid API key"
- Verifica que copiaste la URL completa
- Verifica que copiaste el anon key completo (es muy largo)
- NO uses el service_role key

### Error: "Table doesn't exist"
- Asegúrate de ejecutar TODO el script SQL
- Ve a Table Editor en Supabase
- Deberías ver 5 tablas: players, transactions, player_inventory, achievements, player_achievements

### Error: "CORS"
1. Ve a Settings → API en Supabase
2. Scroll hasta "CORS"
3. Añade: `http://localhost:*`

---

## 📖 Documentación Completa

Una vez que funcione, lee estos archivos para más información:

- **INICIO_RAPIDO.md** - Guía completa de setup
- **CONFIGURACION_SUPABASE.md** - Detalles de Supabase
- **INTEGRACION_PAGO.md** - Para integrar pagos reales

---

## 💡 Ejemplo Visual

**ANTES (lo que tienes ahora):**
```dart
const supabaseUrl = 'TU_SUPABASE_URL';  ❌
const supabaseAnonKey = 'TU_SUPABASE_ANON_KEY';  ❌
```

**DESPUÉS (lo que necesitas):**
```dart
const supabaseUrl = 'https://xyzabcdefg.supabase.co';  ✅
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5emFiY2RlZmciLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjc1ODQwMCwiZXhwIjoxOTQ4MzM0NDAwfQ.abc123xyz';  ✅
```

---

## 🎯 Resumen Ultra Rápido

```bash
1. supabase.com → Crear proyecto
2. SQL Editor → Ejecutar supabase_setup.sql
3. Settings → API → Copiar URL y anon key
4. lib/main.dart → Pegar credenciales
5. flutter run -d chrome
```

---

## ⏱️ Tiempo Total: 5 minutos

No te saltes ningún paso. Una vez configurado, todo funcionará perfectamente.

---

**¿Listo? Empieza con el Paso 1 ahora mismo. 👆**
