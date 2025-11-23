# 🚀 Inicio Rápido - Eco Negro Registro

## ⚡ Configuración en 5 Minutos

### 1️⃣ Configurar Supabase (2 minutos)

1. Ve a [supabase.com](https://supabase.com) y crea una cuenta
2. Crea un nuevo proyecto (elige región cercana)
3. Espera a que el proyecto se inicialice
4. Ve a **Settings** → **API**
5. Copia:
   - `Project URL`
   - `anon public` key

### 2️⃣ Configurar Base de Datos (1 minuto)

1. En Supabase, ve a **SQL Editor**
2. Crea una nueva query
3. Copia y pega TODO el contenido de `supabase_setup.sql`
4. Haz clic en **Run** (▶️)
5. Verifica que aparezca "Success" ✅

### 3️⃣ Configurar la App (1 minuto)

Edita `lib/main.dart` líneas 11-12:

```dart
await Supabase.initialize(
  url: 'https://tuproyecto.supabase.co',  // ← Pega tu URL aquí
  anonKey: 'eyJhbGc...tu-key-aqui',        // ← Pega tu anon key aquí
);
```

### 4️⃣ Ejecutar (1 minuto)

```bash
flutter run -d chrome
```

¡Listo! 🎉

---

## 🎮 Probar la Aplicación

### Crear una Cuenta:
1. Haz clic en "¿No tienes cuenta? Regístrate"
2. Ingresa:
   - Usuario: `jugador1`
   - Email: `test@ejemplo.com`
   - Contraseña: `password123`
3. Haz clic en **REGISTRARSE**

### Probar la Tienda:
1. Haz clic en **TIENDA**
2. Selecciona cualquier producto
3. Completa el formulario de pago (simulado):
   - Nombre: `Test User`
   - Tarjeta: `4242 4242 4242 4242`
   - Fecha: `12/25`
   - CVV: `123`
4. Haz clic en **PAGAR AHORA**

---

## 🐛 Solución Rápida de Problemas

### Error: "Invalid API key"
- Verifica que copiaste correctamente la URL y anon key
- Asegúrate de no tener espacios extra

### Error: "Table doesn't exist"
- Ejecuta el script SQL completo en Supabase
- Verifica que todas las tablas se crearon

### Error al compilar
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

### La app no carga
- Verifica tu conexión a internet
- Revisa la consola del navegador (F12)

---

## 📱 Comandos Útiles

```bash
# Ver en navegador
flutter run -d chrome

# Compilar para producción
flutter build web

# Limpiar caché
flutter clean

# Actualizar dependencias
flutter pub upgrade

# Ver dispositivos disponibles
flutter devices
```

---

## 🎨 Personalización Rápida

### Cambiar Colores:
Edita `lib/main.dart` líneas 28-32:

```dart
primaryColor: const Color(0xFF00FF41),  // Verde neón
secondary: const Color(0xFF00D9FF),     // Cyan
```

### Cambiar Nombre:
Edita `lib/screens/splash_screen.dart` línea 52:

```dart
'ECO NEGRO',  // ← Cambia esto
```

---

## 📋 Checklist de Configuración

- [ ] Cuenta de Supabase creada
- [ ] Proyecto de Supabase inicializado
- [ ] Script SQL ejecutado correctamente
- [ ] URL y anon key configuradas en main.dart
- [ ] Dependencias instaladas (`flutter pub get`)
- [ ] App ejecutándose sin errores
- [ ] Registro de usuario funciona
- [ ] Login funciona
- [ ] Tienda se muestra correctamente
- [ ] Simulación de pago funciona

---

## 🎯 Próximos Pasos

1. **Lunes/Martes:** Integrar pasarela de pago real
   - Lee `INTEGRACION_PAGO.md`
   - Elige: Stripe, PayPal o Mercado Pago
   - Configura backend

2. **Definir Productos Reales:**
   - Edita `lib/screens/shop_screen.dart`
   - Actualiza el array `_products`

3. **Personalizar Diseño:**
   - Añade tu logo en `assets/images/`
   - Modifica colores en `lib/main.dart`

4. **Deploy:**
   - Firebase Hosting
   - Netlify
   - Vercel

---

## 💡 Tips

- Usa Chrome DevTools (F12) para debugging
- Revisa la consola de Supabase para ver queries
- Prueba en modo incógnito para simular nuevos usuarios
- Guarda tus credenciales de Supabase en un lugar seguro

---

## 📞 ¿Necesitas Ayuda?

- **Supabase Docs:** https://supabase.com/docs
- **Flutter Docs:** https://docs.flutter.dev
- **Stripe Docs:** https://stripe.com/docs (para pagos)

---

**¡Éxito con tu proyecto! 🚀**
