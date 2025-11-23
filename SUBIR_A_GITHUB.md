# 📤 Guía para Subir a GitHub

## 🎯 Pasos para Subir el Proyecto

### Paso 1: Preparar el Repositorio Local

Abre la terminal en la carpeta del proyecto y ejecuta:

```bash
# Inicializar Git (si no está inicializado)
git init

# Añadir todos los archivos
git add .

# Hacer el primer commit
git commit -m "Initial commit: Sistema de registro Eco Negro"
```

---

### Paso 2: Conectar con GitHub

```bash
# Conectar con tu repositorio de GitHub
git remote add origin https://github.com/Joel0216/Eco-Negro-registro.git

# Cambiar a la rama main
git branch -M main
```

---

### Paso 3: Subir los Archivos

```bash
# Subir todo a GitHub
git push -u origin main
```

---

## 🔐 Si Pide Autenticación

### Opción 1: Token de Acceso Personal (Recomendado)

1. Ve a GitHub → Settings → Developer settings → Personal access tokens
2. Genera un nuevo token
3. Copia el token
4. Cuando Git pida contraseña, pega el token

### Opción 2: SSH

1. Genera una clave SSH:
```bash
ssh-keygen -t ed25519 -C "joelantoniopool@gmail.com"
```

2. Añade la clave a GitHub:
   - Copia el contenido de `~/.ssh/id_ed25519.pub`
   - Ve a GitHub → Settings → SSH keys → New SSH key
   - Pega la clave

3. Cambia la URL del repositorio:
```bash
git remote set-url origin git@github.com:Joel0216/Eco-Negro-registro.git
```

---

## 📝 Comandos Útiles

### Ver el estado de Git:
```bash
git status
```

### Ver los archivos que se subirán:
```bash
git diff --cached
```

### Ver el historial de commits:
```bash
git log --oneline
```

### Subir cambios nuevos:
```bash
git add .
git commit -m "Descripción de los cambios"
git push
```

---

## 🚨 Si Hay Errores

### Error: "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/Joel0216/Eco-Negro-registro.git
```

### Error: "failed to push some refs"
```bash
# Primero traer los cambios del repositorio
git pull origin main --allow-unrelated-histories

# Luego subir
git push -u origin main
```

### Error: "Permission denied"
- Verifica que tienes permisos en el repositorio
- Usa un token de acceso personal en lugar de contraseña

---

## 📊 Estructura que se Subirá

```
eco_negro_registro/
├── lib/                    # Código de la app
├── assets/                 # Recursos (imágenes, iconos)
├── android/                # Configuración Android
├── ios/                    # Configuración iOS
├── web/                    # Configuración Web
├── *.md                    # Documentación
├── *.sql                   # Scripts de base de datos
├── pubspec.yaml            # Dependencias
└── .gitignore              # Archivos a ignorar
```

**NO se subirán:**
- Carpeta `build/`
- Archivos `.apk`
- Archivos de configuración local
- Credenciales (están en el código pero deberías moverlas a variables de entorno)

---

## ⚠️ IMPORTANTE: Seguridad

### Antes de Subir, Verifica:

1. **NO subas credenciales sensibles:**
   - Las credenciales de Supabase están en `lib/main.dart`
   - Considera usar variables de entorno para producción

2. **Revisa el .gitignore:**
   - Ya está configurado para Flutter
   - Excluye archivos de build y credenciales

3. **Haz el repositorio privado:**
   - Ve a GitHub → Settings del repositorio
   - Cambia la visibilidad a "Private"

---

## 🎯 Comandos Completos (Copia y Pega)

```bash
# 1. Inicializar Git
git init

# 2. Añadir todos los archivos
git add .

# 3. Hacer commit
git commit -m "Initial commit: Sistema de registro Eco Negro"

# 4. Conectar con GitHub
git remote add origin https://github.com/Joel0216/Eco-Negro-registro.git

# 5. Cambiar a rama main
git branch -M main

# 6. Subir a GitHub
git push -u origin main
```

---

## ✅ Verificar que se Subió

1. Ve a: https://github.com/Joel0216/Eco-Negro-registro
2. Deberías ver todos los archivos
3. Verifica que la documentación se vea bien

---

## 📝 Después de Subir

### Para tu compañero:

1. **Clonar el repositorio:**
```bash
git clone https://github.com/Joel0216/Eco-Negro-registro.git
cd Eco-Negro-registro
```

2. **Instalar dependencias:**
```bash
flutter pub get
```

3. **Leer la documentación:**
   - `INICIO_RAPIDO.md`
   - `INSTRUCCIONES_PARA_TIENDA.txt`

---

## 🔄 Trabajar en Equipo

### Tu compañero hace cambios:
```bash
git pull                    # Traer cambios
# Hacer modificaciones
git add .
git commit -m "Implementada tienda con Stripe"
git push
```

### Tú traes sus cambios:
```bash
git pull
```

---

**¡Listo para subir a GitHub! 🚀**
