# 🔄 Cómo Resetear la Base de Datos

## 📋 Pasos para Borrar Tablas Antiguas y Crear las Nuevas

### Opción 1: Usando el Script de Reset (Recomendado) ⭐

#### Paso 1: Borrar Tablas Antiguas

1. **Ve a Supabase** → SQL Editor
2. **Haz clic en** "New query"
3. **Abre el archivo** `supabase_reset.sql`
4. **Copia TODO el contenido**
5. **Pégalo** en el editor SQL
6. **Haz clic en** Run (▶️)

Deberías ver:
```
✅ DROP VIEW
✅ DROP TABLE
✅ DROP TABLE
✅ DROP TABLE
✅ DROP FUNCTION
```

#### Paso 2: Crear Tablas Nuevas (Simplificadas)

1. **En el mismo SQL Editor**, haz clic en "New query"
2. **Abre el archivo** `supabase_setup.sql`
3. **Copia TODO el contenido**
4. **Pégalo** en el editor SQL
5. **Haz clic en** Run (▶️)

Deberías ver:
```
✅ CREATE TABLE players
✅ CREATE TABLE transactions
✅ CREATE INDEX
✅ CREATE POLICY
```

---

### Opción 2: Borrar Manualmente desde la Interfaz

#### Paso 1: Ir a Table Editor

1. **Ve a Supabase**
2. **Haz clic en** "Table Editor" en el menú lateral

#### Paso 2: Borrar Cada Tabla

Para cada tabla que veas:

1. **Haz clic** en los 3 puntos (⋮) al lado del nombre de la tabla
2. **Selecciona** "Delete table"
3. **Confirma** la eliminación

Borra en este orden:
1. `player_achievements`
2. `achievements`
3. `player_inventory`
4. `transactions`
5. `players`

#### Paso 3: Crear Tablas Nuevas

1. **Ve a** SQL Editor
2. **Ejecuta** el script `supabase_setup.sql` completo

---

### Opción 3: Script SQL Manual (Avanzado)

Si prefieres escribir el SQL tú mismo:

```sql
-- Borrar todo
DROP TABLE IF EXISTS player_achievements CASCADE;
DROP TABLE IF EXISTS achievements CASCADE;
DROP TABLE IF EXISTS player_inventory CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP VIEW IF EXISTS player_stats;
DROP FUNCTION IF EXISTS calculate_level(INTEGER);
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;
```

Luego ejecuta `supabase_setup.sql`

---

## ✅ Verificar que Funcionó

### Después de ejecutar ambos scripts:

1. **Ve a** Table Editor
2. **Deberías ver SOLO 2 tablas:**
   - ✅ `players`
   - ✅ `transactions`

3. **Haz clic en** `players`
4. **Deberías ver estas columnas:**
   - id
   - user_id
   - username
   - email
   - coins
   - created_at
   - updated_at

5. **Haz clic en** `transactions`
6. **Deberías ver estas columnas:**
   - id
   - user_id
   - product_id
   - product_name
   - amount
   - currency
   - status
   - payment_method
   - created_at

---

## 🐛 Solución de Problemas

### Error: "cannot drop table because other objects depend on it"

**Solución:** Usa `CASCADE` en el DROP:
```sql
DROP TABLE players CASCADE;
```

O usa el script `supabase_reset.sql` que ya incluye CASCADE.

### Error: "table does not exist"

**Solución:** Ignóralo, significa que esa tabla ya no existe. Continúa con el siguiente paso.

### Las tablas no se borran

**Solución:**
1. Ve a Table Editor
2. Bórralas manualmente una por una
3. Luego ejecuta `supabase_setup.sql`

---

## 📊 Comparación: Antes vs Después

### ANTES (Complejo):
```
✗ players (13 columnas)
✗ transactions (9 columnas)
✗ player_inventory
✗ achievements
✗ player_achievements
✗ player_stats (vista)
```

### DESPUÉS (Simplificado):
```
✓ players (7 columnas)
✓ transactions (9 columnas)
```

---

## 🎯 Resumen Visual

```
┌─────────────────────────────────────────┐
│                                         │
│  1. BORRAR TABLAS ANTIGUAS              │
│     └─ Ejecutar supabase_reset.sql     │
│                                         │
│  2. CREAR TABLAS NUEVAS                 │
│     └─ Ejecutar supabase_setup.sql     │
│                                         │
│  3. VERIFICAR                           │
│     └─ Table Editor → Ver 2 tablas     │
│                                         │
└─────────────────────────────────────────┘
```

---

## ⏱️ Tiempo Total: 2 minutos

1. Ejecutar `supabase_reset.sql` (30 seg)
2. Ejecutar `supabase_setup.sql` (30 seg)
3. Verificar en Table Editor (1 min)

---

## 📝 Checklist

- [ ] Abrí SQL Editor en Supabase
- [ ] Ejecuté supabase_reset.sql
- [ ] Vi mensajes de "DROP TABLE"
- [ ] Ejecuté supabase_setup.sql
- [ ] Vi mensajes de "CREATE TABLE"
- [ ] Verifiqué en Table Editor
- [ ] Solo veo 2 tablas (players y transactions)
- [ ] La tabla players tiene 7 columnas
- [ ] La tabla transactions tiene 9 columnas

---

## 🚀 Siguiente Paso

Una vez que las tablas estén listas:

1. Configura las credenciales en `lib/main.dart`
2. Ejecuta `flutter run -d chrome`
3. Crea una cuenta de prueba
4. ¡Listo!

---

**¡Usa el script supabase_reset.sql para borrar todo de forma segura! 🔄**
