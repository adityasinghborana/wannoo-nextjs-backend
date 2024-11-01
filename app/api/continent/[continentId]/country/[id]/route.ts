// app/api/continent/[id]/route.ts
import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function GET(req: Request, { params }: { params: { id: string } }) {
  const continentId = parseInt(params.id, 10); // Parse the continent ID from params

  try {
    const countries = await prisma.country.findMany({
      where: {
        continentId: continentId, // Filter by continent ID
      },
    });

    if (!countries.length) {
      return NextResponse.json({ message: 'No countries found for this continent.' }, { status: 404 });
    }

    return NextResponse.json(countries);
  } catch (error) {
    console.error(error);
    return NextResponse.json({ message: 'An error occurred while fetching countries.' }, { status: 500 });
  }
}
