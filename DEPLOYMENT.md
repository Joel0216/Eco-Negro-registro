# 🚀 Guía de Deployment - Eco Negro

## 🌐 Opciones de Hosting para Web

### 1. Firebase Hosting (Recomendado) ⭐

**Ventajas:**
- Gratis para proyectos pequeños
- CDN global
- SSL automático
- Fácil integración con Flutter

**Pasos:**

```bash
# 1. Instalar Firebase CLI
npm install -g firebase-tools

# 2. Login en Firebase
firebase login

# 3. Inicializar proyecto
firebase init hosting

# Selecciona:
# - Public directory: build/web
# - Single-page app: Yes
# - Automatic builds: No

# 4. Compilar Flutter
flutter build web --release

# 5. Deploy
firebase deploy --only hosting
```

**Configuración firebase.json:**
```json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

---

### 2. Netlify

**Ventajas:**
- Deploy con drag & drop
- Gratis para proyectos personales
- CI/CD automático con Git

**Opción A: Drag & Drop**
```bash
# 1. Compilar
flutter build web --release

# 2. Ve a netlify.com
# 3. Arrastra la carpeta build/web
```

**Opción B: CLI**
```bash
# 1. Instalar Netlify CLI
npm install -g netlify-cli

# 2. Login
netlify login

# 3. Compilar
flutter build web --release

# 4. Deploy
netlify deploy --prod --dir=build/web
```

**netlify.toml:**
```toml
[build]
  command = "flutter build web --release"
  publish = "build/web"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

---

### 3. Vercel

**Ventajas:**
- Deploy automático desde Git
- Edge network global
- Gratis para proyectos personales

**Pasos:**
```bash
# 1. Instalar Vercel CLI
npm install -g vercel

# 2. Login
vercel login

# 3. Compilar
flutter build web --release

# 4. Deploy
vercel --prod
```

**vercel.json:**
```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
```

---

### 4. GitHub Pages

**Ventajas:**
- Gratis
- Integrado con GitHub
- Fácil de configurar

**Pasos:**
```bash
# 1. Compilar con base-href
flutter build web --release --base-href "/nombre-repo/"

# 2. Crear rama gh-pages
git checkout -b gh-pages

# 3. Copiar build/web a raíz
cp -r build/web/* .

# 4. Commit y push
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages

# 5. Configurar en GitHub:
# Settings → Pages → Source: gh-pages branch
```

---

## 📱 Deployment Móvil

### Android (APK)

```bash
# 1. Compilar APK
flutter build apk --release

# APK estará en: build/app/outputs/flutter-apk/app-release.apk

# 2. Para App Bundle (Google Play)
flutter build appbundle --release

# Bundle estará en: build/app/outputs/bundle/release/app-release.aab
```

**Configurar firma (android/app/build.gradle):**
```gradle
android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

---

### iOS (IPA)

```bash
# 1. Abrir en Xcode
open ios/Runner.xcworkspace

# 2. Configurar:
# - Team
# - Bundle Identifier
# - Signing

# 3. Compilar
flutter build ios --release

# 4. Archive en Xcode
# Product → Archive → Distribute App
```

---

## 🖥️ Deployment Desktop

### Windows

```bash
# Compilar
flutter build windows --release

# Ejecutable en: build/windows/runner/Release/

# Crear instalador con Inno Setup:
# 1. Descargar Inno Setup
# 2. Crear script .iss
# 3. Compilar instalador
```

**Ejemplo installer.iss:**
```iss
[Setup]
AppName=Eco Negro
AppVersion=1.0
DefaultDirName={pf}\EcoNegro
DefaultGroupName=Eco Negro
OutputDir=output
OutputBaseFilename=EcoNegroSetup

[Files]
Source: "build\windows\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs
```

---

### macOS

```bash
# Compilar
flutter build macos --release

# App en: build/macos/Build/Products/Release/

# Crear DMG:
# 1. Usar create-dmg
npm install -g create-dmg
create-dmg build/macos/Build/Products/Release/eco_negro_registro.app
```

---

### Linux

```bash
# Compilar
flutter build linux --release

# Ejecutable en: build/linux/x64/release/bundle/

# Crear .deb:
# Usar flutter_distributor
flutter pub global activate flutter_distributor
flutter_distributor package --platform linux --targets deb
```

---

## 🔧 Configuración Pre-Deploy

### 1. Actualizar Credenciales de Producción

**lib/main.dart:**
```dart
await Supabase.initialize(
  url: 'https://tu-proyecto-prod.supabase.co',  // URL de producción
  anonKey: 'tu-anon-key-de-produccion',         // Key de producción
);
```

### 2. Configurar Variables de Entorno

**Crear .env:**
```bash
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-anon-key
```

**Usar flutter_dotenv:**
```yaml
dependencies:
  flutter_dotenv: ^5.1.0
```

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
}
```

### 3. Optimizar Build

**pubspec.yaml:**
```yaml
flutter:
  uses-material-design: true
  
  # Optimizaciones
  assets:
    - assets/images/
  
  fonts:
    - family: Orbitron
      fonts:
        - asset: fonts/Orbitron-Regular.ttf
```

**Compilar optimizado:**
```bash
flutter build web --release --web-renderer canvaskit
# o
flutter build web --release --web-renderer html
```

---

## 📊 Checklist Pre-Deploy

### Seguridad
- [ ] Credenciales de producción configuradas
- [ ] Variables sensibles en .env
- [ ] .env añadido a .gitignore
- [ ] HTTPS configurado
- [ ] CORS configurado en Supabase

### Performance
- [ ] Imágenes optimizadas
- [ ] Build en modo release
- [ ] Lazy loading implementado
- [ ] Caché configurado

### Funcionalidad
- [ ] Todas las features probadas
- [ ] Formularios validados
- [ ] Errores manejados
- [ ] Loading states implementados
- [ ] Responsive design verificado

### SEO (Web)
- [ ] Meta tags configurados
- [ ] Favicon añadido
- [ ] manifest.json configurado
- [ ] robots.txt creado
- [ ] sitemap.xml generado

---

## 🔍 Testing Pre-Deploy

```bash
# Test en diferentes plataformas
flutter test

# Test de integración
flutter drive --target=test_driver/app.dart

# Análisis de código
flutter analyze

# Verificar dependencias
flutter pub outdated
```

---

## 📈 Monitoreo Post-Deploy

### 1. Analytics

**Añadir Firebase Analytics:**
```yaml
dependencies:
  firebase_analytics: ^10.8.0
```

```dart
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Trackear eventos
analytics.logEvent(
  name: 'purchase',
  parameters: {
    'item_id': productId,
    'price': price,
  },
);
```

### 2. Error Tracking

**Añadir Sentry:**
```yaml
dependencies:
  sentry_flutter: ^7.14.0
```

```dart
await SentryFlutter.init(
  (options) {
    options.dsn = 'tu-sentry-dsn';
  },
  appRunner: () => runApp(MyApp()),
);
```

---

## 🚨 Rollback

Si algo sale mal:

```bash
# Firebase
firebase hosting:rollback

# Netlify
netlify rollback

# Git
git revert HEAD
git push origin main
```

---

## 📝 Comandos Útiles

```bash
# Ver tamaño del build
flutter build web --release --analyze-size

# Limpiar antes de build
flutter clean
flutter pub get
flutter build web --release

# Verificar build
cd build/web
python -m http.server 8000
# Abrir http://localhost:8000
```

---

## 🎯 URLs de Ejemplo

Después del deploy, tu app estará disponible en:

- **Firebase:** `https://tu-proyecto.web.app`
- **Netlify:** `https://tu-proyecto.netlify.app`
- **Vercel:** `https://tu-proyecto.vercel.app`
- **GitHub Pages:** `https://tu-usuario.github.io/repo`

---

## 📞 Troubleshooting

### Error: "Failed to load"
- Verifica CORS en Supabase
- Revisa las credenciales
- Comprueba la consola del navegador

### Error: "White screen"
- Verifica base-href
- Revisa rutas de assets
- Comprueba errores en consola

### Error: "Slow loading"
- Optimiza imágenes
- Usa web-renderer html
- Implementa lazy loading

---

**¡Tu app está lista para el mundo! 🚀**
