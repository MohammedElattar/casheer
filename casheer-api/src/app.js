import express from 'express';
import cors from 'cors';
import authRoutes         from './routes/auth.js';
import captainOrderRoutes from './routes/captain-orders.js';
import clientRoutes       from './routes/clients.js';
import employeeRoutes     from './routes/employees.js';
import invoiceRoutes      from './routes/invoices.js';
import itemRoutes         from './routes/items.js';
import pointRoutes        from './routes/points.js';
import shiftRoutes        from './routes/shifts.js';
import reportRoutes       from './routes/reports.js';
import { errorHandler, notFound } from './middleware/error.js';

export function createApp() {
  const app = express();
  app.use(cors({ origin: process.env.WEB_ORIGIN || '*', credentials: true }));
  app.use(express.json({ limit: '1mb' }));

  app.get('/health', (_req, res) => res.json({ ok: true, uptime: process.uptime() }));

  app.use('/api/v1/auth',           authRoutes);
  app.use('/api/v1/captain-orders', captainOrderRoutes);
  app.use('/api/v1/clients',        clientRoutes);
  app.use('/api/v1/employees',      employeeRoutes);
  app.use('/api/v1/invoices',       invoiceRoutes);
  app.use('/api/v1/items',     itemRoutes);
  app.use('/api/v1/points',    pointRoutes);
  app.use('/api/v1/shifts',    shiftRoutes);
  app.use('/api/v1/reports',   reportRoutes);

  app.use(notFound);
  app.use(errorHandler);
  return app;
}
