-- P0-4: brute-force lockout. Records every login attempt by (code, ip).
-- After 5 non-success attempts for a single code within the window,
-- the code is locked for the window duration. Window: 15 min.

CREATE TABLE login_attempts (
  id            BIGSERIAL PRIMARY KEY,
  code          TEXT NOT NULL,
  ip            TEXT,
  success       BOOLEAN NOT NULL,
  attempted_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX ix_login_attempts_code_time
  ON login_attempts (code, attempted_at DESC);

CREATE INDEX ix_login_attempts_time
  ON login_attempts (attempted_at);
