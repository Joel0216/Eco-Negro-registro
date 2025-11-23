# 🎯 Guía Completa: Conectar Supabase - Paso a Paso

## 📌 Resumen de lo que Haremos

1. ✅ Ya tienes el proyecto creado en Supabase
2. ⏳ Crear las tablas de la base de datos (SQL)
3. ⏳ Copiar las credenciales
4. ⏳ Configurar la app
5. ⏳ Probar que funciona

---

## 🗄️ PASO 1: Crear las Tablas en Supabase (3 minutos)

### ¿Por qué?
Tu proyecto de Supabase está vacío. Necesitas crear las tablas donde se guardarán los jugadores, transacciones, etc.

### ¿Cómo?

#### 1.1 Ir al Editor SQL

En tu dashboard de Supabase (donde estás ahora):

```
1. Mira el menú lateral izquierdo
2. Busca el ícono que dice "SQL Editor" 📝
3. Haz clic en él
```

Deberías ver algo como esto:
```
┌─────────────────────┐
│ 🏠 Home            │
│ 📊 Table Editor    │
│ 📝 SQL Editor      │ ← HAZ CLIC AQUÍ
│ 🔐 Authentication  │
│ 📦 Storage         │
└─────────────────────┘
```

#### 1.2 Crear Nueva Query

```
1. Verás un botón que dice "+ New query"
2. Haz clic en él
```

#### 1.3 Copiar el Script SQL

En tu proyecto de Flutter, busca el archivo:
```
📁 eco_negro_registro/
  └── 📄 supabase_setup.sql
```

```
1. Abre ese archivo en tu editor de código
2. Selecciona TODO el contenido (Ctrl+A)
3. Copia (Ctrl+C)
```

#### 1.4 Pegar y Ejecutar

```
1. Vuelve a Supabase
2. Pega el código en el editor SQL (Ctrl+V)
3. Verás un botón "Run" (▶️) en la esquina superior derecha
4. Haz clic en "Run" o presiona Ctrl+Enter
```

#### 1.5 Verificar que Funcionó

Deberías ver mensajes como:
```
✅ Success. No rows returned
✅ CREATE TABLE
✅ CREATE INDEX
✅ CREATE POLICY
```

Si ves errores rojos, copia el error y dímelo.

---

## 🔑 PASO 2: Copiar las Credenciales (1 minuto)

### 2.1 Ir a la Configuración de API

```
1. En el menú lateral, busca el ícono de engranaje ⚙️ "Settings"
2. Haz clic en "Settings"
3. En el submenú, haz clic en "API"
```

### 2.2 Copiar Project URL

Verás algo como:
```
┌──────────────────────────────────────────────────┐
│ Project URL                                      │
│ https://xcvrjpyuhqqsqlltuua1.supabase.co   [Copy]│
└──────────────────────────────────────────────────┘
```

```
1. Haz clic en el botón "Copy" al lado de Project URL
2. Pégalo en un bloc de notas temporalmente
```

### 2.3 Copiar anon public Key

Más abajo verás:
```
┌──────────────────────────────────────────────────┐
│ API Key                                          │
│ anon public                                      │
│ eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...    [Copy]│
└──────────────────────────────────────────────────┘
```

⚠️ **MUY IMPORTANTE:**
```
1. Haz clic en "Copy" al lado de "anon public"
2. NO copies el "service_role" (ese es secreto)
3. La key es MUY LARGA (como 200 caracteres)
4. Asegúrate de copiarla COMPLETA
5. Pégala también en tu bloc de notas
```

---

## 💻 PASO 3: Configurar la App (1 minuto)

### 3.1 Abrir el Archivo Main

En tu proyecto de Flutter:
```
📁 eco_negro_registro/
  └── 📁 lib/
      └── 📄 main.dart
```

Abre ese archivo en tu editor.

### 3.2 Buscar las Líneas a Modificar

Busca estas líneas (están cerca del inicio, líneas 13-14):

```dart
const supabaseUrl = 'TU_SUPABASE_URL';
const supabaseAnonKey = 'TU_SUPABASE_ANON_KEY';
```

### 3.3 Reemplazar con tus Credenciales

**ANTES:**
```dart
const supabaseUrl = 'TU_SUPABASE_URL';
const supabaseAnonKey = 'TU_SUPABASE_ANON_KEY';
```

**DESPUÉS:**
```dart
const supabaseUrl = 'https://xcvrjpyuhqqsqlltuua1.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh2Y3JqcHl1aHFxc3FsbHR1dWExIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI0MDI2NzYsImV4cCI6MjA0Nzk3ODY3Nn0.eyJhbGc...';
```

⚠️ **Reemplaza con TUS credenciales, no las del ejemplo**

### 3.4 Guardar el Archivo

```
Ctrl+S (Windows/Linux)
Cmd+S (Mac)
```

---

## 🚀 PASO 4: Ejecutar la App (30 segundos)

### 4.1 Detener la App Actual

Si la app está corriendo:
```
1. Ve a la terminal donde está corriendo
2. Presiona Ctrl+C para detenerla
```

### 4.2 Ejecutar de Nuevo

```bash
flutter run -d chrome
```

### 4.3 Esperar

```
Espera 30-60 segundos mientras compila...
```

---

## ✅ PASO 5: Verificar que Funciona

### 5.1 La App Debería Cargar

Deberías ver:
```
✅ Logo animado (splash screen)
✅ Pantalla de login/registro
✅ Sin errores en la consola
```

### 5.2 Crear una Cuenta de Prueba

```
1. Haz clic en "¿No tienes cuenta? Regístrate"
2. Completa el formulario:
   - Usuario: test_user
   - Email: test@ejemplo.com
   - Contraseña: password123
3. Haz clic en "REGISTRARSE"
```

### 5.3 Verificar en Supabase

```
1. Vuelve a Supabase
2. Ve a "Authentication" en el menú lateral
3. Haz clic en "Users"
4. Deberías ver tu usuario recién creado ✅
```

```
1. Ve a "Table Editor"
2. Selecciona la tabla "players"
3. Deberías ver un registro con tu información ✅
```

---

## 🎉 ¡Listo!

Si llegaste hasta aquí y todo funciona, ¡felicidades! Ya tienes:

✅ Supabase conectado
✅ Base de datos configurada
✅ Autenticación funcionando
✅ Registro de usuarios funcionando

---

## 🐛 Solución de Problemas

### Error: "Invalid API key"

**Causa:** La API key no está bien copiada

**Solución:**
```
1. Vuelve a Supabase → Settings → API
2. Copia de nuevo el "anon public" key
3. Asegúrate de copiarla COMPLETA (es muy larga)
4. Pégala de nuevo en main.dart
5. Guarda y ejecuta de nuevo
```

### Error: "Table 'players' doesn't exist"

**Causa:** No ejecutaste el script SQL

**Solución:**
```
1. Ve a Supabase → SQL Editor
2. Ejecuta el script supabase_setup.sql completo
3. Verifica que no haya errores
4. Ve a Table Editor y verifica que las tablas existan
```

### Error: "CORS policy"

**Causa:** Supabase no permite conexiones desde localhost

**Solución:**
```
1. Ve a Supabase → Settings → API
2. Scroll hasta "CORS"
3. Añade: http://localhost:*
4. Guarda
5. Recarga la app
```

### Error: "Failed to load"

**Causa:** La URL está mal copiada

**Solución:**
```
1. Verifica que la URL empiece con https://
2. Verifica que termine con .supabase.co
3. No debe tener espacios ni saltos de línea
4. Cópiala de nuevo desde Supabase
```

---

## 📊 Checklist Final

Marca cada paso cuando lo completes:

- [ ] Abrí SQL Editor en Supabase
- [ ] Copié el contenido de supabase_setup.sql
- [ ] Pegué y ejecuté el script SQL
- [ ] Vi mensajes de "Success"
- [ ] Verifiqué que las tablas se crearon (Table Editor)
- [ ] Copié el Project URL
- [ ] Copié el anon public key (completo)
- [ ] Abrí lib/main.dart
- [ ] Reemplacé las credenciales
- [ ] Guardé el archivo
- [ ] Ejecuté flutter run -d chrome
- [ ] La app cargó sin errores
- [ ] Pude crear una cuenta de prueba
- [ ] El usuario aparece en Supabase

---

## 🎯 Resumen Visual

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│  1. SUPABASE                                        │
│     ├─ SQL Editor → Ejecutar supabase_setup.sql    │
│     └─ Settings → API → Copiar credenciales        │
│                                                     │
│  2. TU APP                                          │
│     └─ lib/main.dart → Pegar credenciales          │
│                                                     │
│  3. EJECUTAR                                        │
│     └─ flutter run -d chrome                       │
│                                                     │
│  4. PROBAR                                          │
│     └─ Crear cuenta de prueba                      │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## ⏱️ Tiempo Total: 5 minutos

No te saltes ningún paso. Si tienes algún error, revisa la sección de "Solución de Problemas" arriba.

---

## 📞 ¿Necesitas Ayuda?

Si algo no funciona:

1. Copia el mensaje de error completo
2. Dime en qué paso estás
3. Te ayudaré a solucionarlo

---

**¡Empieza con el PASO 1 ahora! 👆**
