// app/middleware/auth.ts
import { NextResponse } from 'next/server';

export const authenticateRequest = (req: Request) => {
  const apiKey = process.env.API_KEY;
  const apiSecret = process.env.API_SECRET;

  const key = req.headers.get('X-API-KEY'); // Custom header for API Key
  const secret = req.headers.get('X-API-SECRET'); // Custom header for API Secret

  if (key !== apiKey || secret !== apiSecret) {
    return NextResponse.json({ message: 'Unauthorized' }, { status: 401 });
  }

  return null; // No response means authentication passed
};
