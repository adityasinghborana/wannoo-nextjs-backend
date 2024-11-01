
import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

// Initialize the Prisma client
const prismaClient = new PrismaClient();

export const GET = async () => {
    try {
       // Parse JSON payload from the request
      const result = await prismaClient.tourstaticdata.findMany();
      return NextResponse.json(result );
    } catch (error: unknown) {
      if (error instanceof Error) {
        return NextResponse.json({ error: error.message }, { status: 500 });
      }
      return NextResponse.json({ error: 'An unknown error occurred' }, { status: 500 });
    }
  };