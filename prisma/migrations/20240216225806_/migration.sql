/*
  Warnings:

  - You are about to drop the column `accountId` on the `Role` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[roleId]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `roleId` to the `Account` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Role" DROP CONSTRAINT "Role_accountId_fkey";

-- DropIndex
DROP INDEX "Role_accountId_key";

-- AlterTable
ALTER TABLE "Account" ADD COLUMN     "roleId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Role" DROP COLUMN "accountId",
ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Account_roleId_key" ON "Account"("roleId");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
