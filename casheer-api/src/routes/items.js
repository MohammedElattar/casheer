import { Router } from 'express';
import { z } from 'zod';
import { query } from '../db/pool.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';

const router = Router();
router.use(requireAuth);

const ItemBody = z.object({
  code:          z.number().int().positive(),
  name:          z.string().min(1).max(200),
  type_id:       z.string().uuid(),
  default_price: z.number().nonnegative(),
  active:        z.boolean().optional().default(true),
});

router.post('/', requireRole('ADMIN','SUPERVISOR'), async (req, res, next) => {
  try {
    const p = ItemBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const { rows } = await query(
      `INSERT INTO items (code, name, type_id, default_price, active)
       VALUES ($1,$2,$3,$4,$5) RETURNING *`,
      [p.data.code, p.data.name, p.data.type_id, p.data.default_price, p.data.active],
    );
    res.status(201).json({ item: rows[0] });
  } catch (e) { next(e); }
});

router.patch('/:id', requireRole('ADMIN','SUPERVISOR'), async (req, res, next) => {
  try {
    const p = ItemBody.partial().safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const fields = [];
    const vals = [];
    for (const k of ['code','name','type_id','default_price','active']) {
      if (k in p.data) { vals.push(p.data[k]); fields.push(`${k} = $${vals.length}`); }
    }
    if (fields.length === 0) throw new ApiError(400, 'NO_FIELDS', 'no fields to update');
    vals.push(req.params.id);
    const { rows } = await query(
      `UPDATE items SET ${fields.join(', ')} WHERE id = $${vals.length} RETURNING *`,
      vals,
    );
    if (!rows[0]) throw new ApiError(404, 'ITEM_NOT_FOUND', 'item not found');
    res.json({ item: rows[0] });
  } catch (e) { next(e); }
});

router.delete('/:id', requireRole('ADMIN'), async (req, res, next) => {
  try {
    const { rows } = await query(
      `UPDATE items SET active = FALSE WHERE id = $1 RETURNING id, active`,
      [req.params.id],
    );
    if (!rows[0]) throw new ApiError(404, 'ITEM_NOT_FOUND', 'item not found');
    res.json({ item: rows[0] });
  } catch (e) { next(e); }
});

// List items, optionally restricted to a point with its price override.
router.get('/', async (req, res, next) => {
  try {
    const point_id = req.query.point_id;
    if (point_id) {
      const { rows } = await query(
        `SELECT i.id, i.code, i.name, it.id AS type_id, it.name AS type_name,
                COALESCE(pi.price, i.default_price) AS price,
                i.active
           FROM items i
           JOIN item_types it ON it.id = i.type_id
           LEFT JOIN point_items pi ON pi.item_id = i.id AND pi.point_id = $1
          WHERE i.active = TRUE AND it.active = TRUE
          ORDER BY it.code, i.code`,
        [point_id],
      );
      return res.json({ items: rows });
    }
    const { rows } = await query(
      `SELECT i.id, i.code, i.name, it.id AS type_id, it.name AS type_name,
              i.default_price AS price, i.active
         FROM items i
         JOIN item_types it ON it.id = i.type_id
        WHERE i.active = TRUE AND it.active = TRUE
        ORDER BY it.code, i.code`,
    );
    res.json({ items: rows });
  } catch (e) { next(e); }
});

router.get('/types', async (_req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT id, code, name FROM item_types WHERE active = TRUE ORDER BY code`,
    );
    res.json({ types: rows });
  } catch (e) { next(e); }
});

export default router;
