-- ============================================
-- PASO 1: BORRAR TODO
-- ============================================
-- Ejecuta este script PRIMERO para borrar todo

-- 1. Borrar triggers
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP TRIGGER IF EXISTS update_players_updated_at ON players;

-- 2. Borrar funciones
DROP FUNCTION IF EXISTS public.handle_new_user() CASCADE;
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;

-- 3. Borrar tablas (en orden por dependencias)
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS players CASCADE;

-- 4. Verificar que todo se borró
SELECT 'Tablas restantes en public:' as status;
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;

-- ============================================
-- RESULTADO ESPERADO
-- ============================================
-- No deberías ver ninguna tabla en el esquema public
-- (o solo tablas del sistema si las hay)

-- ============================================
-- SIGUIENTE PASO
-- ============================================
-- Ahora ejecuta el script: 2_CREAR_TODO.sql
