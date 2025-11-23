# 🚀 EJECUTA ESTO AHORA - Guía Visual

## 📋 Tienes 2 Scripts SQL

### 1️⃣ supabase_reset.sql
**¿Qué hace?** Borra TODAS las tablas antiguas (las complejas que no necesitas)

### 2️⃣ supabase_setup.sql  
**¿Qué hace?** Crea SOLO 2 tablas simples (players y transactions)

---

## ✅ PASO A PASO (3 minutos)

### PASO 1: Borrar Tablas Antiguas

```
1. Ve a Supabase (https://supabase.com)
2. Abre tu proyecto
3. Menú lateral → SQL Editor
4. Clic en "+ New query"
```

**Ahora copia y pega esto:**

Abre el archivo `supabase_reset.sql` y copia TODO su contenido.

Pégalo en el editor SQL de Supabase.

Haz clic en **Run** (▶️) o presiona **Ctrl+Enter**

**Deberías ver:**
```
✅ DROP VIEW player_stats
✅ DROP TABLE player_achievements
✅ DROP TABLE achievements
✅ DROP TABLE player_inventory
✅ DROP TABLE transactions
✅ DROP TABLE players
✅ DROP FUNCTION calculate_level
✅ DROP FUNCTION update_updated_at_column
```

---

### PASO 2: Crear Tablas Nuevas (Simplificadas)

```
1. En SQL Editor, clic en "+ New query" de nuevo
```

**Ahora copia y pega esto:**

Abre el archivo `supabase_setup.sql` y copia TODO su contenido.

Pégalo en el editor SQL de Supabase.

Haz clic en **Run** (▶️) o presiona **Ctrl+Enter**

**Deberías ver:**
```
✅ CREATE TABLE players
✅ CREATE TABLE transactions
✅ CREATE INDEX idx_players_user_id
✅ CREATE INDEX idx_players_username
✅ CREATE INDEX idx_transactions_user_id
✅ CREATE INDEX idx_transactions_status
✅ ALTER TABLE players ENABLE ROW LEVEL SECURITY
✅ ALTER TABLE transactions ENABLE ROW LEVEL SECURITY
✅ CREATE POLICY "Los usuarios pueden ver su propio perfil"
✅ CREATE POLICY "Los usuarios pueden actualizar su propio perfil"
✅ CREATE POLICY "Los usuarios pueden insertar su propio perfil"
✅ CREATE POLICY "Los usuarios pueden ver sus propias transacciones"
✅ CREATE POLICY "Los usuarios pueden crear transacciones"
✅ CREATE FUNCTION update_updated_at_column
✅ CREATE TRIGGER update_players_updated_at
```

Al final verás:
```
Tablas creadas:
- players
- transactions

Políticas creadas:
- Los usuarios pueden ver su propio perfil
- Los usuarios pueden actualizar su propio perfil
- Los usuarios pueden insertar su propio perfil
- Los usuarios pueden ver sus propias transacciones
- Los usuarios pueden crear transacciones
```

---

### PASO 3: Verificar en Table Editor

```
1. Menú lateral → Table Editor
2. Deberías ver SOLO 2 tablas:
```

#### ✅ Tabla: players
```
Columnas:
- id (UUID)
- user_id (UUID)
- username (TEXT)
- email (TEXT)
- coins (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
```

#### ✅ Tabla: transactions
```
Columnas:
- id (UUID)
- user_id (UUID)
- product_id (TEXT)
- product_name (TEXT)
- amount (DECIMAL)
- currency (TEXT)
- status (TEXT)
- payment_method (TEXT)
- created_at (TIMESTAMP)
```

---

## 🎯 Comparación: Antes vs Después

### ANTES (Complejo - NO lo necesitas):
```
❌ players (13 columnas con nivel, experiencia, victorias, etc.)
❌ transactions
❌ player_inventory (inventario de items)
❌ achievements (logros)
❌ player_achievements (logros desbloqueados)
❌ player_stats (vista)
```

### DESPUÉS (Simple - Lo que SÍ necesitas):
```
✅ players (7 columnas: solo usuario, email y monedas)
✅ transactions (9 columnas: historial de compras)
```

---

## 🐛 Si Algo Sale Mal

### Error: "relation already exists"
**Significa:** Las tablas ya existen
**Solución:** Ejecuta primero `supabase_reset.sql` para borrarlas

### Error: "cannot drop table because other objects depend on it"
**Significa:** Hay dependencias
**Solución:** El script `supabase_reset.sql` ya incluye CASCADE, ejecútalo completo

### No veo las tablas en Table Editor
**Solución:** 
1. Refresca la página (F5)
2. Ve a Table Editor de nuevo
3. Deberías ver players y transactions

---

## ✅ Checklist Final

- [ ] Ejecuté supabase_reset.sql
- [ ] Vi mensajes de "DROP TABLE"
- [ ] Ejecuté supabase_setup.sql
- [ ] Vi mensajes de "CREATE TABLE"
- [ ] Fui a Table Editor
- [ ] Veo SOLO 2 tablas: players y transactions
- [ ] La tabla players tiene 7 columnas
- [ ] La tabla transactions tiene 9 columnas

---

## 🚀 Siguiente Paso

Una vez que las tablas estén listas:

1. **Copia tus credenciales:**
   - Settings → API
   - Copia "Project URL"
   - Copia "anon public" key

2. **Configura la app:**
   - Abre `lib/main.dart`
   - Líneas 13-14
   - Pega tus credenciales

3. **Ejecuta:**
   ```bash
   flutter run -d chrome
   ```

---

## 📊 Resumen Visual

```
┌──────────────────────────────────────┐
│  1. BORRAR ANTIGUAS                  │
│     supabase_reset.sql               │
│     ↓                                │
│  2. CREAR NUEVAS                     │
│     supabase_setup.sql               │
│     ↓                                │
│  3. VERIFICAR                        │
│     Table Editor → 2 tablas          │
│     ↓                                │
│  4. CONFIGURAR APP                   │
│     lib/main.dart → credenciales     │
│     ↓                                │
│  5. EJECUTAR                         │
│     flutter run -d chrome            │
└──────────────────────────────────────┘
```

---

**¡Empieza ahora! Ejecuta supabase_reset.sql primero. 🚀**
