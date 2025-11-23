# 🛍️ Catálogo de Productos - Ideas y Ejemplos

## 💰 Paquetes de Monedas

```dart
{
  'id': 'coins_100',
  'name': '100 Monedas',
  'description': 'Pack básico de monedas',
  'price': 0.99,
  'coins': 100,
  'icon': Icons.monetization_on,
},
{
  'id': 'coins_500',
  'name': '500 Monedas',
  'description': 'Pack popular - ¡20% extra!',
  'price': 3.99,
  'coins': 600,  // Bonus incluido
  'icon': Icons.monetization_on,
  'popular': true,
},
{
  'id': 'coins_1000',
  'name': '1000 Monedas',
  'description': 'Pack premium - ¡30% extra!',
  'price': 6.99,
  'coins': 1300,
  'icon': Icons.monetization_on,
},
{
  'id': 'coins_5000',
  'name': '5000 Monedas',
  'description': 'Mega pack - ¡50% extra!',
  'price': 29.99,
  'coins': 7500,
  'icon': Icons.monetization_on,
},
```

---

## ⭐ Membresías VIP

```dart
{
  'id': 'vip_week',
  'name': 'VIP Semanal',
  'description': 'Acceso VIP por 7 días',
  'price': 2.99,
  'duration_days': 7,
  'benefits': [
    'Monedas diarias gratis',
    'Acceso a salas VIP',
    'Sin anuncios',
    'Nombre con color especial'
  ],
  'icon': Icons.star,
},
{
  'id': 'vip_month',
  'name': 'VIP Mensual',
  'description': 'Acceso VIP por 30 días',
  'price': 9.99,
  'duration_days': 30,
  'icon': Icons.star,
  'popular': true,
},
{
  'id': 'vip_year',
  'name': 'VIP Anual',
  'description': '¡Ahorra 40%! VIP por 365 días',
  'price': 69.99,
  'duration_days': 365,
  'icon': Icons.star,
},
```

---

## 🎨 Skins y Personalizaciones

```dart
{
  'id': 'skin_neon',
  'name': 'Skin Neón',
  'description': 'Apariencia futurista brillante',
  'price': 4.99,
  'type': 'skin',
  'rarity': 'rare',
  'icon': Icons.style,
},
{
  'id': 'skin_shadow',
  'name': 'Skin Sombra',
  'description': 'Estilo oscuro y misterioso',
  'price': 4.99,
  'type': 'skin',
  'rarity': 'rare',
  'icon': Icons.style,
},
{
  'id': 'skin_legendary',
  'name': 'Skin Legendaria',
  'description': 'Apariencia única y exclusiva',
  'price': 12.99,
  'type': 'skin',
  'rarity': 'legendary',
  'icon': Icons.style,
  'popular': true,
},
{
  'id': 'avatar_frame_gold',
  'name': 'Marco Dorado',
  'description': 'Marco de avatar premium',
  'price': 2.99,
  'type': 'avatar_frame',
  'icon': Icons.photo_frame,
},
```

---

## ⚡ Power-Ups y Mejoras

```dart
{
  'id': 'power_pack_basic',
  'name': 'Pack de Poder Básico',
  'description': '5 power-ups variados',
  'price': 1.99,
  'items': {
    'speed_boost': 2,
    'shield': 2,
    'double_points': 1,
  },
  'icon': Icons.flash_on,
},
{
  'id': 'power_pack_mega',
  'name': 'Mega Pack de Poder',
  'description': '20 power-ups + bonus',
  'price': 6.99,
  'items': {
    'speed_boost': 8,
    'shield': 6,
    'double_points': 4,
    'invincibility': 2,
  },
  'icon': Icons.flash_on,
  'popular': true,
},
{
  'id': 'revive_token',
  'name': 'Token de Revivir',
  'description': 'Revive instantáneamente',
  'price': 0.99,
  'quantity': 1,
  'icon': Icons.favorite,
},
```

---

## 🎁 Paquetes Especiales

```dart
{
  'id': 'starter_pack',
  'name': 'Pack de Inicio',
  'description': 'Perfecto para nuevos jugadores',
  'price': 4.99,
  'contents': {
    'coins': 500,
    'power_ups': 5,
    'skin': 'basic_premium',
  },
  'icon': Icons.card_giftcard,
  'badge': 'NUEVO',
},
{
  'id': 'battle_pass',
  'name': 'Pase de Batalla',
  'description': 'Temporada actual - 100 niveles',
  'price': 9.99,
  'duration_days': 90,
  'icon': Icons.military_tech,
  'popular': true,
},
{
  'id': 'ultimate_bundle',
  'name': 'Bundle Definitivo',
  'description': '¡Todo lo que necesitas!',
  'price': 49.99,
  'contents': {
    'coins': 10000,
    'vip_days': 30,
    'skins': 5,
    'power_ups': 50,
  },
  'icon': Icons.workspace_premium,
  'discount': '60% OFF',
},
```

---

## 🎯 Ofertas Limitadas

```dart
{
  'id': 'weekend_special',
  'name': 'Oferta de Fin de Semana',
  'description': '¡Solo este fin de semana!',
  'price': 7.99,
  'original_price': 15.99,
  'coins': 2000,
  'expires_at': '2024-12-01',
  'icon': Icons.local_offer,
  'badge': 'OFERTA',
},
{
  'id': 'black_friday',
  'name': 'Black Friday Mega Pack',
  'description': '¡80% de descuento!',
  'price': 19.99,
  'original_price': 99.99,
  'contents': {
    'coins': 15000,
    'vip_days': 90,
    'skins': 10,
  },
  'icon': Icons.celebration,
  'badge': 'BLACK FRIDAY',
},
```

---

## 🏆 Paquetes de Temporada

```dart
{
  'id': 'halloween_pack',
  'name': 'Pack de Halloween',
  'description': 'Contenido exclusivo de Halloween',
  'price': 8.99,
  'seasonal': true,
  'contents': {
    'skin_halloween': 1,
    'coins': 1000,
    'special_emotes': 3,
  },
  'icon': Icons.celebration,
  'available_until': '2024-11-01',
},
{
  'id': 'christmas_pack',
  'name': 'Pack Navideño',
  'description': 'Celebra la navidad con estilo',
  'price': 9.99,
  'seasonal': true,
  'icon': Icons.card_giftcard,
},
```

---

## 💎 Moneda Premium Alternativa

```dart
{
  'id': 'gems_50',
  'name': '50 Gemas',
  'description': 'Moneda premium especial',
  'price': 4.99,
  'gems': 50,
  'icon': Icons.diamond,
},
{
  'id': 'gems_100',
  'name': '100 Gemas',
  'description': 'Pack de gemas - ¡10% extra!',
  'price': 8.99,
  'gems': 110,
  'icon': Icons.diamond,
  'popular': true,
},
```

---

## 🎮 Contenido de Juego

```dart
{
  'id': 'new_map',
  'name': 'Mapa: Ciudad Cyber',
  'description': 'Desbloquea el nuevo mapa',
  'price': 5.99,
  'type': 'map',
  'icon': Icons.map,
},
{
  'id': 'character_unlock',
  'name': 'Personaje: Shadow',
  'description': 'Desbloquea personaje especial',
  'price': 7.99,
  'type': 'character',
  'icon': Icons.person,
},
{
  'id': 'weapon_pack',
  'name': 'Pack de Armas',
  'description': '5 armas exclusivas',
  'price': 6.99,
  'type': 'weapons',
  'icon': Icons.sports_esports,
},
```

---

## 📊 Estrategias de Precios

### Precios Psicológicos:
- $0.99 en lugar de $1.00
- $4.99 en lugar de $5.00
- $9.99 en lugar de $10.00

### Paquetes con Valor:
- Pack pequeño: $0.99 (100 monedas) = $0.0099 por moneda
- Pack mediano: $3.99 (500 monedas) = $0.0080 por moneda ✅ Mejor valor
- Pack grande: $6.99 (1000 monedas) = $0.0070 por moneda ✅✅ Mejor valor

### Ofertas Limitadas:
- Descuentos de 20-50% en eventos especiales
- "Primera compra" con descuento
- Ofertas diarias rotativas

---

## 🎯 Recomendaciones

1. **Empieza Simple:** 3-5 productos básicos
2. **Añade Variedad:** Diferentes rangos de precio
3. **Crea Urgencia:** Ofertas limitadas
4. **Marca Populares:** Destaca los más vendidos
5. **Bundles:** Paquetes con mejor valor
6. **Temporadas:** Contenido exclusivo por tiempo limitado

---

## 📝 Cómo Implementar

Edita `lib/screens/shop_screen.dart`:

```dart
final List<Map<String, dynamic>> _products = [
  // Copia y pega los productos que quieras aquí
  {
    'id': 'coins_100',
    'name': '100 Monedas',
    'description': 'Pack básico de monedas',
    'price': 0.99,
    'coins': 100,
    'icon': Icons.monetization_on,
  },
  // ... más productos
];
```

---

**Tip:** Analiza qué productos se venden más y ajusta tu catálogo basándote en datos reales de tus usuarios.
