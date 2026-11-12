import { Router } from 'express';
import { query } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';

const router = Router();
router.use(requireAuth);

router.get('/', async (_req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT id, code, name, service_percent, min_charge, printer_name,
              weekday_mask, m_status, active
         FROM points WHERE active = TRUE ORDER BY code`,
    );
    res.json({ points: rows });
  } catch (e) { next(e); }
});

router.get('/:id', async (req, res, next) => {
  try {
    const { rows } = await query(`SELECT * FROM points WHERE id = $1`, [req.params.id]);
    if (!rows[0]) return res.status(404).json({ error: { code: 'NOT_FOUND', message: 'point not found' } });
    res.json({ point: rows[0] });
  } catch (e) { next(e); }
});

export default router;
