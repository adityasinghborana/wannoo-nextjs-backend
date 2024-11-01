// app/api/continent/route.ts
import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { authenticateRequest } from '../../middleware/auth'; // Adjust the path accordingly

const prisma = new PrismaClient();

export async function GET(req: Request) {
  const authResponse = authenticateRequest(req);
  if (authResponse) {
    return authResponse; // Return unauthorized response if authentication fails
  }

  try {
    const continents = await prisma.continent.findMany();

    if (!continents.length) {
      return NextResponse.json({ message: 'No continents found.' }, { status: 404 });
    }

    return NextResponse.json(continents);
  } catch (error) {
    console.error(error);
    return NextResponse.json({ message: 'An error occurred while fetching continents.' }, { status: 500 });
  }
}
