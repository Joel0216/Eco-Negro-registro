-- ============================================
-- BORRAR TABLAS ANTIGUAS
-- ============================================
-- Ejecuta este script PRIMERO para limpiar todo

-- Borrar vistas
DROP VIEW IF EXISTS player_stats;

-- Borrar tablas en orden (por las dependencias)
DROP TABLE IF EXISTS player_achievements CASCADE;
DROP TABLE IF EXISTS achievements CASCADE;
DROP TABLE IF EXISTS player_inventory CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS players CASCADE;

-- Borrar funciones
DROP FUNCTION IF EXISTS calculate_level(INTEGER);
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;

-- Verificar que todo se borró
SELECT 'Tablas restantes:' as status;
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;

-- ============================================
-- LISTO PARA CREAR LAS NUEVAS TABLAS
-- ============================================
-- Ahora ejecuta el script supabase_setup.sql
