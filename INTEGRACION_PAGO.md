# 💳 Guía de Integración de Pasarela de Pago

## Opciones de Pasarelas de Pago

### 1. Stripe (Recomendado) ⭐

**Ventajas:**
- Fácil integración
- Soporte global
- Excelente documentación
- Tarifas competitivas (2.9% + $0.30 por transacción)

**Pasos de Integración:**

1. **Instalar dependencia:**
```yaml
# pubspec.yaml
dependencies:
  flutter_stripe: ^10.1.1
```

2. **Configurar en main.dart:**
```dart
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar Stripe
  Stripe.publishableKey = 'pk_test_tu_clave_publica';
  
  // ... resto del código
}
```

3. **Modificar payment_dialog.dart:**
```dart
Future<void> _processPayment() async {
  try {
    // 1. Crear Payment Intent en tu backend
    final response = await http.post(
      Uri.parse('https://tu-backend.com/create-payment-intent'),
      body: json.encode({
        'amount': (widget.product['price'] * 100).toInt(), // En centavos
        'currency': 'usd',
      }),
    );
    
    final paymentIntent = json.decode(response.body);
    
    // 2. Confirmar pago
    await Stripe.instance.confirmPayment(
      paymentIntentClientSecret: paymentIntent['clientSecret'],
      data: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: BillingDetails(
            name: _nameController.text,
          ),
        ),
      ),
    );
    
    // 3. Actualizar base de datos
    await _updatePlayerCoins();
    
    _showSuccess();
  } catch (e) {
    _showError('Error: $e');
  }
}
```

4. **Crear endpoint en backend (Node.js ejemplo):**
```javascript
const stripe = require('stripe')('sk_test_tu_clave_secreta');

app.post('/create-payment-intent', async (req, res) => {
  const { amount, currency } = req.body;
  
  const paymentIntent = await stripe.paymentIntents.create({
    amount,
    currency,
  });
  
  res.json({ clientSecret: paymentIntent.client_secret });
});
```

---

### 2. PayPal

**Ventajas:**
- Muy conocido por usuarios
- No requiere tarjeta de crédito
- Bueno para mercado internacional

**Pasos de Integración:**

1. **Instalar dependencia:**
```yaml
dependencies:
  flutter_paypal_payment: ^1.0.6
```

2. **Implementar en payment_dialog.dart:**
```dart
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void _processPaymentWithPayPal() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true, // false para producción
        clientId: "TU_CLIENT_ID",
        secretKey: "TU_SECRET_KEY",
        transactions: [
          {
            "amount": {
              "total": widget.product['price'].toString(),
              "currency": "USD",
              "details": {
                "subtotal": widget.product['price'].toString(),
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": widget.product['name'],
            "item_list": {
              "items": [
                {
                  "name": widget.product['name'],
                  "quantity": 1,
                  "price": widget.product['price'].toString(),
                  "currency": "USD"
                }
              ],
            }
          }
        ],
        onSuccess: (Map params) async {
          await _updatePlayerCoins();
          _showSuccess();
        },
        onError: (error) {
          _showError("Error: $error");
        },
        onCancel: () {
          _showError("Pago cancelado");
        },
      ),
    ),
  );
}
```

---

### 3. Mercado Pago (Latinoamérica)

**Ventajas:**
- Ideal para LATAM
- Múltiples métodos de pago locales
- Soporte en español

**Pasos de Integración:**

1. **Instalar dependencia:**
```yaml
dependencies:
  http: ^1.1.0
```

2. **Crear servicio de Mercado Pago:**
```dart
// lib/services/mercadopago_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class MercadoPagoService {
  final String accessToken = 'TU_ACCESS_TOKEN';
  
  Future<Map<String, dynamic>> createPreference({
    required String title,
    required double price,
    required int quantity,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.mercadopago.com/checkout/preferences'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'items': [
          {
            'title': title,
            'quantity': quantity,
            'unit_price': price,
          }
        ],
        'back_urls': {
          'success': 'https://tu-app.com/success',
          'failure': 'https://tu-app.com/failure',
          'pending': 'https://tu-app.com/pending',
        },
        'auto_return': 'approved',
      }),
    );
    
    return json.decode(response.body);
  }
}
```

3. **Usar en payment_dialog.dart:**
```dart
Future<void> _processPaymentWithMercadoPago() async {
  final service = MercadoPagoService();
  
  final preference = await service.createPreference(
    title: widget.product['name'],
    price: widget.product['price'],
    quantity: 1,
  );
  
  // Abrir URL de pago en navegador
  final url = preference['init_point'];
  // Usar url_launcher para abrir
}
```

---

## 🔒 Consideraciones de Seguridad

### NUNCA hagas esto:
❌ Procesar pagos completamente en el cliente
❌ Exponer claves secretas en el código
❌ Confiar solo en validación del cliente

### SIEMPRE haz esto:
✅ Procesar pagos en un backend seguro
✅ Validar transacciones en el servidor
✅ Usar HTTPS para todas las comunicaciones
✅ Implementar webhooks para confirmaciones
✅ Registrar todas las transacciones

---

## 📝 Checklist de Implementación

### Antes de Producción:

- [ ] Configurar cuenta de producción en la pasarela elegida
- [ ] Crear backend seguro para procesar pagos
- [ ] Implementar webhooks para confirmaciones
- [ ] Configurar manejo de errores robusto
- [ ] Implementar sistema de reembolsos
- [ ] Probar con tarjetas de prueba
- [ ] Configurar notificaciones de transacciones
- [ ] Implementar logs de auditoría
- [ ] Revisar cumplimiento PCI DSS
- [ ] Configurar monitoreo de fraude

### Tarjetas de Prueba (Stripe):

```
Éxito: 4242 4242 4242 4242
Requiere autenticación: 4000 0025 0000 3155
Declinada: 4000 0000 0000 9995
CVV: Cualquier 3 dígitos
Fecha: Cualquier fecha futura
```

---

## 🚀 Implementación Rápida (Lunes/Martes)

### Opción Express con Stripe:

1. **Lunes AM:** Crear cuenta Stripe y obtener claves
2. **Lunes PM:** Implementar backend básico (Node.js/Express)
3. **Martes AM:** Integrar en Flutter y probar
4. **Martes PM:** Testing y ajustes finales

### Backend Mínimo (Node.js):

```javascript
const express = require('express');
const stripe = require('stripe')('sk_test_...');
const app = express();

app.use(express.json());

app.post('/create-payment-intent', async (req, res) => {
  const { amount } = req.body;
  
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amount,
    currency: 'usd',
  });
  
  res.json({ clientSecret: paymentIntent.client_secret });
});

app.post('/webhook', async (req, res) => {
  const sig = req.headers['stripe-signature'];
  const event = stripe.webhooks.constructEvent(
    req.body,
    sig,
    'whsec_...'
  );
  
  if (event.type === 'payment_intent.succeeded') {
    // Actualizar base de datos
  }
  
  res.json({ received: true });
});

app.listen(3000);
```

---

## 📞 Soporte

Para dudas sobre la integración:
- Stripe: https://stripe.com/docs
- PayPal: https://developer.paypal.com
- Mercado Pago: https://www.mercadopago.com.mx/developers

---

**Nota:** El código actual tiene una simulación completa. Solo necesitas reemplazar la función `_processPayment()` en `payment_dialog.dart` con la implementación real de tu pasarela elegida.
