import { NextResponse } from 'next/server';
import path from 'path';
import { writeFile } from 'fs/promises';

export const config = {
  api: {
    bodyParser: false,
  },
};

export async function POST(req: Request) {
  const formData = await req.formData();
  console.log('Form Data:', formData);
  const file = formData.get('file') as File; // Cast to File type
  if (!file) {
    return NextResponse.json({ error: 'No files received.' }, { status: 400 });
  }

  const buffer = Buffer.from(await file.arrayBuffer());
  const filename = file.name.replace(/ /g, '_'); // Use regex for better performance
  console.log('Filename:', filename);

  try {
    const filePath = path.join('uploads', filename); // Relative path
    await writeFile(path.join(process.cwd(), 'public', filePath), buffer); // Save the file
    return NextResponse.json({ message: 'Success', filePath: filePath }, { status: 201 });
  } catch (error) {
    console.error('Error occurred:', error);
    return NextResponse.json({ message: 'Failed' }, { status: 500 });
  }
}
