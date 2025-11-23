# 📁 Estructura del Proyecto Eco Negro

## 🗂️ Árbol de Archivos

```
eco_negro_registro/
│
├── 📄 README.md                    # Documentación principal
├── 📄 INICIO_RAPIDO.md            # Guía de inicio en 5 minutos
├── 📄 INTEGRACION_PAGO.md         # Guía de pasarelas de pago
├── 📄 PRODUCTOS_EJEMPLO.md        # Catálogo de productos
├── 📄 supabase_setup.sql          # Script de configuración DB
├── 📄 .env.example                # Ejemplo de variables de entorno
│
├── 📂 lib/
│   ├── 📄 main.dart               # Punto de entrada + configuración
│   │
│   ├── 📂 screens/                # Pantallas de la aplicación
│   │   ├── 📄 splash_screen.dart      # Pantalla de carga inicial
│   │   ├── 📄 auth_screen.dart        # Login y registro
│   │   ├── 📄 home_screen.dart        # Dashboard principal
│   │   └── 📄 shop_screen.dart        # Tienda de productos
│   │
│   └── 📂 widgets/                # Componentes reutilizables
│       ├── 📄 animated_logo.dart      # Logo animado SVG
│       ├── 📄 custom_text_field.dart  # Input personalizado
│       ├── 📄 glow_button.dart        # Botón con brillo
│       ├── 📄 player_card.dart        # Tarjeta de perfil
│       ├── 📄 product_card.dart       # Tarjeta de producto
│       └── 📄 payment_dialog.dart     # Modal de pago
│
├── 📂 assets/                     # Recursos (crear cuando sea necesario)
│   ├── 📂 images/
│   └── 📂 icons/
│
└── 📄 pubspec.yaml                # Dependencias del proyecto
```

---

## 🎯 Flujo de la Aplicación

```
┌─────────────────┐
│  Splash Screen  │  ← Pantalla inicial con logo animado
└────────┬────────┘
         │
         ├─ Usuario autenticado? ─┐
         │                         │
         NO                       SÍ
         │                         │
         ▼                         ▼
┌─────────────────┐      ┌─────────────────┐
│   Auth Screen   │      │   Home Screen   │
│                 │      │                 │
│  • Login        │      │  • Perfil       │
│  • Registro     │      │  • Estadísticas │
└────────┬────────┘      │  • Menú         │
         │                └────────┬────────┘
         │                         │
         └──────────┬──────────────┘
                    │
                    ▼
           ┌─────────────────┐
           │   Shop Screen   │
           │                 │
           │  • Productos    │
           │  • Categorías   │
           └────────┬────────┘
                    │
                    ▼
           ┌─────────────────┐
           │ Payment Dialog  │
           │                 │
           │  • Formulario   │
           │  • Procesamiento│
           │  • Confirmación │
           └─────────────────┘
```

---

## 🎨 Componentes Visuales

### Pantallas (Screens)

#### 1. Splash Screen
```
┌──────────────────────────┐
│                          │
│     [Logo Animado]       │
│                          │
│      ECO NEGRO          │
│                          │
│    [Loading...]          │
│                          │
└──────────────────────────┘
```

#### 2. Auth Screen
```
┌──────────────────────────┐
│    [Logo]                │
│                          │
│  INICIAR SESIÓN          │
│                          │
│  [📧 Email]              │
│  [🔒 Contraseña]         │
│                          │
│  [  ENTRAR  ]            │
│                          │
│  ¿No tienes cuenta?      │
│  Regístrate              │
└──────────────────────────┘
```

#### 3. Home Screen
```
┌──────────────────────────┐
│ BIENVENIDO        [🚪]   │
│                          │
│ ┌────────────────────┐   │
│ │  [👤] Jugador1    │   │
│ │  Nivel 5          │   │
│ │                   │   │
│ │  💰 1000  ⭐ 500  │   │
│ └────────────────────┘   │
│                          │
│ ┌────────────────────┐   │
│ │ 🛒 TIENDA         │   │
│ │ Compra monedas... │   │
│ └────────────────────┘   │
│                          │
│ ┌────────────────────┐   │
│ │ 👤 PERFIL         │   │
│ └────────────────────┘   │
└──────────────────────────┘
```

#### 4. Shop Screen
```
┌──────────────────────────┐
│ [←] TIENDA               │
│                          │
│ ┌─────┐  ┌─────┐        │
│ │ 💰  │  │ 💰  │        │
│ │ 100 │  │ 500 │        │
│ │$0.99│  │$3.99│        │
│ └─────┘  └─────┘        │
│                          │
│ ┌─────┐  ┌─────┐        │
│ │ ⭐  │  │ 🎨  │        │
│ │ VIP │  │Skin │        │
│ │$9.99│  │$4.99│        │
│ └─────┘  └─────┘        │
└──────────────────────────┘
```

#### 5. Payment Dialog
```
┌──────────────────────────┐
│ Pago Seguro         [✕]  │
│                          │
│ ┌────────────────────┐   │
│ │ 💰 100 Monedas    │   │
│ │ $0.99             │   │
│ └────────────────────┘   │
│                          │
│ [👤 Nombre]              │
│ [💳 Número de tarjeta]   │
│ [📅 MM/AA]  [🔒 CVV]    │
│                          │
│ [   PAGAR AHORA   ]      │
│                          │
│ 🔒 Pago 100% seguro      │
└──────────────────────────┘
```

---

## 🗄️ Estructura de Base de Datos

### Tabla: players
```sql
┌──────────────┬──────────┬─────────────┐
│ Campo        │ Tipo     │ Descripción │
├──────────────┼──────────┼─────────────┤
│ id           │ UUID     │ PK          │
│ user_id      │ UUID     │ FK → auth   │
│ username     │ TEXT     │ Único       │
│ email        │ TEXT     │             │
│ coins        │ INTEGER  │ Monedas     │
│ points       │ INTEGER  │ Puntos      │
│ wins         │ INTEGER  │ Victorias   │
│ level        │ INTEGER  │ Nivel       │
│ created_at   │ TIMESTAMP│             │
└──────────────┴──────────┴─────────────┘
```

### Tabla: transactions
```sql
┌──────────────┬──────────┬─────────────┐
│ Campo        │ Tipo     │ Descripción │
├──────────────┼──────────┼─────────────┤
│ id           │ UUID     │ PK          │
│ user_id      │ UUID     │ FK → auth   │
│ product_id   │ TEXT     │ ID producto │
│ amount       │ DECIMAL  │ Monto       │
│ status       │ TEXT     │ Estado      │
│ created_at   │ TIMESTAMP│             │
└──────────────┴──────────┴─────────────┘
```

---

## 🎨 Paleta de Colores

```
┌─────────────────────────────────────┐
│ Primary (Verde Neón)                │
│ #00FF41 ████████████████████        │
│                                     │
│ Secondary (Cyan)                    │
│ #00D9FF ████████████████████        │
│                                     │
│ Background (Azul Oscuro)            │
│ #0A0E27 ████████████████████        │
│                                     │
│ Surface (Azul Medio)                │
│ #1A1F3A ████████████████████        │
│                                     │
│ Error (Rosa)                        │
│ #FF3366 ████████████████████        │
└─────────────────────────────────────┘
```

---

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Backend y Auth
  supabase_flutter: ^2.5.6      # Base de datos y autenticación
  
  # UI y Animaciones
  animate_do: ^3.3.4            # Animaciones predefinidas
  google_fonts: ^6.2.1          # Fuentes personalizadas
  flutter_svg: ^2.0.10+1        # Soporte SVG
  
  # Iconos
  cupertino_icons: ^1.0.8       # Iconos iOS
```

---

## 🔐 Seguridad Implementada

```
✅ Row Level Security (RLS) en Supabase
✅ Autenticación con JWT
✅ Validación de datos en cliente
✅ Políticas de acceso por usuario
✅ Encriptación de contraseñas
✅ HTTPS obligatorio
```

---

## 🚀 Comandos Principales

```bash
# Desarrollo
flutter run -d chrome              # Ejecutar en navegador
flutter run -d windows             # Ejecutar en Windows
flutter run -d macos               # Ejecutar en macOS

# Producción
flutter build web                  # Compilar para web
flutter build windows              # Compilar para Windows
flutter build apk                  # Compilar para Android

# Mantenimiento
flutter clean                      # Limpiar caché
flutter pub get                    # Instalar dependencias
flutter pub upgrade                # Actualizar dependencias
flutter doctor                     # Verificar instalación
```

---

## 📊 Métricas del Proyecto

```
Líneas de código:     ~1,500
Archivos Dart:        11
Pantallas:            4
Widgets custom:       6
Tablas DB:            5
Tiempo setup:         5 minutos
Tiempo desarrollo:    ~4 horas
```

---

## 🎯 Estado de Funcionalidades

```
✅ Registro de usuarios
✅ Inicio de sesión
✅ Perfil de jugador
✅ Sistema de monedas
✅ Tienda de productos
✅ Simulación de pagos
✅ Animaciones
✅ Diseño responsive
✅ Base de datos configurada
⏳ Pasarela de pago real (Lunes/Martes)
⏳ Productos reales definidos
```

---

## 📝 Archivos de Documentación

```
📄 README.md              → Documentación completa
📄 INICIO_RAPIDO.md       → Setup en 5 minutos
📄 INTEGRACION_PAGO.md    → Guía de pasarelas
📄 PRODUCTOS_EJEMPLO.md   → Catálogo de productos
📄 ESTRUCTURA_PROYECTO.md → Este archivo
📄 supabase_setup.sql     → Script de base de datos
```

---

## 🎓 Conceptos Implementados

- **State Management:** setState (básico)
- **Navigation:** Named routes
- **Authentication:** Supabase Auth
- **Database:** PostgreSQL (Supabase)
- **Animations:** AnimatedBuilder, animate_do
- **Custom Painting:** CustomPainter para logo
- **Responsive Design:** MediaQuery, Flexible layouts
- **Form Validation:** TextEditingController
- **Async Programming:** Future, async/await

---

**Este proyecto está listo para producción excepto por la integración de la pasarela de pago real.**
