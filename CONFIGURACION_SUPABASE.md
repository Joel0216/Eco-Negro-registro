# 🗄️ Configuración de Supabase - Eco Negro

## 📋 Información del Proyecto

**URL de Supabase:** `https://xcvrjpyuhqqsqlltuua1.supabase.co`
**Anon Key:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhjdnJqcHl1aHFxc3FsbHR1dWFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5MDg2NDUsImV4cCI6MjA3OTQ4NDY0NX0.chupqonmwwKw63utwJ703SCXLahdRopUvgzrxoLRiYk`

---

## 🔧 Configuración Inicial

### 1. Ejecutar Scripts SQL (En Orden)

Ve a Supabase → SQL Editor y ejecuta estos scripts en orden:

#### Script 1: Borrar Todo (Si necesitas resetear)
```sql
-- Archivo: 1_BORRAR_TODO.sql
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP TRIGGER IF EXISTS update_players_updated_at ON players;
DROP FUNCTION IF EXISTS public.handle_new_user() CASCADE;
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS players CASCADE;
```

#### Script 2: Crear Tablas
```sql
-- Archivo: 2_CREAR_TODO.sql
-- Ver archivo completo para el script
```

#### Script 3: Confirmar Emails Automáticamente
```sql
-- Archivo: 3_CONFIRMAR_EMAIL_AUTOMATICO.sql
-- Ver archivo completo para el script
```

---

## 📊 Estructura de Base de Datos

### Tabla: players
```sql
- id (UUID)
- user_id (UUID) → Referencia a auth.users
- username (TEXT) → Único
- email (TEXT)
- coins (INTEGER) → Monedas del jugador
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
```

### Tabla: transactions
```sql
- id (UUID)
- user_id (UUID) → Referencia a auth.users
- product_id (TEXT)
- product_name (TEXT)
- amount (DECIMAL)
- currency (TEXT) → Default: 'USD'
- status (TEXT) → 'pending', 'completed', 'failed', 'refunded'
- payment_method (TEXT) → Default: 'card'
- created_at (TIMESTAMP)
```

---

## 🔐 Seguridad Configurada

### Row Level Security (RLS)
- ✅ Habilitado en ambas tablas
- ✅ Los usuarios solo pueden ver sus propios datos
- ✅ Los usuarios solo pueden modificar sus propios datos

### Políticas Activas
1. "Los usuarios pueden ver su propio perfil"
2. "Los usuarios pueden actualizar su propio perfil"
3. "Los usuarios pueden insertar su propio perfil"
4. "Los usuarios pueden ver sus propias transacciones"
5. "Los usuarios pueden crear transacciones"

---

## 🔄 Triggers Configurados

### 1. Trigger de Registro Automático
**Función:** `handle_new_user()`
**Trigger:** `on_auth_user_created`
**Acción:** Cuando un usuario se registra, automáticamente:
- Crea un registro en la tabla `players`
- Asigna 0 monedas iniciales
- Confirma el email automáticamente

### 2. Trigger de Actualización
**Función:** `update_updated_at_column()`
**Trigger:** `update_players_updated_at`
**Acción:** Actualiza automáticamente `updated_at` cuando se modifica un jugador

---

## 🔧 Configuración en la App

### Archivo: lib/main.dart
```dart
const supabaseUrl = 'https://xcvrjpyuhqqsqlltuua1.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhjdnJqcHl1aHFxc3FsbHR1dWFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5MDg2NDUsImV4cCI6MjA3OTQ4NDY0NX0.chupqonmwwKw63utwJ703SCXLahdRopUvgzrxoLRiYk';
```

---

## 🧪 Verificar Configuración

### 1. Verificar Tablas
```sql
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;
```
Deberías ver:
- players
- transactions

### 2. Verificar Políticas
```sql
SELECT tablename, policyname FROM pg_policies WHERE schemaname = 'public';
```

### 3. Verificar Triggers
```sql
SELECT trigger_name, event_object_table 
FROM information_schema.triggers 
WHERE trigger_schema = 'public';
```

---

## 🔄 Resetear Base de Datos

Si necesitas empezar desde cero:

1. Ejecuta `1_BORRAR_TODO.sql`
2. Ejecuta `2_CREAR_TODO.sql`
3. Ejecuta `3_CONFIRMAR_EMAIL_AUTOMATICO.sql`
4. Borra usuarios desde Authentication → Users (si es necesario)

---

## 📝 Notas Importantes

### ⚠️ Seguridad
- **NO compartas** el `service_role` key públicamente
- El `anon key` es seguro para usar en el cliente
- Las políticas RLS protegen los datos

### 🔄 Confirmación de Email
- Los emails se confirman automáticamente
- No es necesario verificar emails manualmente
- Los usuarios pueden iniciar sesión inmediatamente después de registrarse

### 💾 Backup
- Supabase hace backups automáticos
- Puedes restaurar desde el dashboard
- Ve a Database → Backups

---

## 🚨 Solución de Problemas

### Error: "Table doesn't exist"
**Solución:** Ejecuta los scripts SQL en orden (1, 2, 3)

### Error: "Invalid API key"
**Solución:** Verifica que la URL y key estén correctas en `lib/main.dart`

### Error: "Email not confirmed"
**Solución:** Ejecuta `3_CONFIRMAR_EMAIL_AUTOMATICO.sql`

### Error: "Row level security policy"
**Solución:** Verifica que las políticas se crearon correctamente

---

## 📊 Límites del Plan Gratuito

- 500 MB de base de datos
- 1 GB de almacenamiento
- 2 GB de transferencia
- 50,000 usuarios activos mensuales

**Suficiente para:**
- Desarrollo completo
- MVP
- Primeros 1000-5000 usuarios

---

## 🔗 Enlaces Útiles

- **Dashboard:** https://supabase.com/dashboard
- **Documentación:** https://supabase.com/docs
- **SQL Editor:** https://supabase.com/dashboard/project/xcvrjpyuhqqsqlltuua1/sql

---

## ✅ Checklist de Configuración

- [x] Proyecto de Supabase creado
- [x] Scripts SQL ejecutados
- [x] Tablas creadas (players, transactions)
- [x] Políticas de seguridad configuradas
- [x] Triggers configurados
- [x] Confirmación automática de email activada
- [x] Credenciales configuradas en la app

---

**Todo está configurado y funcionando correctamente. 🎉**
