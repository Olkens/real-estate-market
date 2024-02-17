/*
  Warnings:

  - You are about to drop the column `personId` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `roleId` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `phoneNumber` on the `person` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[person_id]` on the table `account` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[role_id]` on the table `account` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `person_id` to the `account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role_id` to the `account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone_number` to the `person` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `person` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `role` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "account" DROP CONSTRAINT "account_personId_fkey";

-- DropForeignKey
ALTER TABLE "account" DROP CONSTRAINT "account_roleId_fkey";

-- DropIndex
DROP INDEX "account_personId_key";

-- DropIndex
DROP INDEX "account_roleId_key";

-- AlterTable
ALTER TABLE "account" DROP COLUMN "personId",
DROP COLUMN "roleId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "person_id" INTEGER NOT NULL,
ADD COLUMN     "role_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "person" DROP COLUMN "phoneNumber",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "phone_number" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "role" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "account_person_id_key" ON "account"("person_id");

-- CreateIndex
CREATE UNIQUE INDEX "account_role_id_key" ON "account"("role_id");

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
