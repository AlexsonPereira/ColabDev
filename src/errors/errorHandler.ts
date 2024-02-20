import { NextFunction, Request, Response } from "express";
import { AppError } from "./AppError";
import { ZodError } from "zod";

const errorHandler = (
  error: Error,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (error instanceof AppError) {
    return res.status(error.statusCode).json({ message: error.message });
  }

  if(error instanceof ZodError){
    return res.status(400).json({message : error.message})
  }
  return res.status(500).json({
    message: error.message,
  });
};
export default errorHandler;