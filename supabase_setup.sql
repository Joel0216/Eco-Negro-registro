-- ============================================
-- ECO NEGRO - CONFIGURACIÓN DE BASE DE DATOS SIMPLIFICADA
-- ============================================
-- Ejecuta este script en el editor SQL de Supabase
-- Solo incluye: Registro, Login y Compras

-- 1. CREAR TABLAS
-- ============================================

-- Tabla de jugadores (solo info básica)
CREATE TABLE IF NOT EXISTS players (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE UNIQUE,
  username TEXT UNIQUE NOT NULL,
  email TEXT NOT NULL,
  coins INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabla de transacciones (historial de compras)
CREATE TABLE IF NOT EXISTS transactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  product_id TEXT NOT NULL,
  product_name TEXT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  currency TEXT DEFAULT 'USD',
  status TEXT DEFAULT 'completed' CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
  payment_method TEXT DEFAULT 'card',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. CREAR ÍNDICES PARA MEJOR RENDIMIENTO
-- ============================================

CREATE INDEX IF NOT EXISTS idx_players_user_id ON players(user_id);
CREATE INDEX IF NOT EXISTS idx_players_username ON players(username);
CREATE INDEX IF NOT EXISTS idx_transactions_user_id ON transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_status ON transactions(status);

-- 3. HABILITAR ROW LEVEL SECURITY
-- ============================================

ALTER TABLE players ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

-- 4. CREAR POLÍTICAS DE SEGURIDAD
-- ============================================

-- Políticas para players
DROP POLICY IF EXISTS "Los usuarios pueden ver su propio perfil" ON players;
CREATE POLICY "Los usuarios pueden ver su propio perfil"
  ON players FOR SELECT
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Los usuarios pueden actualizar su propio perfil" ON players;
CREATE POLICY "Los usuarios pueden actualizar su propio perfil"
  ON players FOR UPDATE
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Los usuarios pueden insertar su propio perfil" ON players;
CREATE POLICY "Los usuarios pueden insertar su propio perfil"
  ON players FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Políticas para transactions
DROP POLICY IF EXISTS "Los usuarios pueden ver sus propias transacciones" ON transactions;
CREATE POLICY "Los usuarios pueden ver sus propias transacciones"
  ON transactions FOR SELECT
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Los usuarios pueden crear transacciones" ON transactions;
CREATE POLICY "Los usuarios pueden crear transacciones"
  ON transactions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- 5. CREAR FUNCIONES Y TRIGGERS
-- ============================================

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para players
DROP TRIGGER IF EXISTS update_players_updated_at ON players;
CREATE TRIGGER update_players_updated_at
  BEFORE UPDATE ON players
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- CONFIGURACIÓN COMPLETADA
-- ============================================

-- Verifica que todo se creó correctamente:
SELECT 'Tablas creadas:' as status;
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;

SELECT 'Políticas creadas:' as status;
SELECT tablename, policyname FROM pg_policies WHERE schemaname = 'public' ORDER BY tablename;

-- ============================================
-- RESUMEN
-- ============================================
-- ✅ Tabla players: Información básica del jugador y monedas
-- ✅ Tabla transactions: Historial de compras
-- ✅ Row Level Security: Cada usuario solo ve sus datos
-- ✅ Triggers: Actualización automática de fechas
-- 
-- Listo para:
-- - Registro de usuarios
-- - Inicio de sesión
-- - Compras con simulador de pasarela de pago
-- - Historial de transacciones
