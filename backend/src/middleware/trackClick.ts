import type { Request, Response, NextFunction } from 'express';
import { db } from '../services/urlService.js';

export const trackClick = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const { code } = req.params;

  if (code) {
    try {
      await db('urls')
        .where('short_code', code)
        .increment('clicks', 1)
        .update({ updated_at: db.fn.now() });
    } catch (error) {
      console.error('Error incrementando click:', error);
    }
  }

  next();
};