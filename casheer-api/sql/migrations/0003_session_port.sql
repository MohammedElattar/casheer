-- Associate selected port (point_id) and active shift (shift_id) with the employee's session.
ALTER TABLE refresh_tokens
  ADD COLUMN IF NOT EXISTS point_id UUID REFERENCES points(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS shift_id UUID REFERENCES shifts(id) ON DELETE SET NULL;
