-- CreateEnum
CREATE TYPE "Role" AS ENUM ('COLLABORATOR', 'ADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "git_hub" TEXT NOT NULL,
    "birthday" TIMESTAMP(3) NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectOnUser" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,

    CONSTRAINT "ProjectOnUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "typeUser" "Role" NOT NULL DEFAULT 'COLLABORATOR',

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TechnologiesOnProject" (
    "id" TEXT NOT NULL,
    "technologieId" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,

    CONSTRAINT "TechnologiesOnProject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technologie" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Technologie_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_git_hub_key" ON "User"("git_hub");

-- CreateIndex
CREATE UNIQUE INDEX "Technologie_name_key" ON "Technologie"("name");

-- AddForeignKey
ALTER TABLE "ProjectOnUser" ADD CONSTRAINT "ProjectOnUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectOnUser" ADD CONSTRAINT "ProjectOnUser_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TechnologiesOnProject" ADD CONSTRAINT "TechnologiesOnProject_technologieId_fkey" FOREIGN KEY ("technologieId") REFERENCES "Technologie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TechnologiesOnProject" ADD CONSTRAINT "TechnologiesOnProject_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
