# Eco Negro - Sistema de Registro de Jugadores

Sistema de registro y tienda para el juego Eco Negro, con integración de Supabase y pasarela de pago simulada.

## 🚀 Características

- ✅ Registro e inicio de sesión con Supabase Auth
- ✅ Perfil de jugador con estadísticas
- ✅ Tienda con productos simulados
- ✅ Pasarela de pago simulada (lista para integración real)
- ✅ Diseño futurista con animaciones
- ✅ Logo animado con SVG personalizado
- ✅ Responsive y optimizado para web

## 📋 Requisitos Previos

- Flutter SDK (3.10.0 o superior)
- Cuenta de Supabase
- Editor de código (VS Code, Android Studio, etc.)

## 🔧 Configuración de Supabase

### 1. Crear Proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com) y crea una cuenta
2. Crea un nuevo proyecto
3. Guarda tu `URL` y `anon key` del proyecto

### 2. Crear Tablas en Supabase

Ejecuta estos SQL en el editor SQL de Supabase:

```sql
-- Tabla de jugadores
CREATE TABLE players (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE NOT NULL,
  email TEXT NOT NULL,
  coins INTEGER DEFAULT 0,
  points INTEGER DEFAULT 0,
  wins INTEGER DEFAULT 0,
  level INTEGER DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabla de transacciones
CREATE TABLE transactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  product_id TEXT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar Row Level Security
ALTER TABLE players ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

-- Políticas de seguridad para players
CREATE POLICY "Los usuarios pueden ver su propio perfil"
  ON players FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Los usuarios pueden actualizar su propio perfil"
  ON players FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Los usuarios pueden insertar su propio perfil"
  ON players FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Políticas de seguridad para transactions
CREATE POLICY "Los usuarios pueden ver sus propias transacciones"
  ON transactions FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Los usuarios pueden crear transacciones"
  ON transactions FOR INSERT
  WITH CHECK (auth.uid() = user_id);
```

### 3. Configurar Credenciales

Edita el archivo `lib/main.dart` y reemplaza:

```dart
await Supabase.initialize(
  url: 'TU_SUPABASE_URL',  // Reemplaza con tu URL
  anonKey: 'TU_SUPABASE_ANON_KEY',  // Reemplaza con tu anon key
);
```

## 📦 Instalación

1. Clona el repositorio o navega al directorio del proyecto

2. Instala las dependencias:
```bash
flutter pub get
```

3. Ejecuta la aplicación en web:
```bash
flutter run -d chrome
```

O para compilar para producción:
```bash
flutter build web
```

## 🎨 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada y configuración
├── screens/
│   ├── splash_screen.dart    # Pantalla de carga inicial
│   ├── auth_screen.dart      # Login y registro
│   ├── home_screen.dart      # Pantalla principal
│   └── shop_screen.dart      # Tienda de productos
└── widgets/
    ├── animated_logo.dart    # Logo animado personalizado
    ├── custom_text_field.dart # Campo de texto personalizado
    ├── glow_button.dart      # Botón con efecto de brillo
    ├── player_card.dart      # Tarjeta de perfil del jugador
    ├── product_card.dart     # Tarjeta de producto
    └── payment_dialog.dart   # Diálogo de pago
```

## 💳 Integración de Pasarela de Pago

Actualmente la pasarela está simulada. Para integrar una pasarela real:

### Opciones Recomendadas:

1. **Stripe** (Recomendado)
   - Añade `flutter_stripe: ^10.1.1` al pubspec.yaml
   - Configura las claves API
   - Implementa el flujo de pago en `payment_dialog.dart`

2. **PayPal**
   - Usa `flutter_paypal_payment: ^1.0.6`
   - Configura credenciales de PayPal

3. **Mercado Pago** (Para Latinoamérica)
   - Integra el SDK de Mercado Pago
   - Configura credenciales

### Modificar payment_dialog.dart:

Reemplaza la sección `_processPayment()` con tu implementación real:

```dart
Future<void> _processPayment() async {
  // Tu código de integración con la pasarela
  // Ejemplo con Stripe:
  // final paymentIntent = await createPaymentIntent();
  // await Stripe.instance.confirmPayment(...);
}
```

## 🎮 Productos Disponibles (Simulados)

Los productos actuales son de ejemplo. Modifica `shop_screen.dart` para añadir tus productos reales:

```dart
final List<Map<String, dynamic>> _products = [
  {
    'id': 'tu_producto_id',
    'name': 'Nombre del Producto',
    'description': 'Descripción',
    'price': 9.99,
    'coins': 1000,  // Opcional
    'icon': Icons.star,
  },
  // Más productos...
];
```

## 🔐 Seguridad

- ✅ Row Level Security habilitado en Supabase
- ✅ Autenticación segura con Supabase Auth
- ✅ Validación de datos en el cliente
- ⚠️ **IMPORTANTE**: Nunca expongas claves privadas en el código del cliente
- ⚠️ Implementa validación del lado del servidor para pagos reales

## 🎨 Personalización

### Colores del Tema

Edita `main.dart` para cambiar los colores:

```dart
primaryColor: const Color(0xFF00FF41),  // Verde neón
secondary: const Color(0xFF00D9FF),     // Cyan
surface: const Color(0xFF1A1F3A),       // Azul oscuro
```

### Fuentes

El proyecto usa Google Fonts (Orbitron). Para cambiar:

```dart
textTheme: GoogleFonts.tuFuenteTextTheme(ThemeData.dark().textTheme),
```

## 📱 Despliegue

### Firebase Hosting (Recomendado para web)

```bash
flutter build web
firebase init hosting
firebase deploy
```

### Netlify

```bash
flutter build web
# Sube la carpeta build/web a Netlify
```

## 🐛 Solución de Problemas

### Error de CORS con Supabase
- Verifica que la URL de tu app esté en la lista blanca de Supabase
- Ve a Settings > API > URL Configuration

### Problemas con las dependencias
```bash
flutter clean
flutter pub get
```

### Error de compilación web
```bash
flutter channel stable
flutter upgrade
flutter pub upgrade
```

## 📝 Próximos Pasos

- [ ] Integrar pasarela de pago real (Lunes/Martes)
- [ ] Añadir productos reales
- [ ] Implementar sistema de logros
- [ ] Añadir chat en tiempo real
- [ ] Implementar matchmaking
- [ ] Añadir notificaciones push

## 🤝 Contribución

Este es un proyecto privado. Para cambios, contacta al equipo de desarrollo.

## 📄 Licencia

Todos los derechos reservados © 2024 Eco Negro

---

**Nota**: Este sistema está listo para producción excepto por la integración de la pasarela de pago, que debe configurarse con credenciales reales antes del lanzamiento.
