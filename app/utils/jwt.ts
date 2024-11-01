// app/utils/jwt.ts
import jwt from 'jsonwebtoken';

const SECRET_KEY = process.env.JWT_SECRET || 'your-secret-key'; // Ensure this is kept secret

export const generateToken = (userId: string) => {
  return jwt.sign({ id: userId }, SECRET_KEY, { expiresIn: '1h' }); // Token expires in 1 hour
};

export const verifyToken = (token: string) => {
  try {
    return jwt.verify(token, SECRET_KEY);
  } catch (error) {
    return error; // If token is invalid, return null
  }
};
