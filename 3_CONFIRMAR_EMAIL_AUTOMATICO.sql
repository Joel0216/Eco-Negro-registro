-- ============================================
-- CONFIRMAR EMAIL AUTOMÁTICAMENTE
-- ============================================
-- Este script hace que todos los usuarios nuevos
-- tengan su email confirmado automáticamente

-- 1. Modificar el trigger existente para confirmar email automáticamente
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  -- Insertar en la tabla players
  INSERT INTO public.players (user_id, username, email, coins)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)),
    NEW.email,
    0
  );
  
  -- Confirmar el email automáticamente
  UPDATE auth.users
  SET email_confirmed_at = NOW()
  WHERE id = NEW.id;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Confirmar todos los usuarios existentes que no estén confirmados
UPDATE auth.users 
SET email_confirmed_at = NOW() 
WHERE email_confirmed_at IS NULL;

-- 3. Verificar que funcionó
SELECT 
  email,
  email_confirmed_at,
  CASE 
    WHEN email_confirmed_at IS NOT NULL THEN 'Confirmado ✅'
    ELSE 'No confirmado ❌'
  END as estado
FROM auth.users
ORDER BY created_at DESC;

-- ============================================
-- RESULTADO
-- ============================================
-- Todos los usuarios deberían mostrar "Confirmado ✅"
-- Los nuevos usuarios se confirmarán automáticamente al registrarse
