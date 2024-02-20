import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient({ log: ["query"] });

try {
    prisma.$connect()
} catch (error) {
    console.log(error)
}