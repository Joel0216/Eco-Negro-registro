-- ============================================
-- LIMPIAR DATOS DE PRUEBA
-- ============================================
-- Ejecuta este script para borrar todos los usuarios y datos de prueba

-- 1. Borrar todos los registros de players
DELETE FROM public.players;

-- 2. Borrar todas las transacciones
DELETE FROM public.transactions;

-- 3. Borrar todos los usuarios de autenticación
-- IMPORTANTE: Esto borrará TODOS los usuarios, incluyendo el tuyo
-- Solo ejecuta esto si quieres empezar desde cero

-- Para borrar usuarios específicos, ve a Authentication → Users en Supabase
-- y bórralos manualmente desde la interfaz

-- 4. Verificar que todo se borró
SELECT 'Registros en players:' as tabla, COUNT(*) as total FROM public.players
UNION ALL
SELECT 'Registros en transactions:' as tabla, COUNT(*) as total FROM public.transactions;

-- ============================================
-- RESULTADO ESPERADO
-- ============================================
-- Deberías ver:
-- players: 0
-- transactions: 0
