# 🔄 Resetear Base de Datos Completamente

## 📋 Pasos para Empezar Desde Cero

### PASO 1: Borrar TODO ❌

1. **Ve a Supabase** → SQL Editor
2. **Clic en "+ New query"**
3. **Abre el archivo:** `1_BORRAR_TODO.sql`
4. **Copia TODO el contenido**
5. **Pégalo en el editor SQL**
6. **Haz clic en Run** (▶️)

**Deberías ver:**
```
✅ DROP TRIGGER on_auth_user_created
✅ DROP TRIGGER update_players_updated_at
✅ DROP FUNCTION handle_new_user
✅ DROP FUNCTION update_updated_at_column
✅ DROP TABLE transactions
✅ DROP TABLE players
```

**Verificación:**
- Ve a **Table Editor**
- NO deberías ver ninguna tabla (players y transactions desaparecieron)

---

### PASO 2: Crear TODO ✅

1. **En SQL Editor, clic en "+ New query"** de nuevo
2. **Abre el archivo:** `2_CREAR_TODO.sql`
3. **Copia TODO el contenido**
4. **Pégalo en el editor SQL**
5. **Haz clic en Run** (▶️)

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
✅ CREATE FUNCTION handle_new_user
✅ CREATE TRIGGER on_auth_user_created
```

**Al final verás:**
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

Funciones creadas:
- handle_new_user
- update_updated_at_column

Triggers creados:
- on_auth_user_created
- update_players_updated_at
```

---

### PASO 3: Borrar Usuarios de Authentication (Opcional)

Si también quieres borrar los usuarios de prueba:

1. **Ve a Authentication** → **Users**
2. **Para cada usuario:**
   - Haz clic en los 3 puntos (⋮)
   - Selecciona "Delete user"
   - Confirma

---

### PASO 4: Verificar en Table Editor

1. **Ve a Table Editor**
2. **Deberías ver SOLO 2 tablas:**
   - ✅ players (vacía)
   - ✅ transactions (vacía)

3. **Haz clic en "players"**
4. **Verifica las columnas:**
   - id
   - user_id
   - username
   - email
   - coins
   - created_at
   - updated_at

---

### PASO 5: Probar el Registro

1. **Vuelve a tu app** en Chrome
2. **Recarga la página** (F5)
3. **Regístrate con un usuario nuevo:**
   - Usuario: test_user
   - Email: test@ejemplo.com
   - Contraseña: password123
4. **Haz clic en REGISTRARSE**
5. **Deberías ver:**
   - ✅ Mensaje: "¡Cuenta creada! Ahora inicia sesión"
   - ✅ Cambio automático a "Iniciar Sesión"

6. **Inicia sesión:**
   - Email: test@ejemplo.com
   - Contraseña: password123
7. **Haz clic en ENTRAR**
8. **Deberías ver:**
   - ✅ Dashboard con tu perfil
   - ✅ Monedas: 0

---

### PASO 6: Verificar en Supabase

1. **Authentication → Users**
   - Deberías ver: test@ejemplo.com

2. **Table Editor → players**
   - Deberías ver 1 registro:
     - username: test_user
     - email: test@ejemplo.com
     - coins: 0

3. **Table Editor → transactions**
   - Vacía (hasta que hagas una compra)

---

## 🎯 Resumen Visual

```
┌──────────────────────────────────────┐
│  1. BORRAR TODO                      │
│     Ejecutar: 1_BORRAR_TODO.sql     │
│     ↓                                │
│  2. CREAR TODO                       │
│     Ejecutar: 2_CREAR_TODO.sql      │
│     ↓                                │
│  3. BORRAR USUARIOS (opcional)       │
│     Authentication → Delete users    │
│     ↓                                │
│  4. VERIFICAR                        │
│     Table Editor → 2 tablas vacías   │
│     ↓                                │
│  5. PROBAR REGISTRO                  │
│     Crear usuario nuevo              │
│     ↓                                │
│  6. VERIFICAR EN SUPABASE            │
│     Ver usuario y datos creados      │
└──────────────────────────────────────┘
```

---

## ⏱️ Tiempo Total: 3 minutos

- Paso 1: 30 segundos
- Paso 2: 1 minuto
- Paso 3: 30 segundos (opcional)
- Paso 4: 30 segundos
- Paso 5: 30 segundos

---

## ✅ Checklist

- [ ] Ejecuté 1_BORRAR_TODO.sql
- [ ] Vi mensajes de DROP TABLE
- [ ] Verifiqué que no hay tablas en Table Editor
- [ ] Ejecuté 2_CREAR_TODO.sql
- [ ] Vi mensajes de CREATE TABLE
- [ ] Verifiqué que hay 2 tablas en Table Editor
- [ ] Borré usuarios de Authentication (opcional)
- [ ] Probé el registro con usuario nuevo
- [ ] Vi el mensaje de éxito
- [ ] Inicié sesión correctamente
- [ ] Vi el dashboard
- [ ] Verifiqué los datos en Supabase

---

## 🐛 Si Algo Sale Mal

### Error: "relation does not exist"
**Solución:** Ignóralo, significa que esa tabla ya no existe. Continúa.

### Error: "permission denied"
**Solución:** Asegúrate de estar usando el SQL Editor de Supabase con tu cuenta de administrador.

### Las tablas no se crean
**Solución:**
1. Verifica que ejecutaste 1_BORRAR_TODO.sql primero
2. Refresca la página de Supabase (F5)
3. Ejecuta 2_CREAR_TODO.sql de nuevo

---

**¡Empieza con 1_BORRAR_TODO.sql! 🚀**
