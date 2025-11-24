import { generateShortCode } from '../utils/generateShortCode.js';

export interface UrlRecord {
  id: number;
  short_code: string;
  original_url: string;
  short_url: string;
  clicks: number;
  created_at: string;
  updated_at: string;
}

const BASE_URL = process.env.BASE_URL || 'http://localhost:5000';

export const shortenUrl = async (originalUrl: string): Promise<any> => {
  let shortCode: string = '';
  let exists = true;

  while (exists) {
    shortCode = generateShortCode();
    const found = await db('urls').where('short_code', shortCode).first();
    if (!found) exists = false;
  }

  const shortUrl = `${BASE_URL}/${shortCode}`;

  const [record] = await db('urls')
    .insert({
      short_code: shortCode,
      original_url: originalUrl.trim(),
      short_url: shortUrl,
    })
    .returning('*');

  return {
    shortCode: record.short_code,
    originalUrl: record.original_url,
    shortUrl: record.short_url,
    clicks: record.clicks,
    createdAt: record.created_at,
  };
};

export const getAllUrls = async () => {
  return await db('urls').select('*').orderBy('created_at', 'desc');
};

export const getUrlByCode = async (code: string) => {
  return await db('urls').where('short_code', code).first();
};